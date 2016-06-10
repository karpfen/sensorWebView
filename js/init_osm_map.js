/*
 * Project: Urban Emotions Web Viewer
 * 
 * The Urban Emotions Web Viewer is free software. It can be redistributed and
 * modified under the terms of the GNU General Public Licence as published by the
 * Free Software Foundation, either Version 3 of the license, or (at your option)
 * any later version.
 * 
 * For the license, see <http://www.gnu.org/licenses/>.
 * 
 * Author: Andreas Petutschnig
 * Email: andreas@petutschnig.de
 * 
 * Description: This web viewer can be used to call a web processing service to
 * generate images derived from sensor data and display this data in a web map.
 */

var geoServerWorkspace = "uEmotions";
var geoServerLayerName = "observations_compact";

var heatMapLayer;
var map;

function makeHeatMapLayer ()
{
    // Variables defined by the user
    var radius = $ ("#sldRadius").slider ("option", "value");
    var wmsStyle = $ ("#selSensor").val ();
    var minDate = dates[$ ("#sldDate").slider ("option", "values")[0]];
    if (minDate == undefined)
        minDate = dates[0];
    var maxDate = dates[$ ("#sldDate").slider ("option", "values")[1]];
    if (maxDate == undefined)
        maxDate = dates[dates.length - 1];

    cql_filter = "timestamp >= '" + minDate + "' AND " + "timestamp <= '" +
    maxDate + "'";
    wmsStyle = getHeatmapStyleName (wmsStyle);

    heatMapLayer = new ol.layer.Image ({
        title: 'Heat map',
        source: new ol.source.ImageWMS({
        url: 'http://' + location.hostname + '/geoserver/' + geoServerWorkspace + '/wms',
        params: {LAYERS: geoServerWorkspace + ':' + geoServerLayerName, env: 'radius:' + radius,
        STYLES: "" + wmsStyle, 'cql_filter': cql_filter},
        serverType: 'geoserver'
        })
    });
}

function init_osm ()
{
    var mapLayer = new ol.layer.Tile ({
        source: new ol.source.OSM ()
    });
    makeHeatMapLayer ();

    map = new ol.Map ({
        target: 'osm_map',
        controls: ol.control.defaults ({
            attributionOptions: /** @type {olx.control.AttributionOptions} */ ({
            collapsible: false
            })
        }),
        view: new ol.View ({
            center: [0, 0],
            zoom: 2
        })
    });

    map.addLayer (mapLayer);
    map.addLayer (heatMapLayer);

    setLayerExtent ();
}

function getHeatmapStyleName (wmsStyle)
{
    wmsStyle = wmsStyle.replace ("_int", "");
    wmsStyle = wmsStyle.replace ("_double", "");
    wmsStyle = wmsStyle.replace ("_float", "");
    wmsStyle = "heatmap_" + wmsStyle;
    return wmsStyle;
}

function setLayerExtent ()
{
    var url =
    "http://" + location.hostname + "/geoserver/" + geoServerWorkspace
    + "/ows?service=WFS&version=1.0.0&request=GetCapabilities";

    var xhttp = new XMLHttpRequest ();
    xhttp.open ("GET", url , true);
    xhttp.onreadystatechange = function ()
    {
        if (xhttp.readyState == 4 && xhttp.status == 200)
        {
            var capabilities = xhttp.responseText;
            var capabilitiesXML = jQuery.parseXML (capabilities);
            if (capabilitiesXML)
            {
                var bbox = capabilitiesXML.getElementsByTagName
                ("LatLongBoundingBox");
                var bboxCoords = [0, 0, 0, 0];
                if (bbox.length > 0)
                {
                    bbox = bbox[0];
                    bboxCoords[0] = parseFloat (bbox.getAttribute ("minx"));
                    bboxCoords[1] = parseFloat (bbox.getAttribute ("miny"));
                    bboxCoords[2] = parseFloat (bbox.getAttribute ("maxx"));
                    bboxCoords[3] = parseFloat (bbox.getAttribute ("maxy"));
                    cx = bboxCoords[0] + (bboxCoords[2] - bboxCoords[0]) * 2;
                    cy = bboxCoords[1] + (bboxCoords[3] - bboxCoords[1]) / 2;

                    map.getView ().setCenter (ol.proj.transform
                    ([cx, cy],
                    'EPSG:4326', 'EPSG:3857'));
                    map.getView().setZoom(12);
                }
            }
        }
    };
    xhttp.send ();
}
