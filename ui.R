
library(shiny)
library(shinydashboard)


shinyUI(
    dashboardPage(
        dashboardHeader(title="Freight Trend"),
        dashboardSidebar(
            sidebarMenu(
                menuItem("change",tabName = "c",icon = icon("bar-chart")),
                menuItem("link",tabName = "l",icon=icon("link"))
            )
            
        ),
        
        dashboardBody(
            tabItems(
                tabItem(tabName = "c",
                        h1("Hit the play button in the bottom right hand side of the slider panel"),
                        # Row 1
                        fluidRow(
                            
                            column(5,offset=0,
                                   h1(textOutput("title1")),
                                   # Slide for time
                                   sliderInput("O","time series",
                                               min=1,
                                               max=63,
                                               value=1,
                                               step=1,
                                               animate = TRUE)
                                   
                            ),
                            column(5,
                                   fluidRow(
                                       column(6,div(style = "height:80px;", ""))
                                   ),
                                   fluidRow(
                                       column(12,h4("The figure will change according to the 
                                                   Input of slide. It will show you the 
                                                   Freights of diferent types of cargos")))
                            )
                            
                        ),
                        # Row 2
                        fluidRow(
                            column(10,offset=0,
                                   plotOutput("plot1"))
                        )
                ),
                tabItem(tabName = "l",
                        "Click this to the raw file",
                        br(),
                        "https://github.com/Matthew-May/shiny1"
                    
                )
            )
            
            
        )
    )
)


