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

$ (function ()
{
    // Render heat map
    $ ("#btnRenderHeatMap").button ()
    .click (function (event)
    {
        map.removeLayer (heatMapLayer);
        makeHeatMapLayer ();
        map.addLayer (heatMapLayer);
    });

    // Remove heat map
    $ ("#btnRemoveHeatMap").button ()
    .click (function (event)
    {
        map.removeLayer (heatMapLayer);
        alert(count);
    });

    // Radius slider
    $ ("#sldRadius").slider ({
    range: "min",
    value: 50,
    min: 1,
    max: 100,
    slide: function (event, ui)
        {
            $ ("#txtRadius").val (ui.value + " px");
        }
    });
    $ ("#txtRadius").val ($ ("#sldRadius").slider ("value") + " px");

    // Date slider
    $ ("#sldDate").slider ({
    range: true,
    min: 0,
    max: dateCount - 1,
    step: 1,
    values: [(dateCount / 4), (3 * dateCount / 4)],
    slide: function (event, ui)
        {
            $ ("#txtDate").val (dates[ui.values[0]] + " - " +
            dates[ui.values[1]]);
        }
    });
    $ ("txtDate").val ($("#sldDate").slider ("values", 0) + " - " + $
    ("#sldDate").slider ("values", 1));

    // Sensor select
    $ ("#selSensor").selectmenu ();
});
