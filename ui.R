library(shiny)



shinyUI(pageWithSidebar(
    headerPanel(">>> Guess the House Price! <<<"),
    sidebarPanel(
        h4("Inputs and Your Guess"),
        h3("-------------------"),
        numericInput("beds",h5("Number of bedroom:"),value=3,min=2,max=5,step=1),
        numericInput("baths",h5("Number of bathroom:"),value=2,min=1,max=4,step=1),
        radioButtons("new",h5("Is it a new house?"),choices=list("new" = 1,"old" = 2)),
        sliderInput("size",h5("Size of the house:"),value=1300,min=580,max=4050,step=1),
        sliderInput("guess",h5("Your guess of price:"),value=200000,min=20000,max=600000,step=100),
        actionButton("go", "Check it out!")
    ),
    mainPanel(
        h2("Intoduction"),
        p("In this application, you will be guessing the price of a house given several criteria including:"),
        tagList(tags$p("- Number of bedrooms"),
                tags$p("- Number of bathrooms"),
                tags$p("- Whether the house is new or not"),
                tags$p("- The size of the bouse in square feet")),
        h5("Give it a try!"),
        h3("Your Inputs:"),
        p("Number of bedroom:"),
        verbatimTextOutput("oid1"),
        p("Number of bathroom:"),
        verbatimTextOutput("oid2"),
        p("Is it a new house:"),
        verbatimTextOutput("oid3"),
        p("Size of the house:"),
        verbatimTextOutput("oid4"),
        p("Your guess:"),
        verbatimTextOutput("oid5"),
        h3("Result:"),
        p("The predicted house price is:"),
        verbatimTextOutput("oid6"),
        p("Your prediction is off by (predicted - guessed):"),
        verbatimTextOutput("oid7")
    )
))