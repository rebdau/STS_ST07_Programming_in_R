###########################################################################################
#                Exercise 3: merging datasets of different dimensions                     #
###########################################################################################

###########################################################################################
#                               1. Using the match() function                             #
###########################################################################################

#preparation: 
#Choose /rprogramming as your working director, so that you can have access to the ufc.csv file in "./data".

#Load the ufc_processed.csv dataset, created in exercise 2 and saved in the data subdirectory, and call it ufc. The object ufc should be a data frame

#Create a new dataset that contains plot, tree and species variables of a subset of ufc containing only species WP. Call the new dataset ufc.wp.

#Randomize the order of the rows in ufc.wp, applying the sample() function. 
#Hint 1: look up how the sample function works with ?sample
#Hint 2: You need to create a "resampled" vector of the numbers 1 to (the number of rows in ufc.wp). Think about subsetting the output of the dim() function.
#Hint 3: That resampled vector will serve a index vector for the rows in the new ufc.wp dataset

#Create a second new dataset which contains the height and dbh of the ufc dataset, also with randomized order of the rows. Call this dataset ufc.values.

#These two datasets contain the unique rownames from the ufc dataset! This will be essential for merging. You can check the row names of the datasets.

#Now merge the intersection of these two new datasets, using the match() function. Call the merged dataset mergedsets.

#I want to check if the alignment was correct! What are the rownames of each of the merged sets?


###########################################################################################
#                               2. Using the merge() function                             #
###########################################################################################

#Create a data frame called params, with three variables: species, b0 and b1.
#The values in the data frame are:
#"WP" and "WL" for species
#32.516 and 85.150 for b0
#0.01181 and 0.00841 for b1

#Select from the ufc dataset the rows for which the species name occurs in params, and assign this selection to a new object called trees.
#The object trees should also be a data frame.
#Hint: the %in% operator can be used to select a subset of a bigger dataset. The output of (a %in% b) is a logical vector with length = length(a)

#After making a selection of a bigger data frame, you need to redefine the factors to drop the now empty levels (use the factor() function).
#Redefine the factor species in trees and check the levels.

#The ufc and the trees data frame do not have the same dimensions but they share the same variable name "species"
#Therefore we can simply use the merge() function to merge the new species parameters to the ufc data frame.
#Try it  out 
#Just type: merge(trees, params)
