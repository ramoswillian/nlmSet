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
  
  
        dashboardHeader(title = "Nonlinear Regression Models Catalogue",
                        titleWidth = 450,
                        tags$li(class= "dropdown",
                                tags$a(href= "https://github.com/leg-ufpr/nlmSet", 
                                icon("github"), 
                                "Source Code",
                                target="_blank"))
  ),
  
# Sidebar
  
        dashboardSidebar(
    
# Trocando cor da barra.
    
        tags$style(mycss),
    
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

      ) #menuItem
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
            
              source("R/asymexp.R")
            
            ) # fluidRow
          )#fluidPage
        ),#tabItem
      
#***********************************************************************************

# Michaelis-Menten
      
        tabItem(tabName = "MM",
        
          fluidPage(
          
            fluidRow(
            
              source("R/michmen.R")
            
            ) # fluidRow
          )#fluidPage
        )#tabItem

#***********************************************************************************
    
   )#tabItems  
  )#dashboardBody
 )#dashboardPage
)#ShinyUI
