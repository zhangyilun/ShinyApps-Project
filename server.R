library(shiny)
library(UsingR)

data <- read.table("house.txt",header=T)
data$New <- as.factor(data$New)
data$Beds <- as.factor(data$Beds)
data$Baths <- as.factor(data$Baths)

model <- lm(Price~Beds+Baths+New+Size,data=data)

shinyServer(
    function(input, output) {
        # switch off scientific representation of large numbers
        options(scipen=9999)
        # display your inputs
        output$oid1 <- renderPrint({input$beds})
        output$oid2 <- renderPrint({input$baths})
        output$oid3 <- renderPrint(if ({input$new} == "1") {"new"}
                                   else{"old"}
                                   )
        output$oid4 <- renderPrint({input$size})
        output$oid5 <- renderPrint({input$guess})
        
        # calculate predicted house price

        output$oid6 <- renderText({
            if (input$go > 0) {
                predicted <- predict(model,data.frame(Beds=factor(input$beds),
                                                      Baths=factor(input$baths),
                                                      New=if ({input$new} == "1") {factor(1)} else{factor(0)},
                                                      Size=input$size))
                predicted}
            
            })
        
        # calculate the difference from your prediction
        
        output$oid7 <- renderPrint({
            if (input$go > 0) {
                predicted <- predict(model,data.frame(Beds=factor(input$beds),
                                                  Baths=factor(input$baths),
                                                  New=if ({input$new} == "1") {factor(1)} else{factor(0)},
                                                  Size=input$size))
                predicted - input$guess}
            })
    }
)