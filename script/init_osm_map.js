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

var heatMapLayer;
var map;

function makeHeatMapLayer ()
{
    // Variables defined by the user
    var radius = document.getElementById ("radiusSlider").value;

    heatMapLayer = new ol.layer.Tile ({
        title: 'Heat map',
        source: new ol.source.TileWMS({
        url: 'http://localhost:8080/geoserver/uEmotions/wms',
        params: {LAYERS: 'uEmotions:observations_compact', VERSION: '1.1.1',
        env: 'radius:' + radius}
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

    document.getElementById ('zoom-out').onclick = function () {
        var view = map.getView ();
        var zoom = view.getZoom ();
        view.setZoom (zoom - 1);
    };

    document.getElementById ('zoom-in').onclick = function () {
        var view = map.getView ();
        var zoom = view.getZoom ();
        view.setZoom (zoom + 1);
    };
}
