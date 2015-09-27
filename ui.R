#This application will request information from users and comput the Body Mass Index (BMI)
#The ui.r has two tabs, one is used to collect information and compute BMI while the second one displays the BMI chart
#The server.r performs the computation and returns the result for display to the ui - mainPannel



library(shiny) # Loading the shiny library

#The user interface requestes users to enter hieght and weight values and asks them to press calculate to compute the BMI

shinyUI(fluidPage(
  
  titlePanel("Developing Data Product Assignment "),
  
  sidebarLayout(
    
    sidebarPanel(('Enter the following informations'), 
                 
                 textInput("name", "Enter your name", ""), # Asking user to enter his/her name
                 numericInput("height", "Enter your height in meters", 1.8), # Asking user to enter his/her height
                 numericInput("weight", "Enter your weight in KG", 75),  # Asking user to enter his/her weight
                 radioButtons("gender", "Select your gender", list("Male", "Female"), "Male"), # Just asking gender for the purpose of completeness
                 submitButton("Calculate"),
                 p("Click on the Calculate button to compute your Body-Mass-Index")
    ),
    mainPanel(
      
      tabsetPanel(type="tab",
                  # The first tab - computes the BMI result
                  tabPanel("Result", 
                           textOutput("text1"),
                           textOutput("result")
                  ),
                  # The second tab - displays the BMI chart
                  tabPanel("BMI Chart", imageOutput("pic")),
                  tabPanel("Documentation",
                           textOutput("text3"))
      )
    )
  )))
