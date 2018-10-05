#--------------------------------------------------------------------------------------

## Codigo Server do app nlmSet

## Carregando pacotes:

library(shiny)  
library(shinydashboard)
library(ggplot2)

## Comeco do codigo:


shinyServer(function(input, output){


# Exponencial Assintotica -------------------------------------------------

  
  output$EA <- renderPlot({
    
    
    
    thetaA <- input$tA
    theta0 <- input$t0
    
    
    exp1 <- Vectorize(function(x){
      result <- thetaA * (1 - exp(-theta0 * x))
      return(result)
    })
    
    
    
    ggplot(data.frame(x = c(0, 10)), aes(x)) + 
      stat_function(fun = exp1, size = 1, colour = "red") +
      theme_classic() +
      xlab("") + ylab("")
    
    
    
},  height = 400) #EA
  

# Michaelis-Menten --------------------------------------------------------


    output$mm <- renderPlot({ 
    
    thetaA <- input$tA
    thetaV <- input$tV
  
    exp2 <- Vectorize(function(x){
      result <- (thetaA * x)/(thetaV + x)
      return(result)
    })
  
  
    ggplot(data.frame(x = c(0, 10)), aes(x)) + 
      stat_function(fun = exp2, size = 1, colour = "red") +
      theme_classic() +
      xlab("") + ylab("")
    
    
    },  height = 400) #MM


}

)