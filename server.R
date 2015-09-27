#This application will request information from users and comput the Body Mass Index (BMI)
#The ui.r has two tabs, one is used to collect information and compute BMI while the second one displays the BMI chart
#The server.r performs the computation and returns the result for display to the ui - mainPannel

library(shiny)
# library(png)
bmi<-function(wt,ht) wt/(ht^2)

shinyServer(function(input, output){
  # This produced a personalized greeting by combining the word 'Hi' and the input 'name'
  output$text1<-renderText({
    paste("Hi ", input$name)
    })
  
  # Compute the BMI using weight in kg divided by heighth squared
  # This computes the BMI from the input weight and height. The 'result' variable is used to pass the result to the main panel part
  # of ui.r for display
  output$result<- renderPrint({
    paste("Your Body Mass Index is: ", bmi(input$weight, input$height))
    })
  
  #Documentation
  output$text3<-renderText("This application will request users to enter height and weight and then press the 'Calculate' button. The computed Body mass Index result will be displayed . It also displays the BMI Chart")
  
  
  # This part displays the BMI Chart JPEG image in the second tab
  output$pic<- renderImage({list(src="BMIChart.jpg",alt="BMI")},
                           deleteFile = FALSE)
  
  
}
)