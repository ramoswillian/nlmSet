#---------------------------------------------------------------------------------------

## Nonlinear Regression Models Catalogue

## Codigo ui do app shiny desenvolvido pelos petianos Augusto Calcanhoto e Willian Ramos
## Sob a tutoria do Professor Walmes Zevianni.

## Carregando pacotes

library(shiny)
library(shinydashboard)
library(ggplot2)
library(markdown)

## Começo do codigo:

# Trocando cor das barra

mycss <- "
.irs-bar,
.irs-bar-edge,
.irs-single,
.irs-grid-pol {
background: green;
border-color: green;
}"


shinyUI(dashboardPage(
  
# Title  
  
  title = "nlmSet",
  
# Skin
  
  skin = "green",

# Header

  
  dashboardHeader(
    title = "Nonlinear Regression Models Catalogue",
    titleWidth = 450,
    tags$li(class= "dropdown", tags$a(href= "https://github.com/leg-ufpr/nlmSet", 
                                    icon("github"), "Source Code", target="_blank"))
  ),
  
# Sidebar
  
  dashboardSidebar(
    
# Trocando cor da barra.
    
    tags$style(mycss),

# Abas 

    sidebarMenu(
        id = "tabs",

# Primeira Aba       
       
        menuItem(
            "Introduction",
            tabName = "int"),
       
        menuItem(
            "Models",
            tabName = "mod",
         
# Modelos         

#-----------------------------------------------------------------------------------
         
# Exponencial Assintótico

        menuSubItem(
            "Asymptotic Exponential",
            tabName = "expA"
         ),

#-----------------------------------------------------------------------------------
         
# Michelis-Menten          

         menuSubItem(
           "Michaelis-Menten",
           tabName = "MM"
         )         
 
       )
     )
    
  ), #dashboardSidebar
  
#-----------------------------------------------------------------------------------  

  # Body
  
  dashboardBody(
    
    tabItems(
    
    # Utilizar a funcao box dentro de dashboardBody(fluidRow()) para criar caixas
    
      
      # Box: A funcao box cria caixas no layout da pagina. 
      # Status argumentos: primary, success, info, warning, danger. 
      
# Parte inicial      
      
      tabItem(
        tabName = "int",
        includeMarkdown("README.md")
      ),
      
      
# Onde os modelos deverão ficar      

#***********************************************************************************
# Exponencial Assintótica

      tabItem(
        
        tabName = "expA",
        
        fluidPage(
        
          fluidRow(
            
       tabBox(title = "Asymptotic Exponential",
            #solidHeader = TRUE,
            #height = 470,
            #width = 15,
            #status = "success",
            #collapsible = TRUE,
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
            ))
            
           ,
          
            mainPanel(
            plotOutput(outputId = "EA",
                        height = 400
            )
          )
          )
            ), # tabP
          
# Documentation          
          
          tabPanel("Documentation",
                   withMathJax(includeMarkdown("Documentation/Asymptotic_Exponential.md")
          )),
          
# R code          
          
          tabPanel("R Code",
                   withMathJax(includeMarkdown("R_code/RAsymptoticE.md")
          ))
        
        
            )
           ) # fluidRow
            

       )#fluidPage
      ),#tabItem

#***********************************************************************************
# Michaelis-Menten

      tabItem(
    
        tabName = "MM",

        fluidPage(
      
          fluidRow(
            
            tabBox(title = "Michaelis-Menten",
                   #solidHeader = TRUE,
                   #height = 470,
                   #width = 15,
                   #status = "success",
                   #collapsible = TRUE,
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
                            ))
                              
                              ,
                              
                              mainPanel(
                                plotOutput(outputId = "mm",
                                           height = 400
                                )
                              )
                            )
                   ), # tabP
                   
                   # Documentation          
                   
                   tabPanel("Documentation",
                            withMathJax(includeMarkdown("Documentation/Michaelis_Menten.md")
                   )),
                   
                   # R code          
                   
                 tabPanel("R code",
                          withMathJax(includeMarkdown("R_code/RMichaelisM.md"))
                          )
                   
            )
          ) # fluidRow
       )#fluidPage
      )#tabItem
#***********************************************************************************
     )#tabItems  
    )#dashboardBody
   )#dashboardPage
  )#ShinyUI
