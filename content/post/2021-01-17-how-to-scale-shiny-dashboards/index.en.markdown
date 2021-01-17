---
title: How to Scale Shiny Dashboards
author: Victor Mandela
date: '2021-01-17'
slug: how-to-scale-shiny-dashboards
categories:
  - R
tags:
  - Academic
subtitle: ''
summary: ''
authors: []
lastmod: '2021-01-17T14:39:45+03:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

Most of the comments I get after sharing mock up and prototype shiny applications are:-

- I love this app
- How fast did you add this features!!
- This is exactly what I need in my daily job at the company.

Most of the people commenting, have never seen shiny applications before, know nothing about `R` and they don't really care that its running at the back of the application.

## Challenges Faced by the developer.

-------------------------------------------

The common problems I have faced are:-

1. Customizing user interface

2. Increasing the user experience part

3. Scaling

## Scalable Applications

Before we go into the remedies for this problems, I would first want us to understand the kinds of scaling there is:-

* Vertical Scaling

    - this is where we aim at ** increasing the amount of users for one machine**.

* Horizontal scaling 

    - Scaling the application across multiple machines
    
![Scaling](Scaling.jpg)

## Solutions to your Scaling Shiny dashboards

Before we explain this are the main power points in brief:-

a) Leveraging front end 
   - Use Javascript to handle fast user interactions that do not change data.
   
b) Extract Computation
   - Handle resource intensive operations away from the application.
   - Using external source to do the computation will assist.

c) Set Architecture 
   -  Prepare applications to be used by many users.
   
**The Main aim** is to make shiny layer thin. Shiny should be a thin layer between the data and the interface.
   
## Using the power of the browser

This is what you should do:-

1). Render the input in `ui.R` and only update them in `server.R`.

2). Run inline Javascript code with `{Shinyjs}` package.

3). Set all actions in Javascript without `server.R` part.


```r
ui <- fluidPage(
  actionButton(
    "Click_Button",
    label = "I will update icon!",
    onclick = "$('mjs_update > i').toggle class('fa-arrow-up');"
    )
  )
```

## Extract Computation: Remote API

Creating a API has been made achievable by use of the `plumber` package.

* Load only what is needed.

  - The entire dataset is rarely needed in the application. Usually the first user action within the app is to filter/select a subset of data. First select them load.
  
* Build Rest API

  - Wrap data extraction login into a simple API with `{Plumber}` by adding special comments.

* Deploy Easily
  - Use Rstudio connect or Docker to host your API.
  
## Extract computation: Using Database

Many may ask, **Why use Data base?"


```r
ui <- fluidPage(....)

data <- readRDS("./1gb-file.rds")

Server <- function(input, output, session){
  
  output$search_result <- ... data %>% filter(value > input$query_value)
}

shinyApp(ui = ui, server = server)
```

Because It reduces the amount of RAM used when you have many users. Its easy sinec you use the `dplyr` package to manipulate the database.

## Set Architecture

When deploying in the shiny server open source, you can use **Ansible** to provision the infrastructure.
