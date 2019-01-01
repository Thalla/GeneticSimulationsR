#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library("shinydashboard")
library("shiny")

body <- dashboardBody(
  fluidRow(
    column(width = 12,
           box(
             title = "Change in cell (0,0) over all generations", width = 100, status = "primary",
             div(style = 'overflow-x: scroll; width: 100%', imageOutput('cell'))
           )
    )
  ),
  fluidRow(
    box(
      title = "Number of amino acids over the chosen number of generations", width = 100, status = "primary", 
      plotOutput("aaNumb")
    ),
    box(
      sliderInput("stepsAANumb", "steps", 1, 100, 20)
    )
  ),
  fluidRow(
    box(
      title = "codeTableFitness", width = 100, status = "primary", 
      plotOutput("codeTableFitness")
    ),
    box(
      sliderInput("stepscodeTableFitness", "steps", 1, length(codeTableFitness$V1), c(20,30))
    )
  ),
  fluidRow(
    box(
      title = "living AARS", width = 100, status = "primary", 
      plotOutput("livingAARS")
    ),
    box(
      sliderInput("stepsLivingAARS", "steps", 1, 100, 20)
    )
  ),
  fluidRow(
    box(
      title = "mRNA Data - Shows the translations of a codon over all generations", width = 100, status = "primary", 
      plotOutput("mRNAdata")
    ),
    box(
      sliderInput("stepsMRNAdata", "steps", 1, 100, 20)
    )
  ),
  fluidRow(
    box(
      title = "", width = 100, status = "primary", 
      plotOutput("testdata")
    ),
    box(
      sliderInput("stepsTestdata", "steps", 1, 100, 20)
    )
  ),
  fluidRow(
    box(
      title = "Data Cell (0,0) over all generations", width = 100, status = "primary", 
      plotOutput("testdataFirstCell")
    ),
    box(
      title = "Data Cell (0,0) over all generations", width = 100, status = "primary", 
      plotOutput("testdataFirstCellStrip")
    )
  )
)

ui <- dashboardPage(
  dashboardHeader(title = "Genetic Simulations"),
  dashboardSidebar(
    menuItem("Dashboard"),
      menuSubItem("try"),
    menuItem("Data")
  ),
  skin = "yellow",
  body
)

server <- function(input, output) {
  
  output$cell <- renderImage({
    return(list(src = "C:/Users/feroc/OneDrive/Dokumente/HS/Semester/4/Thesis/Modeling/R/saved/Rplot05.svg", contentType = "image/svg"))
  }, deleteFile = FALSE)
  
  
  output$aaNumb <- renderPlot({
    x    <- aaNumb
    plot(head(x,input$stepsAANumb), xlab = "generation", ylab = "#aa")
  })
  
  output$codeTableFitness <- renderPlot({
    x    <- codeTableFitness$V1 
    x   <- head(x,input$stepscodeTableFitness[2])
    x   <- tail(x,(input$stepscodeTableFitness[2]- input$stepscodeTableFitness[1]))
    plot(x, xlab = "generation", ylab = "fitness", ylim = c(0.0,1.0))
  })
  
  output$livingAARS <- renderPlot({
    x    <- livingAARS 
    stripchart(head(x,input$stepsLivingAARS), xlab = "aa ID", ylab = "bases")
  })
  
  output$mRNAdata <- renderPlot({
    x    <- mRNAdata
    plot(mRNAdata$V2, mRNAdata$V3, xlab = "codon" , ylab = "aa ID")
  })
  
  output$testdata <- renderPlot({
    x    <- testdata
    plot(head(x,input$stepsTestdata))
  })
  
  output$testdataFirstCell <- renderPlot({
    x    <- testdataFirstCell
    plot(1:length(testdataFirstCell[1,]),testdataFirstCell[1,])
  })
  
  output$testdataFirstCellStrip <- renderPlot({
    x    <- testdataFirstCell
    stripchart(x, xlab = "aa ID", ylab = "generation")
  })
}

# Preview the UI in the console
shinyApp(ui = ui, server = server)