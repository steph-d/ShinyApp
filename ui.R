library(shiny)

shinyUI(pageWithSidebar(
     headerPanel("Prediction of the age of an Orange Tree"),
     sidebarPanel(
          p("Age of the trees can be approximate by their circumference. Thanks to a database (Orange, from datasets package in R), we can do some predictions! Try it !"),
          numericInput("inputage", "Enter an age (days)", 100, min=100, max=1600, step=1),
          h2("Prediction of the circumference:"),
          verbatimTextOutput("circ"),
          numericInput("inputcirc", "Enter a circumference (mm)", 30, min=30, max=300, step=1),
          h2("Prediction of the age:"),        
          verbatimTextOutput("age"),
          submitButton("Calcul")
     ),
     mainPanel(
          plotOutput("graph"),
          br(),
          p("Of course, due to the small size of the data base, and due to the type of the fitting curve, it exists an error in the approximation, error which increases when we go far from the middle of the S-shape fitting curve. It could be a first model, which can be improved with other datasets, and maybe other trees ! It could be interesting to see the difference in the growth between tree species for example ! Have fun !")
     )
))