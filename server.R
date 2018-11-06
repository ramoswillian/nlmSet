#--------------------------------------------------------------------------------------

## Codigo Server do app nlmSet

## Carregando pacotes:

library(shiny)  
library(shinydashboard)
library(ggplot2)

## Comeco do codigo:


shinyServer(function(input, output){
  
  
  # Exponencial Assintotica -------------------------------------------------
  
  #  mForm6 <- as.formula("Y ~ thetaA * (1 - exp(-theta0 *x))")
  #  mExpr6 <- mForm6[[3]]
  
  #  mForm7 <- as.formula("Y ~ thetaA * (1 - exp((x * log(1 - q))
  #                     /theta0))")
  
  #  mExpr7 <- mForm7[[3]]
  
  
  
  
  output$EA <- renderPlot({
    
    if(input$serEA == "Asymptotic Exponential"){
      thetaA <- input$tA
      theta0 <- input$t0
      
      exp1 <- Vectorize(function(x){
        result <- thetaA*(1 - exp(-theta0 * x))
        return(result)
      })
      
      
      
    } else{
      thetaA_1 <- input$tA_1
      theta0_1 <- input$t0_1
      q <- input$q
      
      
      exp2 <- Vectorize(function(x){
        result2 <- thetaA_1*(1 - exp((x * log(1 - q))/theta0_1))
        return(result2)
      })
    }
    
    
    
    
    
    
    if(input$serEA == "Asymptotic Exponential"){
      var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
        stat_function(fun = exp1, size = 1, colour = "blue") +
        theme_classic() +
        xlab("") + ylab("")
      
    } else{
      var <- ggplot(data.frame(x = c(0, 10)), aes(x)) +
        stat_function(fun = exp2, size = 1, colour = "blue") +
        theme_classic() +
        xlab("") + ylab("")
      
    }
    
    
    var
    
    
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