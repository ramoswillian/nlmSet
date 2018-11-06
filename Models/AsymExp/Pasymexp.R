tabBox(title = "Asymptotic Exponential",
       id = "m1",
       width = 250,
       
       # Plot          
       
       tabPanel("Plot",
                
                sidebarLayout(    
                  
                  sidebarPanel(
                    
                    selectInput(inputId = "serEA", # Padrão de escrita para escolha do modelo "ser'ABREVIAÇÃOMODELO'"
                                label = "Parametrization",
                                choices = c("Asymptotic Exponential",
                                            "Asymptotic Exponential Reparametrized"),
                                selected = "Asymptotic Exponential"
                    ),
                    
                    
                    conditionalPanel(condition = "input.serEA == 'Asymptotic Exponential'",
                                     sliderInput(inputId = "tA",
                                                 label = "ThetaA",
                                                 min = -10,
                                                 max = 10,
                                                 value = 5
                                     ),
                                     
                                     sliderInput(inputId = "t0",
                                                 label = "Theta0",
                                                 min = 0,
                                                 max = 1,
                                                 value = 0.5
                                     )),
                    
                    conditionalPanel(condition = "input.serEA == 'Asymptotic Exponential Reparametrized' ",
                                     sliderInput(inputId = "tA_1",
                                                 label = "ThetaA",
                                                 min = -10,
                                                 max = 10,
                                                 value = 5
                                     ),
                                     
                                     sliderInput(inputId = "t0_1",
                                                 label = "Theta0",
                                                 min = 0,
                                                 max = 1,
                                                 value = 0.5
                                     ),
                                     
                                     sliderInput(inputId = "q",
                                                 label = "q",
                                                 min = 0,
                                                 max = 1,
                                                 value = 0.5
                                     ))),
                  
                  mainPanel(
                    
                    plotOutput(outputId = "EA",
                               height = 400
                    ))
                  
                )), # tabP
       
       # Documentation          
       
       tabPanel("Documentation",
                withMathJax(includeMarkdown("Models/AsymExp/DAsymptotic_Exponential.md")
                )),
       
       # R code          
       
       tabPanel("R Code",
                withMathJax(includeMarkdown("Models/AsymExp/CAsymptotic.md")
                ))
       
       
)