---
title: 'Interactive plots with Leaflet: Legends'
author: ''
date: '2021-03-23'
slug: interactive-plots-with-leaflet-legends
categories: []
tags:
  - GIS
subtitle: ''
summary: ''
authors: []
lastmod: '2021-03-23T14:14:18+03:00'
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

## Shows how to add a legend using leaflet in R

``` r
# Load the required packages
library(leaflet)
set.seed(122)
# Sample the data for 50 observations
quakes1=quakes[sample(nrow(quakes),50),]

# create earthquake magnitude range to define the type as follows 
quakes1$magrange = cut(quakes1$mag, 
                      breaks = c(4, 5, 6, 7), right=FALSE,
                      labels = c("Light[4-5)", "Moderate[5-6)", "Strong[6-7)"))

# Define a color pallete corresponding to the magnitude ranges
pal = colorFactor(palette = c("yellow", "red", "black"), domain=quakes1$magrange)

# Create the map object & add circle marker
leaflet(data=quakes1) %>% 
  addProviderTiles("Esri.WorldImagery") %>% 
  addCircleMarkers(lng = ~ long, 
                   lat= ~ lat, 
                   color = ~ pal(magrange), #use the pallete
                   label = paste("Magnitude=", quakes1$mag, "Type=", quakes1$magrange)
) %>%  # add legend to the map
  addLegend(position = "bottomright", # position where the legend should appear
            pal = pal, # pallete object where the color is defined
            values = ~magrange, # column variable or values that were used to derive the color pallete object
            title = "Magnitude", # title of the legend
          opacity = 1 # Opacity of legend
          )
```

<div id="htmlwidget-1" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["Esri.WorldImagery",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addCircleMarkers","args":[[-23.6,-18.82,-19.67,-21.3,-13.82,-26.4,-18.49,-19.88,-24.57,-20.02,-20.6,-15.36,-15.77,-15.86,-15.31,-21.85,-11.77,-16.98,-19.22,-17.99,-18.17,-27,-21.75,-24,-22.41,-18.83,-24.09,-11.25,-20.62,-18.56,-14.6,-17.79,-17.4,-16.51,-19.3,-28.56,-22.06,-10.96,-15.43,-18.4,-17.96,-16.65,-18.8,-21.81,-28.1,-35.48,-17.97,-18.92,-20.9,-24.27],[183.99,169.33,182.18,180.92,172.38,181.7,169.04,184.3,178.4,184.09,182.28,186.71,167.01,166.85,186.1,180.89,166.32,185.61,182.54,168.98,181.98,183.88,180.67,182.75,183.99,182.26,179.68,166.36,181.03,169.05,167.4,181.32,181.02,187.1,185.86,183.59,180.6,165.97,186.3,181.77,181.4,185.51,169.21,181.71,182.25,179.9,181.66,169.37,184.28,179.88],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#FF0000","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FF0000","#FF0000","#FF0000","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FF0000","#FFFF00"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#FF0000","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FF0000","#FF0000","#FF0000","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FFFF00","#FF0000","#FF0000","#FFFF00"],"fillOpacity":0.2},null,null,null,null,["Magnitude= 5.4 Type= Moderate[5-6)","Magnitude= 4.4 Type= Light[4-5)","Magnitude= 4.3 Type= Light[4-5)","Magnitude= 4.5 Type= Light[4-5)","Magnitude= 5 Type= Moderate[5-6)","Magnitude= 4.5 Type= Light[4-5)","Magnitude= 4.8 Type= Light[4-5)","Magnitude= 4.4 Type= Light[4-5)","Magnitude= 5.6 Type= Moderate[5-6)","Magnitude= 5.3 Type= Moderate[5-6)","Magnitude= 5 Type= Moderate[5-6)","Magnitude= 5.5 Type= Moderate[5-6)","Magnitude= 5.5 Type= Moderate[5-6)","Magnitude= 4.5 Type= Light[4-5)","Magnitude= 4.6 Type= Light[4-5)","Magnitude= 4.6 Type= Light[4-5)","Magnitude= 4.4 Type= Light[4-5)","Magnitude= 4.1 Type= Light[4-5)","Magnitude= 4.1 Type= Light[4-5)","Magnitude= 4.7 Type= Light[4-5)","Magnitude= 4.8 Type= Light[4-5)","Magnitude= 4.9 Type= Light[4-5)","Magnitude= 4.6 Type= Light[4-5)","Magnitude= 4.5 Type= Light[4-5)","Magnitude= 5.2 Type= Moderate[5-6)","Magnitude= 4.3 Type= Light[4-5)","Magnitude= 4.3 Type= Light[4-5)","Magnitude= 5.1 Type= Moderate[5-6)","Magnitude= 4.2 Type= Light[4-5)","Magnitude= 4.9 Type= Light[4-5)","Magnitude= 4.8 Type= Light[4-5)","Magnitude= 5 Type= Moderate[5-6)","Magnitude= 4.4 Type= Light[4-5)","Magnitude= 4.9 Type= Light[4-5)","Magnitude= 5 Type= Moderate[5-6)","Magnitude= 4.4 Type= Light[4-5)","Magnitude= 4 Type= Light[4-5)","Magnitude= 4.9 Type= Light[4-5)","Magnitude= 4.2 Type= Light[4-5)","Magnitude= 4.1 Type= Light[4-5)","Magnitude= 4.3 Type= Light[4-5)","Magnitude= 5 Type= Moderate[5-6)","Magnitude= 4.4 Type= Light[4-5)","Magnitude= 4.2 Type= Light[4-5)","Magnitude= 4.6 Type= Light[4-5)","Magnitude= 4.8 Type= Light[4-5)","Magnitude= 4.1 Type= Light[4-5)","Magnitude= 5.3 Type= Moderate[5-6)","Magnitude= 5.5 Type= Moderate[5-6)","Magnitude= 4.6 Type= Light[4-5)"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#FFFF00","#FF0000"],"labels":["Light[4-5)","Moderate[5-6)"],"na_color":null,"na_label":"NA","opacity":1,"position":"bottomright","type":"factor","title":"Magnitude","extra":null,"layerId":null,"className":"info legend","group":null}]}],"limits":{"lat":[-35.48,-10.96],"lng":[165.97,187.1]}},"evals":[],"jsHooks":[]}</script>
