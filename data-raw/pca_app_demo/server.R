#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    library(dpdc)
    data('glm_logistics_data1',package = 'dpdc')
    log_model <- glm(FHaveCar~Fincome,family = binomial,data=glm_logistics_data1)
    Fincome <-min(glm_logistics_data1$Fincome):max(glm_logistics_data1$Fincome);
    probability<-log_fits(log_model,Fincome);
   # par(mfrow=c(1:2)); plot(glm_logistics_data1,main='原始数据');
    start_point <-as.numeric(names(probability)[probability >input$from][1]);
    end_point <- as.numeric(names(probability)[probability ==input$to][1]);
    abline(v =start_point,col='red');abline(v = end_point,col='blue');
    plot(Fincome,probability,main='模型数据');
    abline(v =start_point,col='red');abline(v = end_point,col='blue');abline(h=input$accept,col='green')
    
  })
  
})
