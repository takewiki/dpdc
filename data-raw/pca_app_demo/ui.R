#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("主成分分析程序演示"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("from",
                   "请输入开始点:",
                   min = 0,
                   max = 1,
                   value = 0,
                   step=0.05
                      ),
       sliderInput("to",
                   "请输入结束点:",
                   min = 0,
                   max = 1,
                   value = 1,
                   step=0.05),
       sliderInput("accept",
                   "请输入接受概率:",
                   min = 0.6,
                   max = 1,
                   value = 0.8,
                   step=0.05)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
