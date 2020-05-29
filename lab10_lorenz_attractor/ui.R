library(shiny)
library(shinydashboard)
library(plotly)
library(metricsgraphics)
library(DT)

shiny::fluidPage(theme = shinythemes::shinytheme("paper"),  
                 includeCSS("my_styles.css"),

shiny::div(style="display: flex;align-items: center;justify-content: space-evenly;",
    shiny::titlePanel("Atraktor Lorenza", windowTitle = "Atraktor Lorenza - Autor: Jacek Nitychoruk")),
shiny::sidebarLayout(
  
  shiny::div(style="margin-top:10px;",
        shiny::sidebarPanel(width=3,
                            shiny::tags$head(shiny::tags$script('$(document).on("shiny:connected", function(e) {
                  Shiny.onInputChange("innerWidth", window.innerWidth);
                  });
                  $(window).resize(function(e) {
                  Shiny.onInputChange("innerWidth", window.innerWidth);
                  });
                  ')),
                            
              shiny::HTML('<div style="display:flex; flex-direction: row; justify-content: center; align-items:center; margin-bottom:5px;"><h5>Układy równań:</h5></div>'),
                            
      # shiny::div(style="display: flex;align-items: center;justify-content: space-evenly; margin-bottom:10px;",
      # shiny::actionButton("preset1", "Paproć", width="30%"),
      # shiny::actionButton("preset2", "Spirala", width="30%")),
      
      shiny::withMathJax(shiny::HTML('<div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px; margin-bottom:10px">
      <div style="margin: 0 5px;"> $$ \\frac{\\partial x}{\\partial t} = $$</div>
      <input style="max-width: 50px" id="a" type="number" class="form-control" value="10" min="-50" max="50" step="0.1" />
      <div style="margin: 0 5px"> $$ (y-x)$$</div>
      </div>
    <div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px; margin-bottom:15px; margin-left:25px ">
      <div style="margin: 0 5px;"> $$ \\frac{\\partial y}{\\partial t} = x ( $$</div>
      <input style="max-width: 50px" id="c" type="number" class="form-control" value="28" min="-50" max="50" step="0.1" />
      <div style="margin: 0 5px"> $$ - z) - y $$</div>
      </div>
    <div class="" style="margin-bottom:10px; display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px ">
      <div style="margin: 0 5px 0 0;"> $$ \\frac{\\partial z}{\\partial t} = xy - $$</div>
      <input style="max-width: 50px" id="b" type="number" class="form-control" value="2.67" min="-50" max="50" step="0.01" />
      <div style="margin: 0 10px"> $$z $$</div>
      </div>')),
      
      shiny::hr(),
      
      shiny::HTML('<div style="display:flex; flex-direction: column; justify-content: center; align-items:center">
                  <label style="width:200px" class="control-label" for="start">Zakres czasu:</label>
                    <div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 14px; margin-bottom:20px">
                          <input style="max-width: 80px" id="start" type="number" class="form-control" value="0" min="0" max="100" step="0.1" />
      <div style="margin: 0 15px"> -</div>
      <input style="max-width: 80px" id="end" type="number" class="form-control" value="50" min="0" max="100" step="0.1" />
                    </div></div>'),
      
      shiny::div(style="display: flex;align-items: center;justify-content: space-evenly; margin-bottom:30px;",
      shiny::numericInput("points", "Liczba punktów:", 5000,
                          min = , max = 10000)),
      

       
      shiny::HTML('<div style="display:flex; flex-direction: column; justify-content: center; align-items:center">
                  <label style="width:200px" class="control-label" for="start">Wartości początkowe:</label>
                    <div class="" style="display:flex; flex-direction: column; justify-content: center; align-items:flex-start; font-size: 16px; margin-bottom:20px; width:220px">
       
       <div style="display:flex; flex-direction: row; justify-content: center; align-items:center">            
      <div style="margin: 0 15px">$$x = $$</div>
      <input style="max-width: 80px" id="x" type="number" class="form-control" value="0" min="0" max="100" step="0.1" />
      </div>
             <div style=display:flex; flex-direction: row; justify-content: center; align-items:center>    
      <div style="margin: 0 15px">$$y = $$</div>
      <input style="max-width: 80px" id="y" type="number" class="form-control" value="1" min="0" max="100" step="0.1" /></div>
             <div style=display:flex; flex-direction: row; justify-content: center; align-items:center>    
      <div style="margin: 0 15px">$$z = $$</div>
      <input style="max-width: 80px" id="z" type="number" class="form-control" value="1" min="0" max="100" step="0.1" /></div>    
                    </div></div>'),
      shiny::div(style='width:200px; margin:auto',
       shiny::selectInput("method", "Metoda obliczeń:",
                          choices = list("Lsoda" = "lsoda", "Lsode" = "lsode", 
                                         "Lsodes" = "lsodes", "Lsodar" = "lsodar",
                                         "Vode" = "vode", "Daspk" = "daspk",
                                         "Eulera" = "euler", "Rungego-Kutty" = "rk4",
                                         "ODE23" = "ode23", "ODE45" = "ode45",
                                         "Radau" = "radau", "BDF" = "bdf",
                                         "Adams" = "adams",
                                         "implicit Adams " = "impAdams"),
                          selected = "rk4")),
      
      shiny::div(style="display: flex;align-items: center;justify-content: space-evenly; margin-bottom:30px;",
                 shiny::actionButton("default", "Parametry domyślne")),
   shiny::hr(),

  )),
  # Show a plot of the generated distribution
  shiny::div(style="height:auto",
    shiny::mainPanel(width=9,
            
            #shiny::HTML('<div id="mainPlot" class="shiny-plot-output" style="width: 100%; height: auto "></div>')
            plotlyOutput("mainPlot")
  )
)),
shiny::hr(),
shiny::div(style="padding-bottom: 10px; display: flex;align-items: center;justify-content: space-evenly;" ,"Jacek Nitychoruk © Metody Obliczeniowe w Nauce i Technice 2020  "))
