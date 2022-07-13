###########################################################################################
#                      Exercise 4: Lists, Functions and sapply()                          #
###########################################################################################

#preparation: 
#Choose /rprogramming as your working director, so that you can have access to the ufc.csv file in "./data".

#Load the ufc_processed.csv dataset, created in exercise 2 and saved in the data subdirectory, and call it ufc. The object ufc should be a data frame

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

#apply your function to a single numeric variable to test the outcome, and adjust your function if necessary.

#3. Create a logical index vector to automatically select the numeric OR integer variables. Use sapply() to create this index vector.
#(I know it doesn't make sense to do a t-test on variables like "plot" and "tree", but just for the sake of the exercise.)

#4. Using sapply() and the logical index vector created above, apply you function to all numeric or integer variables of the dataset. 

#5. Check and evaluate the output: is it a table with the four columns as requested? Correct if necessary. Do the final clean-up, adding the logical column, removing rows. The t() function may be useful here.

