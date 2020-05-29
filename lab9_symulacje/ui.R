shiny::fluidPage(theme = shinythemes::shinytheme("paper"),  
                 includeCSS("my_styles.css"),

shiny::div(style="display: flex;align-items: center;justify-content: space-evenly;",
    shiny::titlePanel("Generator fraktali IFS", windowTitle = "Generator fraktali IFS - Autor: Jacek Nitychoruk")),
shiny::sidebarLayout(
  
  shiny::div(style="margin-top:10px;",
        shiny::sidebarPanel(width=5,
                            shiny::tags$head(shiny::tags$script('$(document).on("shiny:connected", function(e) {
                  Shiny.onInputChange("innerWidth", window.innerWidth);
                  });
                  $(window).resize(function(e) {
                  Shiny.onInputChange("innerWidth", window.innerWidth);
                  });
                  ')),
                            shiny::h5("Przykłady:"),
       shiny::div(style="display: flex;align-items: center;justify-content: space-evenly; margin-bottom:10px;",
           shiny::actionButton("preset1", "Paproć", width="30%"),
       shiny::actionButton("preset2", "Spirala", width="30%"),
       shiny::actionButton("preset3", "Smok", width="30%")),
       
       shiny::selectInput("plotcolor", "Kolor fraktala:",
                   list("Czarny" = "black", "Czerwony" = "darkred", "Zielony" = "darkgreen", "Niebieski" = "darkblue"),
                   selected = "darkgreen"
       ),
       shiny::numericInput("points", "Generowane punkty:", 100000,
                min = 1, max = 1000000),
   shiny::sliderInput("p1",
                "Prawdopodobieństwo f1(x,y):",
                min = 0,
                max = 1,
                value = 0.85),
   shiny::withMathJax(shiny::HTML('<div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px ">
      <div style="margin: 0 10px;">$$f_1(x, y)=($$</div>
      <input style="max-width: 50px" id="f1_xx" type="number" class="form-control" value="0.85" min="-2" max="2" step="0.01" />
      <div style="margin: 0 10px"> $$ x + $$</div>
      <input style="max-width: 50px" id="f1_xy" type="number" class="form-control" value="0.04" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ y + $$ </div>
      <input style="max-width: 50px" id="f1_xr" type="number" class="form-control" value="0" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px">$$ , $$</div>
  </div>
  <div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px  ">
      <div style="margin: 0 10px 0 100px"> </div>
      <input style="max-width: 50px" id="f1_yx" type="number" class="form-control" value="-0.04" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ x + $$ </div>
      <input style="max-width: 50px" id="f1_yy" type="number" class="form-control" value="0.85" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ y + $$</div>
      <input style="max-width: 50px" id="f1_yr" type="number" class="form-control" value="1.6" min="-2" max="2" step="0.01""/>
      <div style="margin: 0 10px"> $$ ) $$</div>
  </div>')),
   shiny::sliderInput("p2",
                "Prawdopodobieństwo f2(x,y):",
                min = 0,
                max = 1,
                value = 0.07),
   shiny::withMathJax(shiny::HTML('<div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px ">
      <div style="margin: 0 10px;">$$f_2(x, y)=($$</div>
      <input style="max-width: 50px" id="f2_xx" type="number" class="form-control" value="-0.15" min="-2" max="2" step="0.01" />
      <div style="margin: 0 10px"> $$ x + $$</div>
      <input style="max-width: 50px" id="f2_xy" type="number" class="form-control" value="0.28" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ y + $$ </div>
      <input style="max-width: 50px" id="f2_xr" type="number" class="form-control" value="0" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px">$$ , $$</div>
  </div>
  <div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px  ">
      <div style="margin: 0 10px 0 100px"> </div>
      <input style="max-width: 50px" id="f2_yx" type="number" class="form-control" value="0.26" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ x + $$ </div>
      <input style="max-width: 50px" id="f2_yy" type="number" class="form-control" value="0.24" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ y + $$</div>
      <input style="max-width: 50px" id="f2_yr" type="number" class="form-control" value="0.44" min="-2" max="2" step="0.01""/>
      <div style="margin: 0 10px"> $$ ) $$</div>
  </div>')),
   shiny::sliderInput("p3",
                "Prawdopodobieństwo f3(x,y):",
                min = 0,
                max = 1,
                value = 0.07),
   shiny::withMathJax(shiny::HTML('<div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px ">
      <div style="margin: 0 10px;">$$f_3(x, y)=($$</div>
      <input style="max-width: 50px" id="f3_xx" type="number" class="form-control" value="0.20" min="-2" max="2" step="0.01" />
      <div style="margin: 0 10px"> $$ x + $$</div>
      <input style="max-width: 50px" id="f3_xy" type="number" class="form-control" value="-0.26" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ y + $$ </div>
      <input style="max-width: 50px" id="f3_xr" type="number" class="form-control" value="0" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px">$$ , $$</div>
  </div>
  <div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px  ">
      <div style="margin: 0 10px 0 100px"> </div>
      <input style="max-width: 50px" id="f3_yx" type="number" class="form-control" value="0.23" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ x + $$ </div>
      <input style="max-width: 50px" id="f3_yy" type="number" class="form-control" value="0.22" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ y + $$</div>
      <input style="max-width: 50px" id="f3_yr" type="number" class="form-control" value="1.6" min="-2" max="2" step="0.01""/>
      <div style="margin: 0 10px"> $$ ) $$</div>
  </div>')),
    
   shiny::sliderInput("p4",
                "Prawdopodobieństwo f4(x,y):",
                min = 0,
                max = 1,
                value = 0.01),
   shiny::withMathJax(shiny::HTML('<div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px ">
      <div style="margin: 0 10px;">$$f_4(x, y)=($$</div>
      <input style="max-width: 50px" id="f4_xx" type="number" class="form-control" value="0" min="-2" max="2" step="0.01" />
      <div style="margin: 0 10px"> $$ x + $$</div>
      <input style="max-width: 50px" id="f4_xy" type="number" class="form-control" value="0" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ y + $$ </div>
      <input style="max-width: 50px" id="f4_xr" type="number" class="form-control" value="0" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px">$$ , $$</div>
  </div>
  <div class="" style="display:flex; flex-direction: row; justify-content: center; align-items:center; font-size: 16px  ">
      <div style="margin: 0 10px 0 100px"> </div>
      <input style="max-width: 50px" id="f4_yx" type="number" class="form-control" value="0" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ x + $$ </div>
      <input style="max-width: 50px" id="f4_yy" type="number" class="form-control" value="0.16" min="-2" max="2" step="0.01"/>
      <div style="margin: 0 10px"> $$ y + $$</div>
      <input style="max-width: 50px" id="f4_yr" type="number" class="form-control" value="0" min="-2" max="2" step="0.01""/>
      <div style="margin: 0 10px"> $$ ) $$</div>
  </div>')),
   shiny::hr(),

  )),
  # Show a plot of the generated distribution
  shiny::div(style="height:auto",
    shiny::mainPanel(width=7,
            
            shiny::HTML('
          <div id="fractal" class="shiny-plot-output" style="width: 100%; height: auto "></div>')
    
  )
)),
shiny::hr(),
shiny::div(style="padding-bottom: 10px; display: flex;align-items: center;justify-content: space-evenly;" ,"Jacek Nitychoruk © Metody Obliczeniowe w Nauce i Technice 2020  "))
