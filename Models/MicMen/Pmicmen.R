        tabBox(title = "Michaelis-Menten",
               id = "m2",
               width = 250,
       
# Plot
       
          tabPanel("Plot",
                
            sidebarLayout(    
                  
              sidebarPanel(
                    
                sliderInput(inputId = "tA",
                            min = -10,
                            max = 10,
                            value = 1,
                            step = 0.5,
                            label = "Theta A"
                ),
                    
                sliderInput(inputId = "tV",
                            min = 0,
                            max = 1,
                            value = 0.5,
                            step = 0.05,
                            label = "Theta V"
                )),
                  
                mainPanel(plotOutput(outputId = "mm",
                          height = 400
                )
              )
            )
          ), # tabPanel
       
# Documentation          
       
          tabPanel("Documentation",
                   withMathJax(includeMarkdown("Models/MicMen/DMichaelis_Menten.md")
                   )),
       
# R code          
       
          tabPanel("R Code",
                   withMathJax(includeMarkdown("Models/MicMen/CMichaelis.md"))
       )
       
)