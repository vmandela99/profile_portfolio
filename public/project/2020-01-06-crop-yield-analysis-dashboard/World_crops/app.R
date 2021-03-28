library(shiny)
library(tidyverse)
library(plotly)
library(data.table)

yields_tidy <- readRDS("yields_tidy.rds")
top_nine <- yields_tidy %>%
    count(crop, sort = TRUE) %>%
    head(9) 

top_crops <- top_nine%>%
    pull(crop)

ui <- fluidPage(
    
    titlePanel("Crop Yields of all Countries/Continents/Region from 1961 to 2018: Victor Mandela"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("entity",
                        label = "Country Name:",
                        choices = unique(yields_tidy$entity),
                        selected = c("Kenya", "Tanzania"),
                        selectize = TRUE,
                        multiple = TRUE),
            selectInput("crop",
                        label = "Types of Crops:",
                        choices = unique(yields_tidy$crop),
                        selected = top_crops,
                        selectize = TRUE,
                        multiple = TRUE),
            radioButtons("facet_scales",
                         label = "",
                         choices = c("Free y-axis" = "free_y",
                                     "Shared y-axis" = "fixed"))
        ),
        mainPanel(
            plotlyOutput("crop_plot"),
            dataTableOutput("tabled")
        )
    )
)


server <- function(input, output){
    plot_yields <- function(tbl, facet_scales = "fixed") {
        g <- tbl %>%
            mutate(crop = fct_reorder(crop, -yield)) %>%
            mutate(entity = fct_reorder(entity, -yield)) %>%
            ggplot(aes(year, yield, color = entity)) +
            geom_line() +
            expand_limits(y = 0) +
            facet_wrap(~ crop, scales = facet_scales) +
            labs(x = "Year",
                 y = "Yield (tonnes per hectare)",
                 title = "Crop yields over time",
                 color = "Country",
                 caption = "Data source: TidyTuesday")
        
        ggplotly(g)
    }
    
    output$crop_plot <- renderPlotly({
        yields_tidy %>%
            filter(entity %in% input$entity,
                   crop %in% input$crop) %>%
            plot_yields(facet_scales = input$facet_scales)
    })
    
    output$tabled <- renderDataTable(yields_tidy,
                                     options = list(
                                         pageLength = 5
                                     )
    )
    
}
shinyApp(ui = ui, server = server)