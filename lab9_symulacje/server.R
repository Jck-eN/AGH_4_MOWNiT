library(shinythemes)
library(shiny)


function(input, output, session) {
    
    observeEvent(input$p1, {
        if (1.01-input$p1-input$p2-input$p3 >= 0){
            updateSliderInput(session, inputId = "p4", value = 1-input$p1-input$p2-input$p3)
        }
        else updateSliderInput(session, inputId = "p1", value = 0)
    })
    
    observeEvent(input$p2, {
        if (1.01-input$p1-input$p2-input$p3 >= 0){
            updateSliderInput(session, inputId = "p4", value = 1-input$p1-input$p2-input$p3)
        }
        else updateSliderInput(session, inputId = "p2", value = 0)
    })
    
    observeEvent(input$p3, {
        if (1.01-input$p1-input$p2-input$p3 >= 0){
            updateSliderInput(session, inputId = "p4", value = 1-input$p1-input$p2-input$p3)
        }
        else updateSliderInput(session, inputId = "p3", value = 0)
    })
    
    observeEvent(input$preset1, {
        updateSliderInput(session, inputId = "p1", value = 0.85)
        updateTextInput(session, inputId ="f1_xx", value=0.85)
        updateTextInput(session, inputId ="f1_xy", value=0.04)
        updateTextInput(session, inputId ="f1_xr", value=0)
        updateTextInput(session, inputId ="f1_yx", value=-0.04)
        updateTextInput(session, inputId ="f1_yy", value=0.85)
        updateTextInput(session, inputId ="f1_yr", value=1.6)
        
        updateSliderInput(session, inputId = "p2", value = 0.07)
        updateTextInput(session, inputId ="f2_xx", value=-0.15)
        updateTextInput(session, inputId ="f2_xy", value=0.28)
        updateTextInput(session, inputId ="f2_xr", value=0)
        updateTextInput(session, inputId ="f2_yx", value=0.26)
        updateTextInput(session, inputId ="f2_yy", value=0.24)
        updateTextInput(session, inputId ="f2_yr", value=0.44)
        
        updateSliderInput(session, inputId = "p3", value = 0.07)
        updateTextInput(session, inputId ="f3_xx", value=0.2)
        updateTextInput(session, inputId ="f3_xy", value=-0.26)
        updateTextInput(session, inputId ="f3_xr", value=0)
        updateTextInput(session, inputId ="f3_yx", value=0.23)
        updateTextInput(session, inputId ="f3_yy", value=0.22)
        updateTextInput(session, inputId ="f3_yr", value=1.6)
        
        updateSliderInput(session, inputId = "p4", value = 0.01)
        updateTextInput(session, inputId ="f4_xx", value=0)
        updateTextInput(session, inputId ="f4_xy", value=0)
        updateTextInput(session, inputId ="f4_xr", value=0)
        updateTextInput(session, inputId ="f4_yx", value=0)
        updateTextInput(session, inputId ="f4_yy", value=0.16)
        updateTextInput(session, inputId ="f4_yr", value=0)
        updateSelectInput(session, inputId="plotcolor", selected="darkgreen")
    })
    
    observeEvent(input$preset2, {
        updateSliderInput(session, inputId = "p1", value=0.895652)
        updateTextInput(session, inputId ="f1_xx", value=0.787879)
        updateTextInput(session, inputId ="f1_xy", value=-0.424242)
        updateTextInput(session, inputId ="f1_xr", value=1.758647)
        updateTextInput(session, inputId ="f1_yx", value=0.242424)
        updateTextInput(session, inputId ="f1_yy", value=0.859848)
        updateTextInput(session, inputId ="f1_yr", value=1.408065)
        
        updateSliderInput(session, inputId = "p2", value = 0.052174)
        updateTextInput(session, inputId ="f2_xx", value=-0.121212)
        updateTextInput(session, inputId ="f2_xy", value=0.257576)
        updateTextInput(session, inputId ="f2_xr", value=-6.721654)
        updateTextInput(session, inputId ="f2_yx", value=0.151515)
        updateTextInput(session, inputId ="f2_yy", value=0.053030)
        updateTextInput(session, inputId ="f2_yr", value=1.377236)
        
        updateSliderInput(session, inputId = "p3", value = 0.052174)
        updateTextInput(session, inputId ="f3_xx", value=0.181818)
        updateTextInput(session, inputId ="f3_xy", value=-0.136364)
        updateTextInput(session, inputId ="f3_xr", value=6.086107)
        updateTextInput(session, inputId ="f3_yx", value=0.090909)
        updateTextInput(session, inputId ="f3_yy", value=0.181818)
        updateTextInput(session, inputId ="f3_yr", value=1.568035)
        
        updateSliderInput(session, inputId = "p4", value = 0.00)
        updateTextInput(session, inputId ="f4_xx", value=0)
        updateTextInput(session, inputId ="f4_xy", value=0)
        updateTextInput(session, inputId ="f4_xr", value=0)
        updateTextInput(session, inputId ="f4_yx", value=0)
        updateTextInput(session, inputId ="f4_yy", value=0)
        updateTextInput(session, inputId ="f4_yr", value=0)
    })
    observeEvent(input$preset3, {
        updateSliderInput(session, inputId = "p1", value = 0.787473)
        updateTextInput(session, inputId ="f1_xx", value=0.824074)
        updateTextInput(session, inputId ="f1_xy", value=0.281428)
        updateTextInput(session, inputId ="f1_xr", value=1.882290)
        updateTextInput(session, inputId ="f1_yx", value=-0.212346)
        updateTextInput(session, inputId ="f1_yy", value=0.864198)
        updateTextInput(session, inputId ="f1_yr", value=-0.110607)
        
        updateSliderInput(session, inputId = "p2", value = 0.212527)
        updateTextInput(session, inputId ="f2_xx", value=0.088272)
        updateTextInput(session, inputId ="f2_xy", value=0.520988)
        updateTextInput(session, inputId ="f2_xr", value=0.785360)
        updateTextInput(session, inputId ="f2_yx", value=-0.463889)
        updateTextInput(session, inputId ="f2_yy", value=-0.377778)
        updateTextInput(session, inputId ="f2_yr", value=8.095795)
        
        updateSliderInput(session, inputId = "p3", value = 0)
        updateTextInput(session, inputId ="f3_xx", value=0)
        updateTextInput(session, inputId ="f3_xy", value=0)
        updateTextInput(session, inputId ="f3_xr", value=0)
        updateTextInput(session, inputId ="f3_yx", value=0)
        updateTextInput(session, inputId ="f3_yy", value=0)
        updateTextInput(session, inputId ="f3_yr", value=0)
        
        updateSliderInput(session, inputId = "p4", value = 0)
        updateTextInput(session, inputId ="f4_xx", value=0)
        updateTextInput(session, inputId ="f4_xy", value=0)
        updateTextInput(session, inputId ="f4_xr", value=0)
        updateTextInput(session, inputId ="f4_yx", value=0)
        updateTextInput(session, inputId ="f4_yy", value=0)
        updateTextInput(session, inputId ="f4_yr", value=0)
        updateSelectInput(session, inputId="plotcolor", selected="darkred")
    })


    fractal<- function(x,y,l,
                             p1,p2,p3,p4,
                            input_f1_xx, input_f1_xy, input_f1_xr, input_f1_yx, input_f1_yy, input_f1_yr,
                            input_f2_xx, input_f2_xy, input_f2_xr, input_f2_yx, input_f2_yy, input_f2_yr, 
                            input_f3_xx, input_f3_xy, input_f3_xr, input_f3_yx, input_f3_yy, input_f3_yr,
                            input_f4_xx, input_f4_xy, input_f4_xr, input_f4_yx, input_f4_yy, input_f4_yr  ){
        smok<-mat.or.vec(l, 2)
        r=runif(l)
        
        for (i in 1:l){
            if (r[i] < p1){
                xp=input_f1_xx*x+input_f1_xy*y+input_f1_xr
                yp=input_f1_yx*x+input_f1_yy*y+input_f1_yr
                #yp=-0.4*y+0.1
                smok[i,1]=xp
                smok[i,2]=yp
                x=xp
                y=yp
            }
            else if (r[i] < p1+p2){
                xp=input_f2_xx*x+input_f2_xy*y+input_f2_xr
                yp=input_f2_yx*x+input_f2_yy*y+input_f2_yr
                smok[i,1]=xp
                smok[i,2]=yp
                x=xp
                y=yp
            }
            
            else if (r[i] < p1+p2+p3){
                xp=input_f3_xx*x+input_f3_xy*y+input_f3_xr
                yp=input_f3_yx*x+input_f3_yy*y+input_f3_yr
                smok[i,1]=xp
                smok[i,2]=yp
                x=xp
                y=yp
            }
            
            else {
                xp=input_f4_xx*x+input_f4_xy*y+input_f4_xr
                yp=input_f4_yx*x+input_f4_yy*y+input_f4_yr
                smok[i,1]=xp
                smok[i,2]=yp
                x=xp
                y=yp
            }
            
        }
        return(smok)
        
    }
    color <- reactive(input$plotcolor)
    
    s<- reactive(fractal(1,1,input$points,input$p1, input$p2, input$p3, input$p4,
                         input$f1_xx, input$f1_xy, input$f1_xr, input$f1_yx, input$f1_yy, input$f1_yr,
                         input$f2_xx, input$f2_xy, input$f2_xr, input$f2_yx, input$f2_yy, input$f2_yr,
                         input$f3_xx, input$f3_xy, input$f3_xr, input$f3_yx, input$f3_yy, input$f3_yr,
                         input$f4_xx, input$f4_xy, input$f4_xr, input$f4_yx, input$f4_yy, input$f4_yr))
    
    output$fractal <- renderPlot(plot(s()[,1],s()[,2],  pch=16, cex=0.2,col=color(), xlab="", ylab=""), height=reactive(ifelse(!is.null(input$innerWidth),input$innerWidth*3/5,600)))
    

}




