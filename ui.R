#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict MPG from Horsepower"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderHP", "What is the horsepower of the car?", 50, 335, value = 100),
            checkboxInput("checkMT", "Manual Transmission", value = TRUE),
            
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted MPG from Horsepower:"),
            textOutput("pred1"),
            
        )
    )
))
