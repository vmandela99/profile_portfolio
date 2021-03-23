---
title: 'Interactive plots with Leaflet: Part1'
author: ''
date: '2021-03-23'
slug: interactive-plots-with-leaflet-part1
categories: []
tags:
  - GIS
subtitle: ''
summary: ''
authors: []
lastmod: '2021-03-23T12:21:14+03:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
runtime: shiny
output:
  blogdown::html_page:
    toc: false
---

## Circle markers palletes

For you to plot this circle markers you need to load the `leaflet` package.


```r
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

                   )
```

```
## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

```
## Error in path.expand(path): invalid 'path' argument
```

