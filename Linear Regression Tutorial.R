#Linear Regression Tutorial 
#Author: Nicole Regimbal - Just One Bird's Opinion 
#Date: June 21, 2023

#Load in necessary libraries
  #If these libraries are not yet installed, first use the function install.packages()
library(ggplot2)
library(ggpubr)

#Set your working directory
getwd() #This tells R that you want to get a new working directory
setwd("Insert your path here") #This tells R where to find that new directory
dir() #This tells R to retrieve this new directory to use 

#Read in your data - we will call this dataframe 'df'
df <- read.csv("student_grades.csv", header = TRUE) 
  #The header = TRUE part of the code tells R that the first row of your data is the column names 

head(df) #This gives you a preview of the first few lines of the entire dataframe

#Question - Does the number of hours spent studying affect student exam grades?

  #Let's use linear regression to answer this 
  #The formula for this in R is lm(Y ~ X, data = df)

model <- lm(Exam_Grade ~ Hours_Studying, data = df)

summary(model) #This shows us the model output

#Let's plot this regression! 
  #ggplot is a helpful package to create plots where you can easily change aeshetic features
ggplot(df, aes(x = Hours_Studying, y = Exam_Grade))+
  geom_point()+ #plots the individual data points
  geom_smooth(method = "lm")+ #this creates the regression line
  scale_x_continuous("Hours Studying")+ #x-axis label
  scale_y_continuous("Exam Grade")+ #y-axis label
  theme_bw(base_size = 12)+ #cleaning up the plot aesthetics
  theme(panel.border = element_rect(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  stat_regline_equation(label.y = 100, aes(label = ..rr.label..))+ #adding R2 to plot
  stat_regline_equation(label.y = 105, aes(label = ..eq.label..)) #adding equation to plot

#Good luck and happy coding! 
#Check out my channel 'Just One Bird's Opinion' on YouTube if you have any questions! 
