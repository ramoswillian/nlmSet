        tabBox(title = "Asymptotic Exponential",
               id = "m1",
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
                    
              sliderInput(inputId = "t0",
                          min = 0,
                          max = 1,
                          value = 0.5,
                          step = 0.05,
                          label = "Theta 0"
              )),
                  
              mainPanel(
                
                plotOutput(outputId = "EA",
                           height = 400
                    ))
          )
        ), # tabP
       
# Documentation          
       
       tabPanel("Documentation",
                withMathJax(includeMarkdown("Documentation/Asymptotic_Exponential.md")
                )),
       
# R code          
       
       tabPanel("R Code",
                withMathJax(includeMarkdown("Code/RAsymptoticE.md")
                ))
       
       
)