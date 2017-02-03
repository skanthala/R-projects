#Readin fiel in to R
library(readr)
titanic3 <- read_csv("~/Titanic/titanic3.csv")
#checking file :
View(titanic3)
#checking missing values in embarked column:
which(is.na(titanic3$embarked))
#replacing missing values in embarked with S
titanic3[["embarked"]][is.na(titanic3[["embarked"]])] <- "S"
#checking if missing values has been replaced:
which(is.na(titanic3$embarked))
#cheking missing values in age column:
which(is.na(titanic3$age))
#Replacing  missing values in age with mean of age:
titanic3$age[which(is.na(titanic3$age))] <- mean(titanic3$age, na.rm = TRUE)
#cheking missing values in boat column
which(is.na(titanic3$boat))
#Replacing missing values in boat with "None":
titanic3[["boat"]][is.na(titanic3[["boat"]])] <- "None"
#checking missing values have been replaced in boat column:
which(is.na(titanic3$boat))
#chekcing missing values in cabin column:
which(is.na(titanic3$cabin))
#Creating has_cabin_number and adding 0 and 1 :
titanic3 [which(is.na(titanic3$cabin)),"has_cabin_number"]<-0
titanic3 [which(is.na(titanic3$has_cabin_number)), "has_cabin_number"] <- 1
#Exporting titanic_clean to csv file:
write.csv(titanic_clean, "titanic_clean.csv")

