#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Genetic Simulations Dahsboard"),
   
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("steps",
                     "Number of steps:",
                     min = 1,
                     max = length(fitness$V1),
                     value = 20)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
         
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  #fitness <- read.csv("~/HS/Semester/4/Thesis/Modeling/csv/fitness.csv", header=FALSE)
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- fitness$V1 
      #steps <- seq(min(x), max(x), length.out = input$steps + 1)
      
      # draw the histogram with the specified number of bins
      #hist(x, breaks = steps, col = 'darkgray', border = 'white')
      plot(head(x,input$steps))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

