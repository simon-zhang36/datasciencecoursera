require(devtools)
install_github('rCharts','ramnathv')
# Q1
library(manipulate)
myPlot <- function(s) {
        plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
        abline(0, s)
}

manipulate(myPlot(s), s = slider(0, 2, step = 0.1))

"manipulate(myPlot(s), s = slider(0, 2, step = 0.1))"

# Q2
library(rCharts)
data("airquality")
d <- dTable(airquality, sPaginationType = "full_numbers") 

# Q3
"A ui.R and server.R file or a A server.R file and a directory called www containing the relevant html files."

# Q4
"Missing a comma in the sidebar panel"

# Q5
"The server.R output name isn't the same as the plotOutput command used in ui.R."