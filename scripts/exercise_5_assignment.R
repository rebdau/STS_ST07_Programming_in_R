##############################################################
#             Exercise 5: from dataframe to list and back:   #
#                   split and do.call                        #
##############################################################


#preparation: 
#Choose /rprogramming as your working director, so that you can have access to the lcms.csv file in "./data".

#Load the lcms.csv dataset, and call it lcms. The object lcms should be a data frame.

#This dataset contains data from an lcms analysis of an extract of flax plantlets that were fed with stable-isotope-labeled (SIL) coumaric acid.
#This labeled coumaric acid conatains 3 13C carbons, and is incorporated in other metabolites via metabolic pathways.
#When labeled coumaric acid is incorporated into a compound, this results in an increase of the molecular weight with +3 Dalton.

#In the lcms dataset, each row represents an "LCMS feature", caracterized by 
#a retention time, expressed in seconds ("rt"), 
#and an m/z (mass divided by charge) value ("mz").

#These features were detected in the samples "t01", "t02", ..., till "t111",
#and the signal intensities of the features in these samples are given in the variables with the corresponding names.

#Several features caracterized by the same retention time but different mz values, may belong to the same molecule
#The features belonging to the same molecule comprise (i) its natural isotopes, (ii) potential adducts, (iii) fragment ions produced inside the ionization source (in-source
#fragmentation; ISF), and (iv) in-source reactions.
#the variable "isotopes" in the lcms dataset indicates if a feature corresponds to the monoisotopic mass (containing only 12C) of a compound, 
#or a natural isotope containing one or more 13C.
#For example, "[4][M]+" and "[4][M+1]+" represent the monoisotopic mass atnd a 13C isotope of compound [4].


#Assignment 1 (warm up): 
#For how many compounds the M+1 isotope was detected?
#approach: Check out the grep() and grepl() functions to search for the "M+1" patterns in a character vector 

#In the lcms dataset, 
#the variable "annotation" gives the name of the molecular structure that was attributed to the feature
#the "number" variable gives a distinct number to each distinct compound. 
#You can see that a single compound (number) can contain several features.
#The "adduct" variable indicates the ionisation form of the feature:
#e.g. [M-1]- means "[Molecule minus 1 proton]charge = -1"
#e.g. [M+Ac-H]- means "[Molecule plus acetate minus 1 proton]charge = -1"
#The numeric variable "CouA" indicates how many 13C3-labeled coumaric acid moieties are incorporated in this feaure (0, 1 or 2)

#Assignment 2: 
#For each distinct adduct ("adduct") of each distinct compound ("number"),
#If a 13C6-labeled form ("CouA" == 2) is present,
#calculate for each of the samples ("t01" till "t111")
#the ratio of the intensity of the 13C6-labeled form ("CouA" == 2) over the unlabeled form ("CouA" == 0)
#The final output should be a table with the the 13C6/13C0 ratio for each of the samples.
#The rownames of the table should give the compound number.

#Hints:
#check out the interaction() function to combine factors
#You can use the split() function to create a list of subsets (defined by factor levels) of the dataframe.
#You will have to create a function containing conditional commands like this:
my.function <- function(parameters){

if(condition == true){
execute this
}

}
#do.call passes elements of your_list as arguments to rbind. 
#It's equivalent of rbind(your_list[[1]], your_list[[2]], your_list[[3]], ....., your_list[[length of your_list]])


