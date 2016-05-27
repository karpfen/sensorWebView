<%--
Project: Urban Emotions Web Viewer

The Urban Emotions Web Viewer is free software. It can be redistributed and
modified under the terms of the GNU General Public Licence as published by the
Free Software Foundation, either Version 3 of the license, or (at your option)
any later version.

For the license, see <http://www.gnu.org/licenses/>.

Author: Andreas Petutschnig
Email: andreas@petutschnig.de

Description: This web viewer can be used to call a web processing service to
generate images derived from sensor data and display this data in a web map.
--%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8"> 
    <title>Urban Emotions Web Viewer</title>
    <link rel="stylesheet" href="http://openlayers.org/en/v3.16.0/css/ol.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
    <script src="http://openlayers.org/en/v3.16.0/build/ol.js"></script>
    <script src="script/init_osm_map.js" type="text/javascript"></script>
    <script src="script/configBar.js" type="text/javascript"></script>
  </head>
  <body onload="init_osm ();">
    <div id="layerConfig">
        <input id="radiusSlider" type="range" min="1" max="100" step="1"
        onchange="updateRadiusValue (radiusSlider.value)"/>
        <input id="radiusValue" type="number" min="1" max="100" value="50"
        onchange="updateRadiusSlider (radiusValue.value)"/>
        <button onclick="reloadHeatMap ()">Render Heat Map</button>
        <button onclick="removeHeatMap ()">Remove Heat Map</button>
        <select id="styleSelector">
        <option value = "heartrate_int">heartrate_int</option>
        <option value = "respiration_double">respiration_double</option>
        <option value = "breathing_int">breathing_int</option>
        </select>
        <%@include file="dbAccess.jsp" %>
    </div>
    <div id="osm_map" class="map" tabindex="0"></div>
    <button id="zoom-out">Zoom out</button>
    <button id="zoom-in">Zoom in</button>
  </body>
</html>
