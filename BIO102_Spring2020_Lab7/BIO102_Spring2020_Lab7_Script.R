
#Remember that your csv spreadsheet must not contain any special characters such as parentheses, nor any spaces.
#Make sure that your genus names are consistent, with no variation in spelling or capitalization within a genus.

#Give your data set a name (e.g. worm in this case) and open the correct data file.
worm=read.csv(file.choose(),header=T)

#Check that you opened the data set correctly. This code will show you just the header, i.e. first row of column names. 
names(worm)

#Plot the logged data. WHY LOGGED?
#Replace the question marks in the line below with what should go on the Y axis ~ what should go on the X axis. Inside the quotations, enter the y and x labels with units.
plot(log(?)~log(?),data=worm,ylab="",xlab="")

#Create the regression model. The ~ means that we are testing whether log rostellumDiameter depends on log neckWidth.
#Replace question marks with Y and X, respectively.
regressionModel=lm(log(?)~log(?),data=worm)

#Draw a best-fit regression line on your graph.
abline(regressionModel)

#Look at the results of your regression analysis. Don't get bogged down, as there is a lot of info there!
#The slope is the value you see in the "Estimate" column and the "log(neckWidth)" row in the table.
summary(regressionModel)

#Construct a 95% confidence interval for the slope. You're not interested in the intercept, only the log(neckWidth) effect on log(rostellumDiameter).
#Does 1 fall in this slope? Is the slope significantly greater or less than 1?
confint(regressionModel)

#Next, we will analyze the data for each of three genera separately.
#The three genera we will analyze are Dipylidium, Echinococcus, and Moniezia. 
EchinococcusRostellumDiameter=worm$rostellumDiameter[worm$Genus=="Echinococcus"] 
EchinococcusRostellumDiameter
EchinococcusNeckWidth=worm$neckWidth[worm$Genus=="Echinococcus"] 
EchinococcusNeckWidth
EchinococcusModel=lm(log(EchinococcusRostellumDiameter)~log(EchinococcusNeckWidth))
summary(EchinococcusModel)
confint(EchinococcusModel)
abline(EchinococcusModel,col="blue")

#Now, you repeat the above steps for Dipylidium and Moniezia, but use a different color (other than black or blue) for each of the best fit regression lines. 
#In your figure caption, note what genus each of the colored lines represents in the graph.