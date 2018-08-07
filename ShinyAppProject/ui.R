## UI file to create the UIX for the user to select the X, Y variables along with the 
## cluster size. 

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel('ShinyApp Project: k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'Select X variable:', names(iris)),
    selectInput('ycol', 'Select Y variable:', names(iris),
                selected=names(iris)[[2]]),
    numericInput('clusters', 'Select cluster count (max 7):', 1,
                 min = 1, max = 7),
    a("Click here for Documentation & readme",href="https://github.com/sricheruvu/ShinyAppProject/ShinyAppProject"),
    br(),
    br(),
    strong(p("Instructions:")),
    br(),
    p("1. Identify pairwise clusters in the IRIS dataset."),
    p("2. Select X variable above."),
    p("3. Select Y variable above."),
    p("4. Select number of clusters (between 1 to 7 clusters)."),
    br()),
  
  mainPanel(
    plotOutput('plotIRIS'),
    h4("Summary of generated clusters:"),
    verbatimTextOutput("summary")
  )
))