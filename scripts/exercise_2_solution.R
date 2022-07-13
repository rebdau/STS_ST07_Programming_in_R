##################################################################
#                Exercise 2: Cleaning up ufc                     #
##################################################################

#preparation: 
#Choose /rprogramming as your working director, so that you can have access to the ufc.csv file in "./data".

#Load the ufc.csv dataset and call it ufc. The object ufc should be a data frame

ufc <- read.csv("./data/ufc.csv")

#In the ufc dataset, measurements for trees on different plots (=fields) are given.
#"dbh" stands for "diameter at breast height", and is expressed in millimeter.
#"height" is expressed in decimeter.

#Using the summary() function, look if there are strange data, and if so, change them into NA.
#Hint: Look at the heights. If the height is less than a cm, or more than a km, it’s strange.

summary(ufc)
ufc$height
ufc$height[ufc$height < 0.1] <- NA

#Add the variables height in meter (height.m) and diameter in cm(dbh.cm) to ufc.
#Hint: Just assigning the new variables to ufc$height.m and ufc$dbh.cm will do the job.

ufc$height.m <- ufc$height/10
ufc$dbh.cm <- ufc$dbh/10

#Make sure that the variables that can only take a limited number of values are factors (everything except measurements!)
str(ufc)
ufc$plot <- factor(ufc$plot)
ufc$tree <- factor(ufc$tree)
ufc$species <- factor(ufc$species)
str(ufc)

#How many different plots are there (in ufc$plot) ?

ufc$plot
length(levels(ufc$plot))
length(unique(ufc$plot))

#In the ufc dataset, the species F(ir) and the FG(?) are probably intended to be GF (Grand fir).
#Make that change in the ufc data frame.
#Hint 1: You can use the %in% operator to select the species "F" and "FG". The output of (a %in% b) is a logical vector with length = length(a)
#Hint 2: After the change, the levels "F" and "FG" will be empty but still existing. You will have to remove them.

ufc$species[ufc$species %in% c("F", "FG")] <- "GF"

#Check out the species variable in the ufc dataframe. 
#This factor still has all levels that it had before.
#You need to use teh factor() function to redefine all factors,  in order to drop the now empty levels.
#Redefine all factors in ufc and check the levels.

str(ufc)
ufc$plot <- factor(ufc$plot)
ufc$tree <- factor(ufc$tree)
ufc$species <- factor(ufc$species)
str(ufc)

#Now, how many trees do we have for each species in the ufc dataset?
#Hint: The table() function is convenient here!

table(ufc$species)

#There are ten trees with blank species. 
#There are also trees in the ufc dataset for which the dbh value is missing. 
#Check if these correspond to the same trees. (A tree with empty species has dbh NA and vice versa)

identical(ufc[is.na(ufc$dbh), ],ufc[ufc$species == "", ])

#Check also if the trees for which height is NA and trees for which dbh is NA are the same trees.

identical(ufc[is.na(ufc$height), ],ufc[is.na(ufc$dbh), ])
ufc[is.na(ufc$height)&(!is.na(ufc$dbh)), ] #want to have a look at trees that have no height but do have a dbh value

#Height is difficult to measure, therefore that value is often missing.
#But trees with missing dbh and species are actually blank lines representing empty plots.
#You can remove these lines for which species is empty from the ufc dataframe.
#Don't forget to remove the empty levels of the factors afterwards!
#The best is to redefine all the factors.
#Hint: remember the != operator (not equal)

ufc <- ufc[ufc$species != "", ]
ufc$plot <- factor(ufc$plot)
ufc$tree <- factor(ufc$tree)
ufc$species <- factor(ufc$species)
str(ufc)

#Save the new ufc dataset as "ufc_processed.csv" in the data subdirectory.
#Watch out! The rownames should not be written into a new column.

?write.csv
write.csv(ufc, file = "./data/ufc_processed.csv", row.names = FALSE)

