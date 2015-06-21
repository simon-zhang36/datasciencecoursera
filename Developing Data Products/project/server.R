library(shiny)

shinyServer(function(input,output){
        
        # Server logic goes here.
        output$plot <- renderPlot({
                if ( input$transform_x ) {
                        x <- switch(input$fX,
                                    log = log(cars$speed),
                                    sqrt = sqrt(cars$speed))
                        xlabel <- switch(input$fX,
                                         log = "Log Speed (mph)",
                                         sqrt = "Square Root Speed (mph)")
                } else {
                        x = cars$speed
                        xlabel = "Speed (mph)"
                }
                if ( input$transform_y ) {
                        y <- switch(input$fY,
                                    log = log(cars$dist),
                                    sqrt = sqrt(cars$dist))
                        ylabel <- switch(input$fY,
                                         log = "Log Stopping Distance (ft)",
                                         sqrt = "Square Root Stopping Distance (ft)")
                } else {
                        y = cars$dist
                        ylabel = "Stopping Distance (ft)"
                }
                
                par(mar=c(6,5,6,3),oma=c(2,0,0,0))
                plot(x,y,pch=16,
                     ylab=ylabel,xlab=xlabel,
                     main="Speed and Stopping Distances of Cars",
                     cex.lab=2,cex.main=2,cex.axis=2)
                title(sub="Data recorded in 1920s.",outer=T,cex.sub=2,line=0)
                
                if ( input$fit ) {
                        if ( input$method == "lm" ) {
                                fit = lm(y~x)
                                lines(x,fit$fitted.values,lwd=2)
                                rss=sum(residuals(fit)^2)
                        } else if ( input$method == "spline" ) {
                                fit = smooth.spline(x,y,spar=input$smooth)
                                lines(fit,lwd=2)
                                rss=sum((predict(fit,x)$y - y)^2)
                        } else if ( input$method == "poly" ) {
                                fit = lm(y ~ poly(x,input$degree))
                                lines(x,fit$fitted.values,lwd=2)
                                rss=sum(residuals(fit)^2)
                        }
                        if ( input$confint && input$method != "spline" ) {
                                expected <- predict(fit,data.frame(x),interval="confidence")
                                polygon(c(x,rev(x)),c(expected[,'upr'],rev(expected[,'lwr'])),
                                        col=gray(0,0.25),border=F)
                        }
                        legend("topleft",
                               paste("Sum of Squared Residuals",round(rss,3)),
                               bty="n",cex=2)
                }
        })
        
        output$stats_x <- renderTable({
                
                if ( input$transform_x ) {
                        x <- switch(input$fX,
                                    log = log(cars$speed),
                                    sqrt = sqrt(cars$speed))
                } else {
                        x = cars$speed
                }
                
                data.frame(
                        Statistic=c("Mean","Standard Deviation","Median","IQR"),
                        Value=c(mean(x),sd(x),median(x),IQR(x))
                )
                
        })
        
        output$stats_y <- renderTable({
                
                if ( input$transform_y ) {
                        y <- switch(input$fY,
                                    log = log(cars$dist),
                                    sqrt = sqrt(cars$dist))
                } else {
                        y = cars$dist
                }
                
                data.frame(
                        Statistic=c("Mean","Standard Deviation","Median","IQR"),
                        Value=c(mean(y),sd(y),median(y),IQR(y))
                )
                
        })
        
})