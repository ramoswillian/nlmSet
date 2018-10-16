#--------------------------------------------------------------------------------------

## Codigo Server do app nlmSet

## Carregando pacotes:

library(shiny)  
library(shinydashboard)
library(ggplot2)

## Comeco do codigo:


shinyServer(function(input, output){


# Exponencial Assintotica -------------------------------------------------

  # Versão antiga
  
  output$EA <- renderPlot({
    
    mForm6 <- as.formula("Y ~ thetaA * (1 - exp(-theta0 *x))")
    
    mExpr6 <- mForm6[[3]]
    
    thetaA <- input$tA
    theta0 <- input$t0
    
    eval(call("curve", mExpr6, from = 0, to = 10, col = 2, ylab = "", lwd = 3))
    
  },  height = 400) #EA
  
  
  #### Novos gráficos
  
  
  
  #output$EA <- renderPlot({
    
    
    
   # thetaA <- input$tA
   #  theta0 <- input$t0
    
    
    #exp1 <- Vectorize(function(x){
    #  result <- thetaA * (1 - exp(-theta0 * x))
    #  return(result)
    #})
    
    
    
    #ggplot(data.frame(x = c(0, 10)), aes(x)) + 
    #  stat_function(fun = exp1, size = 1, colour = "blue") +
    #  theme_classic() +
    #  xlab("") + ylab("")
    
    
    
#},  height = 400) #EA
  

# Michaelis-Menten --------------------------------------------------------


    output$mm <- renderPlot({ 
    
    thetaA <- input$tA
    thetaV <- input$tV
  
    exp2 <- Vectorize(function(x){
      result <- (thetaA * x)/(thetaV + x)
      return(result)
    })
  
  
    ggplot(data.frame(x = c(0, 10)), aes(x)) + 
      stat_function(fun = exp2, size = 1, colour = "blue") +
      theme_classic() +
      xlab("") + ylab("")
    
    
    },  height = 400) #MM


}

)