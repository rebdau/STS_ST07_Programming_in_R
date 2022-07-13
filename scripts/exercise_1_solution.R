##################################################################
#              Exercise 1: Directories and Files                 #
##################################################################

##################################################################
#                   Preparation (NOT IN R)                       #
##################################################################

#Before the exercise, you need to create a directory, called, rprogramming, which contains the following subdirectories:
#/data
#/graphics
#/notes
#/scripts

#In the /data subdirectory, place all the dataset of the course
#Using the menu bar, choose rprogramming as your working directory

##################################################################
#                           Exercise                             #
##################################################################

##Using the command line, set the working directory to rprogramming/scripts

getwd()#all functions are followed by brackets!
mainDir <- getwd()
list.files() #check to which number in the list the subdirectory you want corresponds (here "scripts")

#In the command below, the square brackets indicate a subsetting.
#Adapt the number between brackets according to the position of directory scripts in the output of list.files()

subDir <- list.files()[6] #list.files() corresponds to the output of the command above.
setwd(file.path(mainDir, subDir))
getwd()
list.files()

##Which files are in rprogramming/data?

list.files("../data") #I can see that ufc is number 11 in the list

##Load ufc.csv from an absolute address, and name it ufc

file <- list.files("../data")[11] #this is only interesting if the file has a very long name where typing mistakes are possible.
list.files(mainDir) #data is the first in the list
subDir <- list.files(mainDir)[1]
adress <- file.path(mainDir, subDir, file)
adress
ufc <- read.csv(adress)
dim(ufc)#do the dimensions make sense?
names(ufc)# are the column names ok?
head(ufc)# make sure column names and row names (if they were there) are correctly imported

##Load Lflavum.csv from a relative address and name it Lflavum

getwd()
Lflavum <- read.csv("../data/Lflavum.csv")#this is just one way to do it
dim(Lflavum) #there are two dimensions, that's ok
names(Lflavum) #the first column name is suspicious, maybe the first column should be read as rownames?
head(Lflavum) #indeed, first column should be rownames!
?read.csv #I check in the documentation or the function read.csv() how I can read rownames correctly
#I read that the argument row.names can be single number giving the column of the table which contains the row names, so I will set that argument row.names=1
Lflavum <- read.csv("../data/Lflavum.csv", row.names = 1)
head(Lflavum)#that looks better!

##How many variables do these datasets have?

str(ufc)
str(Lflavum)

##What are the dimensions of these datasets?

dim(ufc)#rows, #columns, always in that order
dim(Lflavum)#rows, #columns, always in that order

##Save these same datasets in the data subdirectory, under different names (ufc_ex1.csv and Lflavum_ex1.csv), and check in excel! (correct the arguments of write.csv() if necessary.)

write.csv(ufc, file="../data/ufc_ex1.csv")
#check in excel, R added rownames and "NA" for missing values. I'll check in the documentation of the function write.csv() how I can avoid this
write.csv(ufc, file="../data/ufc_ex1.csv", row.names = FALSE, na = "")
#check in excel, this is exactly how it was before
write.csv(Lflavum, file="../data/Lflavum_ex1.csv")
#check in excel, this is ok

##Create, in the graphics subdirectory a pdf named “1to10.pdf”, in which you execute the following command: >plot(1:10,1:10)

pdf("../graphics/1to10.pdf") #opens a pdf device
plot(1:10,1:10)
dev.off()

##Save your commands in a commented script in the scripts directory (This DOES NOT WORK on Mac!)

history(200) #the 200 last commands. I copy them in a new script and save that script using the menu bar

