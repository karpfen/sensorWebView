# SensorWebView

## Description

This web viewer can be used to call a web processing service to generate heat
map layers which are derived from sensor data and display them in a web map.
The generated maps can be tweaked by the user using the provided user interface
for defining kernel density radius, type of sensor and target dates.
The screenshot shows the software's user interface along with some sample output. 

![Screenshot of the web app's user interface][screen]

## Installation

This software is designed to be run as a Tomcat webapp. To install, simply clone
this repository in the Tomcat webapp directory and restart Tomcat. The
application should then be available under `localhost/sensorWebApp`.

The map overlay is generated by a local GeoServer instance with the WPS (Web
Processing Service) extension installed. For further information, see the 
[Tomcat 7](https://tomcat.apache.org/tomcat-7.0-doc/appdev/installation.html), 
[GeoServer](http://docs.geoserver.org/stable/en/user/installation/index.html#installation)
and
[WPS](http://docs.geoserver.org/maintain/en/user/extensions/wps/install.html)
installation guides.

This software was tested successfully using the combination `Tomcat 7`,
`GeoServer 2.8.3` and Java JDK `openjdk version 1.8.0_91` with the data stored
in a `PostgreSQL 9.3` database with a `PostGIS 2.1` extension.

## Configuration

### sensorWebView

The credentials for the database have to be stored in Tomcat's
`conf/dbConfig.xml` in the following form

```xml
<?xml version="1.0" encoding="UTF-8"?>
<config>
    <jdbc>
        <driver>org.postgresql.Driver</driver>
        <url>jdbc:postgresql://myHost.com:5432/dbName</url>
        <username>myUsername</username>
        <password>myPassword</password>
    </jdbc>
</config>
```

### GeoServer

To create heat map layers, the database table has to be published on GeoServer
first. After that, a style has to be defined in form of an SLD document, which is then applied to the 
layer. The file `./sld/sampleStyle.sld` is a template SLD (Style Layer Descriptor)
for use in this application. To use it,
the element `<ogc:Literal>heartrate_int<ogc:Literal>` has to be changed to the
respective table column name from the data to be represented.

## Data Requirements

The data from which the heat maps are derived has to be point data of the
`PostGIS` datatype `geometry` and feature a `timestamp`. Also, at least one weighting factor represented
by a numeric data type has to be present. In this case, these are sensor data.

[screen]: ./img/screen.png "Screenshot of the web app's user interface"
