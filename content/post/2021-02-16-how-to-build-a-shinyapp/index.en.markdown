---
title: "How to build a ShinyApp"
author: "Victor Mandela"
date: '2021-02-16'
slug: how-to-build-a-shinyapp
categories: R
tags:
- Shiny Apps
- Dashboards
subtitle: ''
summary: ''
authors: []
lastmod: '2021-02-16T14:59:44+03:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

## Building a "Hello world shinyApp"

We begin to demonstrate the building blocks of a shinyApp.

An App needs a *User interface (ui)* and a server. The majic about the *shiny package* is that it can create both of this within R, plus run your app using an additionational shiny function.

First,

1. load the library using the shiny.


```r
library(shiny)
```

2. Create ui using the html function


```r
ui <- fluidPage()
```

3. Define a custom function to create the server


```r
server <- function(input,
                   output,
                   session){
  
                   }
```

4. finally run your app.


```r
shinyApp(ui = ui, server = server)
```

## Example1 of shiny app


```r
library(shiny)
library(widgetframe)

ui <- fluidPage(
  "Hello, world!!!!!!"
)
  
server <- function(input,
                   output,
                   session){
  
                   }
  
  
shinyApp(ui = ui, server = server)
```

### Example2: Add a question

We want to go an extra mile an add a text that asks a question. This is possible but adding *textinput* functuion that allows us to enter text. It has three arguments, a unique ID that will be used to refer to this input, a label that is displayed to the user and an optional default value.

Our full out put that is diplayed is contained in the server using the render text function. Inside of that you can use *paste* to create a longer character string. And if add *input$name* you can access the name added using text input. The text is assigned to an output object that will be used in the ui to display.


```r
library(shiny)
library(widgetframe)

ui <- fluidPage(
  textInput("name", "Enter your name:"),
  textOutput("r")
)
  
server <- function(input, output){
  output$r <- renderText({
    paste0("Do you prefer rain or sunshine,", input$name, "?")
  })
  
                   }
  
  
shinyApp(ui = ui, server = server)
```


You did it a text that uses a text input!!


