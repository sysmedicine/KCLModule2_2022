##############
#Excercises 1#
##############

library(ggplot2)
T == TRUE
#Load file "DATA_SET_REFERENCE_1.csv" in "Data" folder
df1 = read.csv('DATA_SET_REFERENCE_2.txt',sep=',',stringsAsFactors = F, row.names = 1)
View(df1)

#Sort dataframe based on the 'Weight' columns
#hint : order

temp = df1[order(df1[,'Weight']),]

#calculate the standard deviation of 'Age' column (sd)

sd(df1[,'Age'])

#Using logical operator, show that the mean of 'LDL' is higher than 'Sugar_blood' (mean)
df1 = na.omit(df1)
mean_LDL = mean(df1[,'LDL'])
mean_SB = mean(df1[,'Sugar_blood'])

mean_LDL > mean_SB

mean(df1[, 'LDL']) > mean(df1[, 'Sugar_blood'])

#Using iteration/for loop, print the mean weight of the patients based on the "Color_house". Which "Color_house" has higher weight in average?

temp = mean(df1[df1[,'Color_house'] == 'Red','Weight'])

for(color in c('Blue','Brown','Red')){
  temp = mean(df1[df1[,'Color_house'] == color,'Weight'])
  print(color)
  print(temp)
}

for(color in c('Blue','Brown','Red')){
  temp = mean(df1[df1[,'Color_house'] == color,'Weight'])
  print(paste(color,temp,'kg'))
}

#how many patients have enough sleep? (>8 hours)

dim(df1[df1$Sleep_hours > 8,])

#Which house color has in average the highest level of hospitalization?

for(color in c('Blue','Brown','Red')){
  temp = mean(df1[df1[,'Color_house'] == color,'Hospital_times'])
  print(paste(color,temp,'times'))
}

#Make a boxplot of "Sugar_blood" grouped by house color. Which house color has highest Blood sugar average?
#(BONUS point if you can make the boxes to represent their house color)

ggplot(df1,aes(x=Color_house,y=Sugar_blood, group=Color_house)) + geom_boxplot()

#Older patients (>70 years old) decided to paint their house Green. Update the dataframe.

df1[df1$Age > 70,'Color_house'] = 'Green'

#The heavier patients (>100kg) decided to exercise. They took their exercise time from their sleeping time.
#They reduced their sleeping time by 20%. Update the dataframe.

df1[df1$Weigth > 100, 'Sleep_hours'] = df1[df1$Weigth > 100, 'Sleep_hours'] * 0.8

#Make a new dataframe with only 'Age', 'Weight', and 'Sugar_blood' columns.

df2 = df1[,c('Age','Weight','Sugar_blood')]

#Make a heatmap of 'Age', 'Weight', and 'Sugar_blood' columns. 

heatmap(as.matrix(df2), scale="column")

#Based on the clusters in the heatmap, which 2 columns has the highest similarity? (Check the top dendrogram)

#Show the density plot of 'Weight' and 'Sugar_blood' in the same figure. Include the median of both variables in different color.

p <- ggplot(df1) + geom_density(aes(x=Sugar_blood, color="blue"))+geom_density(aes(x=Weigth,color="red"))
p + geom_vline(aes(xintercept=median(Sugar_blood)),
               color="blue", linetype="dashed", size=1)+ 
  geom_vline(aes(xintercept=median(Weigth)),color="red", linetype="dashed", size=1)


##############
#Excercises 2#
##############

#Using similar approaches as before, summarize "DATA_SET_REFERENCE_2.csv" in "Data" folder.
#Make a mini report (max 2 paragraph) in Microsoft Word about the data summary. Put some plots/figures (minimum 3 plots) to support your summary.




