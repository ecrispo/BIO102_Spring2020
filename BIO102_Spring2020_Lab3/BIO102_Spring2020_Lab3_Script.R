#Make sure your data file is formatted correctly.
#It must be saved in comma separate values format (.csv).
#There must be one row of column names (i.e. the header).
#There must be no spaces or special characters such as parentheses in the first row (i.e. the header).
#The code below will work if you used the data template provided to you.
#If you used different header names, you will need to edit the code accordingly.
#Since the template does not include units in the column headers, note here that the units are cm.

#Step 1. Open the data file in R.
chelaeData=read.csv(file.choose(),header=T)
#Make sure you chose the correct file.
chelaeData

#Step 2. Calculate the approximate area, in cm^2, for each of the chelae (right and left).
rightArea=chelaeData$RightW*chelaeData$RightL
rightArea
#Repeat the above steps, but for the LEFT chelae (leftArea). 
#You will need to write your own code here in this script and save it on your computer.
leftArea=

#Step 3. Find the difference in chelae area (in cm^2).
#Note that we are here subtracting the LEFT area from the RIGHT area. This is very important when interpreting the results.
differenceArea=rightArea-leftArea
differenceArea

#Step 4. Calculate summary statistics for the difference in chelae area.
#Standard deviation
sd(differenceArea)
#The summary includes the mean, median, maximum, minimum, etc.
summary(differenceArea)
#Standard error
sd(differenceArea)/sqrt(length(differenceArea))
SE=sd(differenceArea)/sqrt(length(differenceArea))
#Approximate confidence intervals for large sample size.
mean(differenceArea)-2*SE
mean(differenceArea)+2*SE

#Step 5. Repeat step 4, but for each sex separately.
#Start with the males.
rightAreaMale=(chelaeData$RightW[chelaeData$Sex=="M"])*(chelaeData$RightL[chelaeData$Sex=="M"])
rightAreaMale
leftAreaMale=(chelaeData$LeftW[chelaeData$Sex=="M"])*(chelaeData$LeftL[chelaeData$Sex=="M"])
leftAreaMale
differenceAreaMale=rightAreaMale-leftAreaMale
differenceAreaMale
summary(differenceAreaMale)
sd(differenceAreaMale)
SEmale=sd(differenceAreaMale)/sqrt(length(differenceAreaMale))
SEmale
CIlowerM=mean(differenceAreaMale)-2*SEmale
CIupperM=mean(differenceAreaMale)+2*SEmale

#Now, do the same for the females. You will need to create your own code below.
rightAreaFemale=
leftAreaFemale=
differenceAreaFemale= 
summary(differenceAreaFemale)
sd(differenceAreaFemale)
SEfemale=
CIlowerF=
CIupperF=

#Step 6. Create a graph using your data.
#The variable we want on the y axis comes first, and then we include our x axis variable after the tilde (~).
#ylab and xlab are the labels (titles) of our y and x axes, respectively.
stripchart(differenceArea~chelaeData$Sex,vertical=T,ylab="Difference in Chelae Area (Right - Left) (cm^2)",xlab="Sex",method="jitter")
#The following code adds the means to the graph.
points( c(1,2), tapply(differenceArea, chelaeData$Sex, mean), pch=16,cex=2)
#The following code adds error bars (confidence intervals) to our graph.
lines(c(1,1),c(CIlowerF,CIupperF),lwd=5)
lines(c(2,2),c(CIlowerM,CIupperM),lwd=5)
arrows(1, CIlowerF, 1, CIupperF, angle=90, code=3,lwd=5)
arrows(2, CIlowerM, 2, CIupperM, angle=90, code=3,lwd=5)

#Step 7. Note that in the code above you calculated an APPROXIMATION of the confidence intervals, which is okay to do if your sample size is large.
#Using the code below, calculate the EXACT confidence intervals.
#How do they compare?
t.test(differenceAreaMale,mu=0)
t.test(differenceAreaFemale,mu=0)
