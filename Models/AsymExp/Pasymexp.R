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
                    #br() #Adiciona espaço
                    #helpText()
                    
                    uiOutput("serslEA1"), #Padrão de escrita "sersl'ABREVIAÇÃOMODELO''NUMERO'"  
                    uiOutput("serslEA2"),
                    h3(),
                    h5("Expecifico para o Asymptotic Exponential"),
                    uiOutput("serslEA3")
                  ),
                  
                  mainPanel(
                    
                    plotOutput(outputId = "EA",
                               height = 400
                    ))
                )
       ), # tabP
       
       # Documentation          
       
       tabPanel("Documentation",
                withMathJax(includeMarkdown("Models/AsymExp/DAsymptotic_Exponential.md")
                )),
       
       # R code          
       
       tabPanel("R Code",
                withMathJax(includeMarkdown("Models/AsymExp/CAsymptotic.md")
                ))
       
       
)