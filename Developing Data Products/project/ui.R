library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Regression Example"),
        sidebarPanel(
                # Input UI elements go here.
                checkboxInput("transform_y","Transform Y",FALSE),
                conditionalPanel("input.transform_y == true",
                                 selectInput("fY","Transformation of Y",
                                             c("Log"="log","Square Root"="sqrt"))),
                checkboxInput("transform_x","Transform X",FALSE),
                conditionalPanel("input.transform_x == true",
                                 selectInput("fX","Transformation of X",
                                             c("Log"="log","Square Root"="sqrt"))),
                checkboxInput("fit","Fit a curve to the data",FALSE),
                conditionalPanel("input.fit == true",
                                 selectInput("method","Method",
                                             c("Simple Linear Regression"="lm",
                                               "Cubic Smoothing Spline"="spline",
                                               "Polynomial"="poly")),
                                 conditionalPanel("input.method == 'spline'",
                                                  sliderInput("smooth","Smoothing Parameter",
                                                              0.5,min=0,max=1)),
                                 conditionalPanel("input.method == 'poly'",
                                                  sliderInput("degree","Degree of Polynomial",
                                                              1,min=1,max=18,step=1)),
                                 conditionalPanel("!(input.method == 'spline')",
                                                  checkboxInput("confint","95% Confidence Interval",FALSE))
                )
        ),
        mainPanel(
                # Output UI elements go here.
                tabsetPanel(
                        tabPanel("Plot",plotOutput("plot",width=800,height=600)),
                        tabPanel("Statistics",
                                 h3("Car Speed"),
                                 tableOutput("stats_x"),
                                 h3("Car Distance"),
                                 tableOutput("stats_y"))
                )
        )
))