#--------------------------------------------------------------------------------------

## Codigo Server do app nlmSet

## Carregando pacotes:

library(shiny)  
library(shinydashboard)
library(ggplot2)

## Comeco do codigo:


shinyServer(function(input, output){
  
  
  # Exponencial Assintotica -------------------------------------------------
  
  
  output$serslEA1 <- renderUI({
    
    sliderInput(inputId = "tA",
                label = "ThetaA",
                min = -10,
                max = 10,
                value = 0
    )})
  
  output$serslEA2 <- renderUI({  
    
    sliderInput(inputId = "t0",
                label = "Theta0",
                min = 0,
                max = 1, 
                value = 0.5
    )})
  
  output$serslEA3 <- renderUI({  
    
    sliderInput(inputId = "q",
                label = "q",
                min = 0,
                max = 1,
                value = 0.5,
                step = 0.05
    )
    
  })
  
  
  
  
  
  
  output$EA <- renderPlot({
    
    
    
    thetaA <- input$tA
    theta0 <- input$t0
    q <- input$q
    
    
    
    
    
    exp1 <- Vectorize(function(x){
      result <- thetaA * (1 - exp(-theta0 * x))
      return(result)
    })
    
    
    # Exponencial Reparametrizada ---------------------------------------------
    
    exp2 <- Vectorize(function(x){
      result2 <- thetaA * (1 - exp((x * log(1 - q))/theta0))
      return(result2)
    })
    
    if(input$serEA == "Asymptotic Exponential"){
      var <- exp1
    } else{
      var <- exp2
    }
    
    
    ggplot(data.frame(x = c(0, 10)), aes(x)) +
      stat_function(fun = var, size = 1, colour = "blue") +
      theme_classic() +
      xlab("") + ylab("")
    
    
    
  },  height = 400) #EA
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # Michaelis-Menten --------------------------------------------------------
  
  
  output$mm <- renderPlot({ 
    
    thetaA <- input$tA
    thetaV <- input$tV
    
    mForm1 <- as.formula("Y ~ (thetaA * x)/(thetaV  + x)")
    mExpr1 <- mForm1[[3]] 
    
    exp2 <- Vectorize(function(x){
      result <- (thetaA * x)/(thetaV + x)
      return(result)
    })
    
    
    eval(call("curve", mExpr1, col = 2, ylab = "", lwd = 3))
  },  height = 400)
  
  
  
  #    output$mm <- renderPlot({ 
  
  #    thetaA <- input$tA
  #    thetaV <- input$tV
  
  #    exp2 <- Vectorize(function(x){
  #      result <- (thetaA * x)/(thetaV + x)
  #      return(result)
  #    })
  
  
  #    ggplot(data.frame(x = c(0, 10)), aes(x)) + 
  #      stat_function(fun = exp2, size = 1, colour = "blue") +
  #      theme_classic() +
  #      xlab("") + ylab("")
  
  
  #    },  height = 400) #MM
  
  
}

)