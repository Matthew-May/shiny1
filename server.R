library(shiny)
library(ggplot2)

d <- read.csv("f.csv", header = T)
d$m <- as.Date(d$m)
d$t <- as.factor(d$t)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # get data for this month
    data1 <- reactive({
        d[d$o==input$O,]
    })
   
    # get date
    output$title1 <- renderText({
        d1 <- data1()
        format(d1[1,"m"],"%Y-%m")
    })
    
    # plot
    output$plot1 <- renderPlot({
        d1 <- data1()
        qplot(d1$f,d1$t,data=d1)
        ggplot(data = d1,mapping = aes(x=t,y = f,fill=t)) + 
            geom_bar(stat="identity") +
            ylim(0,5000)
    })
    
    
    
})
