#First, we must convert our Excel file so that we can open our data in R.

#We can only have one "header" row, i.e., a row at the top with column names. 
#STEPS:
#Click on the 1 on the far left of your Excel sheet so that this top row is highlighted.
#Right click and select "Delete".

#Remove the spaces and parentheses. 
#STEPS for the easy way to do this:
#Make sure that none of your cells are highlighted.
#From the HOME tab, click on the pair of binoculars (Find & Select) and choose "Replace" from the dropdown menu.
#In the "Find what" box, enter a space. In the "Replace with" box, do not enter anything.
#Hit "Replace All".
#Repeat the above steps, but for "(" and ")" instead of the space. 

#Data file must be in csv format.
#Go to the FILE tab and select "Save As".
#Select the location where you want to save the file.
#When a new box opens up, select "Save as type" and choose "CSV (comma deliminated)".
#Save the file. When it asks you if you're sure you want to save it in that format, select yes.

#Now you can open your new file in R.
#You can call the data set anything you want in R. We will call it birdData.
birdData=read.csv(file.choose(),header=TRUE)
#When a window pops up, select the .csv file you created.
#To make sure you opened the correct file, view the first 6 rows of data using this code:
head(birdData)

#Now, let's create our histograms.
#This first line of code allows you to view two histograms at the same time.
par(mfrow=c(1,2))
#The first graph displays data for the birds that were last observed in 1977 (i.e. they died that year).
hist(birdData$BeakDepthmm[birdData$LastYear==1977],breaks=16,col="red",xlab="Beak Depth (mm)",ylab="Number of Birds",main="Non-Survivors")
#The second graph displays data for birds that were also observed after the drought, in 1978 and up to and including 1982.
#These are the birds that survived the drought of 1977.
hist(birdData$BeakDepthmm[birdData$LastYear!=1977],breaks=16,col="blue",xlab="Beak Depth (mm)",ylab="Number of Birds",main="Survivors")
#The != means "does not equal".
#How do the distributions compare? HINT: Look at the x axes limits.

#Let's find the means and standard deviations of the two sets of data.
mean(birdData$BeakDepthmm[birdData$LastYear==1977])
sd(birdData$BeakDepthmm[birdData$LastYear==1977])
mean(birdData$BeakDepthmm[birdData$LastYear!=1977])
sd(birdData$BeakDepthmm[birdData$LastYear!=1977])

#Let's take smaller samples from our sample of birds. 
#We would NOT do this if this was our research study. 
#We are only taking smaller samples for educational purposes, so you can see how changing the sample size influences our study's results.
FifteenNon=sample(birdData$BeakDepthmm[birdData$LastYear==1977],15,replace=FALSE)
FifteenSurvive=sample(birdData$BeakDepthmm[birdData$LastYear!=1977],15,replace=FALSE)
#Replace means that a bird can only be sampled once. It does not get put back in the pile to be sampled again.
#What do your data look like?
FifteenNon
FifteenSurvive

#What are the means and standard deviations of our new smaller samples? How do they compare?
mean(FifteenNon)
sd(FifteenNon)
mean(FifteenSurvive)
sd(FifteenSurvive)

#Repeat the above steps for samples of Five (5) birds instead of 15.
#You will need to create your own code, replacing Fifteen with Five, and replacing 15 with 5.

#Are the means of the survivors and non-survivors significantly different from each other?
#The code below is OPTIONAL. It is not part of your worksheet. 
#But we will be discussing 95% confidence intervals next week, and here is a little introduction to that.
#If the confidence intervals INCLUDE 0, the groups are NOT significantly different from each other.
#If 0 is OUTSIDE of the confidence interval, the groups ARE significantly different from each other. 
t.test(birdData$BeakDepthmm[birdData$LastYear==1977],birdData$BeakDepthmm[birdData$LastYear!=1977],var.equal=T)
t.test(FifteenSurvive,FifteenNon,var.equal=T)
t.test(FiveSurvive,FiveNon,var.equal=T)

#A quick note that if you ever want to erase R's memory and start with a clean slate, use:
rm(list=ls())
