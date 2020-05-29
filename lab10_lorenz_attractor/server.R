library(shinythemes)
library(deSolve)
library(plotly)
library(htmltools)
library(htmlwidgets)
library(metricsgraphics)
library(DT)

Lorenz <- function(t, state, parameters) {
    with(as.list(c(state, parameters)), {
        dX <- s * (Y - X)
        dY <- X * (r - Z) - Y
        dZ <- X * Y - b * Z
        list(c(dX, dY, dZ))
    })
}


shinyServer(function(input, output, session) {
    
    observeEvent(input$default, {
        updateTextInput(session, inputId = "a", value = 10)
        updateTextInput(session, inputId = "b", value = 2.67)
        updateTextInput(session, inputId = "c", value = 28)
        updateTextInput(session, inputId = "start", value = 0)
        updateTextInput(session, inputId = "end", value = 50)
        updateTextInput(session, inputId = "points", value = 5000)
        updateTextInput(session, inputId = "x", value = 0)
        updateTextInput(session, inputId = "y", value = 1)
        updateTextInput(session, inputId = "z", value = 1)
        updateTextInput(session, inputId = "method", value = "rk4")
    })
    

    parameters <- reactive(
        c(s = input$a, r = input$c, b = input$b))
    state <- reactive(c(X = input$x, Y = input$y, Z = input$z))
    
    times <- reactive(seq(input$start, input$end, by = (input$end-input$start)/input$points))


    
    color <- reactive(input$plotcolor)
    
    result <- reactive(ode(y = state(), times = times(), func = Lorenz, method=input$method,
            parms = parameters()))
    
    output$mainPlot <- renderPlotly({
        data <- as.data.frame(result())
        mainPlot <- plot_ly(data, x = ~X, y = ~Y, z = ~Z,
                            type = 'scatter3d', mode = 'lines', height=800)
        mainPlot$elementId <- NULL
        mainPlot
    })

})




