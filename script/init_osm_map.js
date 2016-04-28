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

function init_osm()
{
      var map = new ol.Map({
        layers: [
          new ol.layer.Tile({
            source: new ol.source.OSM()
          })
        ],
        target: 'osm_map',
        controls: ol.control.defaults({
          attributionOptions: /** @type {olx.control.AttributionOptions} */ ({
            collapsible: false
          })
        }),
        view: new ol.View({
          center: [0, 0],
          zoom: 2
        })
      });

      document.getElementById('zoom-out').onclick = function() {
        var view = map.getView();
        var zoom = view.getZoom();
        view.setZoom(zoom - 1);
      };

      document.getElementById('zoom-in').onclick = function() {
        var view = map.getView();
        var zoom = view.getZoom();
        view.setZoom(zoom + 1);
      };
}
