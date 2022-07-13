###########################################################################################
#                      Exercise 4: Lists, Functions and sapply()                          #
###########################################################################################

#preparation: 
#Choose /rprogramming as your working director, so that you can have access to the ufc.csv file in "./data".

#Load the ufc_processed.csv dataset, created in exercise 2 and saved in the data subdirectory, and call it ufc. The object ufc should be a data frame

ufc2 <- ufc[ufc$species %in% c("DF","WC"),]
names(ufc2)
ufc2$species <- factor(ufc2$species)
str(ufc2)

#Assignment: 
#Create a table with the output of a all two sample t-tests, comparing all numeric (or integer) variables in the ufc dataset between Douglas Fir (DF) and Western Cedar (WC).
#The final table must have 4 columns: "mean.DF", "mean.WC", "t.statistic", and "p.value"
#At the end, add a logical variable (column) "significant.05" to the table, indicating if there is a difference between DF and WC at significance level 0.05, and remove the variables plot and tree, for which a t-test did not make sense.

#You need to use the t.test() function like this:
#t.test(numericvariable ~ species)
#where species is a factor with two levels ("DF", and "WC"), and numericvariable is a numeric or integer variable.

#Follow the following approach:
#1. Make a subset of the ufc dataset that contains only the species involved in this assignment, and make species a factor.

#2. Create your own function that performs the t-test and extracts the requested values. Follow this model:
#myfunction <- function(arguments){
#command.1
#command.2
#...
#}

extract.tt <- function (num.var,groups){
tt <- t.test(num.var ~ groups)
sp <- unlist(tt[c("statistic","p.value")])
mm <- tt$estimate
c(mm,sp)
}

#apply your function to a single numeric variable to test the outcome, and adjust your function if necessary.

extract.tt(num.var = ufc2$dbh, groups = ufc2$species)#I hope it works!

#3. Create a logical index vector to automatically select the numeric OR integer variables. Use sapply() to create this index vector.
#(I know it doesn't make sense to do a t-test on variables like "plot" and "tree", but just for the sake of the exercise.)

numvars <- sapply(ufc2,is.numeric)|sapply(ufc2,is.integer)

#4. Using sapply() and the logical index vector created above, apply you function to all numeric or integer variables of the dataset. 

sapply(ufc2[,numvars],extract.tt,groups=ufc2$species)

#5. Check and evaluate the output: is it a table with the four columns as requested? Correct if necessary. Do the final clean-up, adding the logical column, removing rows. The t() function may be useful here.

t.test.result <- sapply(ufc2[,numvars],extract.tt,groups=ufc2$species)
t.test.result <- t(t.test.result)
colnames(t.test.result) <- c("mean.DF", "mean.WC", "t.statistic", "p.value")
class(t.test.result)
t.test.result <- data.frame( t.test.result)
t.test.result$significant.05 <- t.test.result$p.value < 0.05
t.test.result <- t.test.result[-c(1:2),]
t.test.result
