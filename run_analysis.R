library(data.table)
library(dplyr)
library(data.table)
library(stringr)

calculateRelevantColumns <- function() {

    # Load measurement names(called "features"), which are column name for our purposes
  allDataColumns<-fread("features.txt")
  setnames(allDataColumns,c("V1","V2"),  c("columnNbr","description"))
  allDataColumns$description<- gsub("[,()]","-",allDataColumns$description)
  
  # We're supposed to only load std and mean from the main data files.  Next bit calculates which fields to count and 
  # which to skip.  We know that each column in the data files is 16 bytes.
  allDataColumns$include<- str_count(allDataColumns$description,"mean") | str_count(allDataColumns$description,"std")
  # Add column numbers in the file BEFORE eliminating the columns we're skipping
  allDataColumns<-mutate(allDataColumns,columnStart=(columnNbr-1)*16+1)
  columnsToLoad<-allDataColumns[allDataColumns$include,]
  columnsToLoad<-mutate(columnsToLoad,skip=0)
  columnNumbers<<-c(-1,16)
  
  with(columnsToLoad, 
       for (i in 2:nrow(columnsToLoad)) { 
         # If gap between columns > 16, that means we're skipping a column, so the width 
         # needs to be shown as a negative number
         if ((columnStart[i]-columnStart[i-1])> 16) {
           columnsToLoad$skip[i]<<-(-1*(columnStart[i]-columnStart[i-1]-16))}
         if (columnsToLoad$skip[i] != 0) { columnNumbers <<- 
           c(columnNumbers,columnsToLoad$skip[i]) }
         columnNumbers <<- c(columnNumbers,16)
       } 
  )
  columnNumbers <<- c(columnNumbers)
  columnNames <<- str_replace_all(columnsToLoad$description,"-","")
}

loadData <- function() {
# Load Activities
activities<-read.fwf("activity_labels.txt",c(2,99),col.names = c("actID","name"))
# Convert them to proper case.
activities<- mutate(activities,name=(str_replace(str_to_title(name),"_"," ")))


#load both data sets
rawTest<-data.table(read.fwf("test/X_test.txt",widths=columnNumbers,sep="", 
                  col.names = columnNames))
rawTrain<-data.table(read.fwf("train/X_train.txt",widths=columnNumbers,sep="", 
                  col.names = columnNames))

# Add subject(code) and activity(name)
# Test data first 
subjectsTest <-fread("test/subject_test.txt")
rawTest$subject <- subjectsTest

activityCodesTest <-fread("test/Y_test.txt")
temp<-merge(activities, activityCodesTest,by.x="actID",by.y="V1")
rawTest$activity <- temp$name

# Training data 
subjectsTrain <-fread("train/subject_train.txt")
rawTrain$subject <- subjectsTrain

activityCodesTrain <-fread("train/Y_train.txt")
temp<-merge(activities, activityCodesTrain,by.x="actID",by.y="V1")
rawTrain$activity <- temp$name

consolidatedResults <<- union(rawTrain, rawTest)
}

main <- function() {
# Main calls the 2 primary functions, and then writes the data file. 
  calculateRelevantColumns()
  loadData()
  results <- (consolidatedResults %>% group_by(subject,activity) %>% 
                summarise_each(funs(mean)) %>% arrange(subject,activity)) 
  write.table(results,"CourseProjectTidyTable.txt",row.name=F)
}
