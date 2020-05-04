#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
shinyServer(function(input, output) {
    
    
        
    model1 <- lm(mpg ~ am + hp, data = mtcars)


    model1pred <- reactive({
        ifelse(input$checkMT,(mt <- 1), (mt <- 0))
        hpInput <- input$sliderHP
        predict(model1, newdata = data.frame(am = mt, hp = hpInput))
    })


    output$plot1 <- renderPlot({
        hpInput <- input$sliderHP

        plot(mtcars$hp, mtcars$mpg, ylab = "Miles Per Gallon",
             xlab = "Horsepower", bty = "n", pch = 16,
             xlim = c(50, 350), ylim = c(1, 35))
        abline(model1, col = "red", lwd = 2)

        legend(25, 250, c("Model Prediction"), pch = 16,
               col = c("red"), bty = "n", cex = 1.2)
        points(hpInput, model1pred(), col = "red", pch = 16, cex = 2)
    })

    output$pred1 <- renderText({
        c(round(model1pred(),4),"miles per gallon")
    })
    
})
