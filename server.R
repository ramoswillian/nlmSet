#--------------------------------------------------------------------------------------

## Codigo Server do app nlmSet

## Carregando pacotes:

library(shiny)  
library(shinydashboard)
library(ggplot2)

## Comeco do codigo:


shinyServer(function(input, output){

#***********************************************************************************    
# Exponencial Assintotica:
  
  
  output$EA <- renderPlot({
    
    mForm6 <- as.formula("Y ~ thetaA * (1 - exp(-theta0 *x))")
    
    mExpr6 <- mForm6[[3]]
    
    thetaA <- input$tA
    theta0 <- input$t0
    
    eval(call("curve", mExpr6, from = 0, to = 10, col = 2, ylab = ""))
    
  },  height = 400) #EA
  
#***********************************************************************************  
# Michaelis-Menten
  
    output$mm <- renderPlot({ 
    thetaA <- input$tA
    thetaV <- input$tV
  
    mForm1 <- as.formula("Y ~ (thetaA * x)/(thetaV  + x)")
    mExpr1 <- mForm1[[3]] 
  
  
  
    eval(call("curve", mExpr1, col = 2, ylab = ""))
    },  height = 400)

#***********************************************************************************  
  
}

)