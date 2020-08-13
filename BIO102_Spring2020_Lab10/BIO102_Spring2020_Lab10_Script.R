#First, open the data, making sure the file is saved in csv format and has no spaces or special characters like parentheses.
stoma=read.csv(file.choose(),header=T)

#Next, see the names of the data columns
names(stoma)

#Make a graph. Change the code to give your axes appropriate titles (including units). 
stripchart(StomataDensity~PlantType,data=stoma,vertical=T,ylab="GIVE A NICE NAME WITH UNITS",xlab="GIVE A NICE NAME",xlim=c(0.5,2.5),ylim=c(350,750))

#Do the means differ significantly between plant types?
MEAN=tapply(stoma$StomataDensity,list(stoma$PlantType),mean)
MEAN

#SD is the standard deviation
SD=tapply(stoma$StomataDensity,list(stoma$PlantType),sd)
SD

#What is SE? If your sample size per plant type was different from 3, use your sample size.
#This only works if your sample size was the same across plant types.
SE=SD/sqrt(3)
SE

#The CI upper and lower values are your 95% confidence intervals for the mean stomata density.
CIupper=MEAN+2.78*SE
CIupper
CIlower=MEAN-2.78*SE
CIlower

#Plot the means on your stripchart.
points(c(1,2), tapply(stoma$StomataDensity, stoma$PlantType, mean), pch=16,cex=2)

#Add error bars.Instead of 'lower' and 'upper', you will have to type in the values for the lower and upper bound for the confidence interval. You will do this for each of your three plant types, A (1), B (2), and C (3).
lines(c(1,1),c(lower,upper),lwd=5)
lines(c(2,2),c(lower,upper),lwd=5)

#Then make it look nice by adding an "arrow" on top and bottom of the bars.
#Again, you will have to replace 'lower' and 'upper' with the values for the upper and lower limits of the confidence intervals. 
arrows(1, lower, 1, upper, angle=90, code=3,lwd=5)
arrows(2, lower, 2, upper, angle=90, code=3,lwd=5)
