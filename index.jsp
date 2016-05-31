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
    <link rel="stylesheet" type="text/css" href="http://openlayers.org/en/v3.16.0/css/ol.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css"
    href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='https://fonts.googleapis.com/css?family=Bitter:400,700'
    rel='stylesheet' type='text/css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script src="http://openlayers.org/en/v3.16.0/build/ol.js"></script>
    <script src="script/init_osm_map.js" type="text/javascript"></script>
    <script src="script/configBar.js" type="text/javascript"></script>
  </head>
  <body onload="init_osm ();">
    <%@include file="countDates.jsp" %>
    <div id="mapWrapper">
        <div id="layerConfig">
        <h1>SensorWebView</h1>
            <p>
                <div>
                    <label for="txtRadius">Weight:</label>
                    <input type="text" id="txtRadius" readonly>
                </div>
                <div id="sldRadius"></div>
            <p>
                <div>
                    <label for="txtDate">Date:</label>
                    <input type="text" id="txtDate" readonly>
                </div>
                <div id="sldDate"></div>
            <p>
                <div id="selSensorContainer">
                    <form action="#" class="autoWidth">
                        <fieldset class="autoWidth">
                            <label for="selSensor">Select a Sensor</label>
                            <select name="selSensor" id="selSensor">
                                <option value = "heartrate_int">Heartrate</option>
                                <option value = "respiration_double">Respiration</option>
                                <option value = "breathing_int">Breathing</option>
                            </select>
                        </fieldset>
                    </form>
                </div>
            <hr>
            <p>
                <div>
                    <button id="btnRenderHeatMap">Render Heat Map</button>
                    <button id="btnRemoveHeatMap">Remove Heat Map</button>
                </div>
        </div>
        <div id="osm_map" class="map" tabindex="0"></div>
    </div>
    <button id="zoom-out">Zoom out</button>
    <button id="zoom-in">Zoom in</button>
    <img id="uniLogo" src="./img/uni_sbg_logo.gif"/>
  </body>
</html>
