#############
#Exercises 1#
#############
df2 <- read.table("Data/DATA_SET_REFERENCE_4_A.csv",sep=",",header=TRUE,row.names = 1)

head(df2)

#Finding correlated genes with Gene1
gene1 = df2['Gene1',]

for(genename in rownames(df2)){
  temp = df2[genename,]
  cor_var = cor.test(as.numeric(gene1), as.numeric(temp))
  if(cor_var$p.value < 0.01){
    print(genename)
  }
}

#####
gene1 = df2['Gene1',]

for (genename in rownames(df2)) {
  temp=(df2[genename,])
  cor_var=cor.test(as.numeric(gene1),as.numeric(temp))
  if(cor_var$p.value<0.05){
    print(genename)
  }
}

##

for(genename in rownames(df2)){
  cor_var = cor.test(as.numeric(df2['Gene1',]), as.numeric(df2[genename,]))
  if(cor_var$p.value < 0.01){
    print(genename)
  }
}

plot(as.numeric(df2['Gene1',]),as.numeric(df2['Gene3',]))

df2_t = as.data.frame(t(df2))

ggplot(as.data.frame(t(df2)), aes(x=Gene1, y=Gene3)) + geom_point(size = 1)






temp=as.numeric(df2['Gene2',])
for(i in rownames(df2)){
  temp1=as.numeric(df2[i,])
  temp2=cor.test(temp,temp1)
  if(temp2$p.value < 0.01){
    print(i)
  }
}

#Find the gene with highest median (Remember the material yesterday?)

highest_value = 0
gene_name = NA

for(genename in rownames(df2)){
  temp = median(as.numeric(df2[genename,]))
  if(temp > highest_value){
    highest_value = temp
    gene_name = genename
  }
}

temp = rowMeans(df2)

temp_ordered = temp[order(temp)]

#Find correlated genes with Gene2, Gene203, and Gene119

for(gene_selected in c('Gene2','Gene203','Gene119')){
  gene_filtered = df2[gene_selected,]
  print(paste('Selected Gene:', gene_selected))
  for(genename in rownames(df2)){
    temp = df2[genename,]
    cor_var = cor.test(as.numeric(gene_filtered), as.numeric(temp))
    if(cor_var$p.value < 0.01){
      print(genename)
    }
  }
  print('------------')
}

#Plot 1 gene-pair that are significantly correlated (up to you) from the analysis above and see how correlated are they based on the plot
ggplot(as.data.frame(t(df2)), aes(x=Gene119, y=Gene3)) + geom_point(size = 1)

#Plot 1 gene-pair that are NOT significantly correlated (up to you) from the analysis above and see how correlated are they based on the plot
ggplot(as.data.frame(t(df2)), aes(x=Gene119, y=Gene2)) + geom_point(size = 1)

#Is there any genes that has non-normal distribution?

for(genename in rownames(df2)){
  temp = df2[genename,]
  norm_var = ks.test(as.numeric(temp),'pnorm')
  if(norm_var$p.value > 0.01){
    print(genename)
  }
}


#Plot histogram of Gene2, Gene203, and Gene119, and comment on their normality

hist(as.numeric(df2['Gene119',]))

#Pick 3 pairs of genes (Up to you), and do Linear regression for them. Check if their significance.

LMoutput2 = lm(as.numeric(df2['Gene8',]) ~  as.numeric(df2['Gene203',]))
summary(LMoutput2)

LMoutput2 = lm(as.numeric(df2['Gene1',]) ~  as.numeric(df2['Gene2',]))
summary(LMoutput2)

#############
#Exercises 2#
#############

#Use df3 for this exercise
df3 <- read.table("Data/DATA_SET_REFERENCE_2.csv",
                  sep=",",header=TRUE,row.names = 1)

mean(df3$LDL, na.rm = TRUE)
median(df3$LDL, na.rm = TRUE)

colSums(is.na(df3[df3$Color_house == 'Brown',]))



#Find the highest correlated variable with "LDL" level

#Check the normality of each numeric column, anything not following normal distribution?

#Do Linear Regression for LDL vs the rest of the variables. Note their significance levels

cor_function <- function(gene_input){
  gene1 = df2[gene_input,]
  for(genename in rownames(df2)){
    temp = df2[genename,]
    cor_var = cor.test(as.numeric(gene1), as.numeric(temp))
    if(cor_var$p.value < 0.01){
      print(genename)
    }
  }
}

cor_function('Gene3')


gene1 = df2['Gene1',]

for(genename in rownames(df2)){
  temp = df2[genename,]
  cor_var = cor.test(as.numeric(gene1), as.numeric(temp))
  if(cor_var$p.value < 0.01){
    print(genename)
  }
}

gene1 = df2['Gene2',]

for(genename in rownames(df2)){
  temp = df2[genename,]
  cor_var = cor.test(as.numeric(gene1), as.numeric(temp))
  if(cor_var$p.value < 0.01){
    print(genename)
  }
}

gene1 = df2['Gene3',]

for(genename in rownames(df2)){
  temp = df2[genename,]
  cor_var = cor.test(as.numeric(gene1), as.numeric(temp))
  if(cor_var$p.value < 0.01){
    print(genename)
  }
}

