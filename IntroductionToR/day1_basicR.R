#Today we are going to learn on the basics of R.
#We are going to learn about the arithmatic and logical operations, syntax, data type, and ultimately making our own functions

#Try to understand the meaning of each lines/commands. You'll have to use it in the exercises.
#######################
###SIMPLE OPERATIONS###
#######################

a <- 5
b <- 20
c <- 17

#arithmatic calculations
a + b
sum(a,b)
b - c
a * c
b / a
c %% a #modulo
c %/% a

d <- abs(a-b)

#logical operations (results are only TRUE or FALSE)

a == b
(a+d) == b
a >= b
b < c
b > a
(b > a) & (d > c)
(b > a) & (d <= c)

(b > a) == TRUE
(d > c) == TRUE

############
#DATA TYPES#
############

e <- 'My name is Bond'
f <- '007'
g <- 80.3
h <- c(12,17,1)
i <- '12'

class(a)
class(e)
class(f)
class(g)
class(h)
class(i)

h-a
e-a
i-a #Why error?
as.numeric(i)-a #Why works?

e == f

#####################
#STRING MANIPULATION#
#####################
j <- 'James Bond'

paste(e,j,sep=', ')
paste('My codename is',f)
paste('My weight is',g,'kg') #check the difference between paste and paste0

k=paste('My codename is',f)
k
strsplit(k,' ')



###################
#VECTOR AND MATRIX#
###################


#We'll not use this much today but it's good to know. We'll explore it again tomorrow
vector1<-c(1,2,3,7,8)
class(vector1)

vector1*a
vector1+a

vector2<-c(3,2,1,-3,-9)
vector1+vector2

## What happen here?
vector3<-c(3,2,1,-3)
vector1+vector3

#Matrix
airspeed <- matrix(c(10,15,7,10),2,2)
colnames(airspeed)
colnames(airspeed) <- c("laden","unladen") 
colnames(airspeed)[1]
colnames(airspeed)[2] <- "Maria"

A<-matrix(c(1,2,8,3,2,1),3,2)
A
B<-matrix(c(3,6,1,9,2,7),2,3)
B
C<-matrix(c(1:6),2,3)
C

a<-2
A*a
A+a

Matrix1<-matrix(1,2,2)
Matrix1[1,1] <- 1
Matrix1[1,2] <- 3
Matrix1[2,1] <- 2
Matrix1[2,2] <- -2
Matrix1

Matrix2<-matrix(c(1,2,3,-2),2,2)
Matrix2
rownames(Matrix2) <- c("Row1","Gordon")
Matrix2[1,1] 
Matrix2["Gordon",1] 


#######
#LISTS#
#######

l <- list(1, 2, 3)
str(l) #what is this?

vec1 <- letters
vec2 <- 1:4
mat1 <- matrix(1:100, nrow = 5)
df1 <- as.data.frame(cbind(10:1, 91:100))
u.2 <- list(vec1, vec2, mat1, df1, l)
str(u.2)

u.2[1]
str(u.2[1])

u.2[[1]]
str(u.2[[1]])

u.2[[4]][,2]


####################
#BUILDING FUNCTIONS#
####################
function_name <- function(local_variables){
  
  
}

calculate_age <- function(birthyear, thisyear=2022){
  #selection, to check if birthyear is valid
  if(birthyear > thisyear){
    print('ERROR: Invalid birth year')
  } else {
    return(thisyear-birthyear)
  }
}

age=calculate_age(2023) #check the global environment pane, now we have age variable (righthand side)
age

age=calculate_age(1949)
age


print_information <- function(name, age, city){
  temp1=paste('Full Name:',name)
  temp2=paste('Age:',age)
  temp3=paste('Place of Birth:',city)
  
  #repetition
  for(i in c(temp1,temp2,temp3)){
    print(i)
  }
}

print_information('David Beckham', calculate_age(1975), 'London')

#observe the difference between return and print in a function

############
#Excercises#
############

#In this exercises, try to complete the functions with your code to get TRUE in all use cases given.
#Fill the functions with your code where it is marked with "#WRITE YOUR CODE HERE"
#Don't change anything else.

#Example:
valid_birthyear <- function(birthyear, thisyear=2022){
  #WRITE YOUR CODE HERE
  if(birthyear > thisyear){
    return(FALSE)
  } else {
    return(TRUE)
  }
}

#use cases
valid_birthyear(1988) == TRUE
valid_birthyear(2088) == FALSE
#######################################################################

#Question 1

fahrenheit_to_celsius <- function(temp_F) {
  #WRITE YOUR CODE HERE
  
  
  
  
  return(temp_C)
}

fahrenheit_to_celsius(32) == 0
fahrenheit_to_celsius(86) == 30

#Question 2

fahrenheit_double_celcius <- function(){
  for(i in 1:400){
    #WRITE YOUR CODE HERE
    #hint: use the function from Question 1
    
  }
}

fahrenheit_double_celcius() == 320

#Question 3

check_leap_year <- function(year){
  #WRITE YOUR CODE HERE
  
  
  return(isleap)
}

check_leap_year(1990) == FALSE
check_leap_year(1988) == TRUE
check_leap_year(2000) == TRUE

#Question 4

text_wrapper <- function(text, wrapper){
  #WRITE YOUR CODE HERE
  
  return(result)
}

text_wrapper('I love asterisks','****') == '****I love asterisks****'
text_wrapper('Start and close with percent','%') == '%Start and close with percent%'

#Question 5

count_numbers <- function(sentence){
  #WRITE YOUR CODE HERE
  #hint: use as.numeric function from R. Split strings and iterate.
  
  
  return(result)
}

count_numbers('We need to add 1 teaspoon of sugar and 200 ml of water') == 2
count_numbers('Arsenal scored 3 goals in Anfield, 2 from Auba and 1 from Laca') == 3

#Question 6

#We need at least 8 hours of sleep per day, but not more than 10 hours.
enough_sleep <- function(hours){
  #WRITE YOUR CODE HERE
  
  
  return(result)
}

enough_sleep(11) == FALSE
enough_sleep(8) == TRUE
enough_sleep(8.5) == TRUE
enough_sleep(6) == FALSE

#Question 7

check_word <- function(word, sentence){
  #WRITE YOUR CODE HERE
  #hint: check grep function
  
  
  return(result)
}

check_word('Auba', 'Auba is the best player in the world') == TRUE
check_word('WHO', 'Who let the dogs out?') == FALSE


#Question 8

own_is_prime <- function(number){
  #WRITE YOUR CODE HERE
  #don't use any built-in functions to check for prime numbers

  
  
  return(result)
}

own_is_prime(7) == TRUE
own_is_prime(9719) == TRUE
own_is_prime(8370) == FALSE

#Question 9

how_many_prime_between <- function(start,end){
  #WRITE YOUR CODE HERE
  #hint: use function from previous question to check prime numbers. construct a vector called "results" with all the prime numbers in the range.
  #hint: find a way to append new members to vector

  
  #Observe: the output of the function is the length of vector "results".
  return(length(result))
}

how_many_prime_between(1,10) == 4
how_many_prime_between(20,100) == 17
how_many_prime_between(1000,4000) == 382
