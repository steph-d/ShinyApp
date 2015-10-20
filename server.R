library(shiny)

library(datasets)
data(Orange)

# calcul for the mean of the circumference between the trees
x <- unique(Orange$age)
y <- numeric()
for(i in 1:7){y <- c(y, mean(Orange$circumference[Orange$age==x[i]]))}

# regression model for inputage
reg <- nls(y~SSlogis(x, Asym, xmid, scal))
predictioncirc <- function(inputage) predict(reg, list(x=inputage))[1]

# regression model for inputcirc
reg2 <- nls(x~SSlogis(y, Asym, xmid, scal))
predictionage <- function(inputcirc) predict(reg2, list(y=inputcirc))[1]

shinyServer(
     function(input, output) {

# plot
          output$graph <- renderPlot({
               plot(circumference~age, col=Tree, data=Orange, xlab="Age (days)", ylab="Circumference (mm)", main="Circumference according to the age for 5 orange trees")
               age <- seq(0, 1600, length.out = 101)
               lines(age, predict(reg, list(x = age)))
          })

# prediction        
          output$circ <- renderPrint({predictioncirc(input$inputage)})
          output$age <- renderPrint({predictionage(input$inputcirc)})
     }
)