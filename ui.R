#---------------------------------------------------------------------------------------

## Nonlinear Regression Models Catalogue


## Carregando pacotes

library(shiny)
library(shinydashboard)
library(ggplot2)
library(markdown)

## Começo do codigo:

shinyUI(dashboardPage(
  
# Title  
  
        title = "nlmSet",
  
# Skin
  
        skin = "green",
  
# Header
  
  
        dashboardHeader(title = "nlmSet",
                        titleWidth = 229.41,
                        tags$li(class= "dropdown",
                                tags$a(href= "https://github.com/leg-ufpr/nlmSet", 
                                icon("github"), 
                                "Source Code",
                                target="_blank"))
  ),
  
# Sidebar
  
        dashboardSidebar(
    
# Trocando cor da barra.
    
        tags$style(includeCSS("style.css")),
    
# Abas 
    
        sidebarMenu(
          
          id = "tabs",
      
# Primeira Aba       
      
          menuItem("Introduction",
                    tabName = "int"),
      
          menuItem("Models",
                   tabName = "mod",
                   sidebarSearchForm(textId = "searchText",
                                     buttonId = "searchButton",
                                     label = "Search..."),            
#-----------------------------------------------------------------------------------
        
# Exponencial Assintótico
        
            menuSubItem("Asymptotic Exponential",
                        tabName = "expA"
            ),
        
#-----------------------------------------------------------------------------------
        
# Michelis-Menten          
        
            menuSubItem("Michaelis-Menten",
                        tabName = "MM"
            )

#-----------------------------------------------------------------------------------  

          ),#menuItem

          menuItem("Contribution",
                   tabName = "cont"
          )



    ) #sidebarMenu
  ), #dashboardSidebar
  
#-----------------------------------------------------------------------------------  
  
# Body
  
        dashboardBody(
    
          tabItems(
      
# Tela inicial      
      
            tabItem(tabName = "int",
                    includeMarkdown("README.md")
            ),


      
# Modelos      
      
#***********************************************************************************

# Exponencial Assintótica
      
        tabItem(tabName = "expA",
        
          fluidPage(
          
            fluidRow(
            
              source("Models/AsymExp/Pasymexp.R")
            
            ) # fluidRow
          )#fluidPage
        ),#tabItem
      
#-----------------------------------------------------------------------------------

# Michaelis-Menten
      
        tabItem(tabName = "MM",
        
          fluidPage(
          
            fluidRow(
            
              source("Models/MicMen/Pmicmen.R")
            
            ) # fluidRow
          )#fluidPage
        ),#tabItem

#-----------------------------------------------------------------------------------
        tabItem(tabName = "cont",
                includeMarkdown("README.md")
        )


#-----------------------------------------------------------------------------------

   )#tabItems  
  )#dashboardBody
 )#dashboardPage
)#ShinyUI
