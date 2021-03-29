---
title: 'Interactive plots with leaflet: adding circle markers'
author: ''
date: '2021-03-23'
slug: interactive-plots-with-leaflet-adding-circle-markers
categories: []
tags:
  - GIS
subtitle: ''
summary: ''
authors: []
lastmod: '2021-03-23T14:11:28+03:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

<script src="{{< blogdown/postref >}}index.en_files/htmlwidgets/htmlwidgets.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/jquery/jquery.min.js"></script>
<link href="{{< blogdown/postref >}}index.en_files/leaflet/leaflet.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.en_files/leaflet/leaflet.js"></script>
<link href="{{< blogdown/postref >}}index.en_files/leafletfix/leafletfix.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.en_files/proj4/proj4.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/Proj4Leaflet/proj4leaflet.js"></script>
<link href="{{< blogdown/postref >}}index.en_files/rstudio_leaflet/rstudio_leaflet.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index.en_files/leaflet-binding/leaflet.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/leaflet-providers/leaflet-providers_1.9.0.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/leaflet-providers-plugin/leaflet-providers-plugin.js"></script>

## Adding Circle markers using leaflet in R

``` r
## addCircleMarkers() function
## We will use the quakes data for demo and maping

# Load the required packages
library(leaflet)

# Sample the quakes data with 10 data points to avoid cluttering
quakes1 = quakes[sample(nrow(quakes), 10), ]

# Create the map object & add circle marker
leaflet(data=quakes1) %>% # initialize the map object
  addProviderTiles("Esri.WorldImagery") %>%  # add 3rd party map base tile
  # addMarkers(lng = ~ long, lat=~ lat) %>% 
  addCircleMarkers(lng = ~ long, 
                   lat= ~ lat) # add Circle Markers
```

<div id="htmlwidget-1" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["Esri.WorldImagery",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addCircleMarkers","args":[[-19.1,-29.09,-12.85,-17.61,-15.2,-17.8,-22.2,-27.54,-14.65,-24.97],[183.87,183.2,165.67,183.32,184.68,181.35,180.58,182.5,166.97,179.82],10,null,null,{"interactive":true,"className":"","stroke":true,"color":"#03F","weight":5,"opacity":0.5,"fill":true,"fillColor":"#03F","fillOpacity":0.2},null,null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[-29.09,-12.85],"lng":[165.67,184.68]}},"evals":[],"jsHooks":[]}</script>
