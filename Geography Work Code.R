install.packages("dplyr")
library(dplyr)

ZapMap2<-ZapMap_Edit%>%
select(Networks,everything())%>%

ZapMap2<-ZapMap2%>%
mutate(category=case_when(
Networks%in%c(
"ESB ecars","ESB Energy")~"ESB"))

apply_rules <- function(input_string) {
if (startsWith(input_string, "Tesla")) {
return("Tesla")
}else if (startsWith(input_string, "ESB")) {
return("ESB")
}else if(startsWith(input_string,"bp","BP")){
return("BP")  
}else if(startsWith(input_string,"Jolt","JOLT")){
return("Jolt")
}else if(startsWith(input_string,"Shell")){
return("Shell")
}
else if()
else{
return(input_string)
}}
ZapMap2 <- ZapMap2 %>%
  mutate(Branch = sapply(Networks, apply_rules))

view(Branch)


#Correct code to input and categorise all sub-companies under one column called Branch
apply_rules <- function(input_string) {
  if (startsWith(input_string, "Tesla")) {
    return("Tesla")
  } else if (startsWith(input_string, "ESB")) {
    return("ESB")
  } else if (startsWith(tolower(input_string), "bp")) {
    return("BP")
  } else if (startsWith(toupper(input_string), "BP")) {
    return("BP")
  } else if (startsWith(input_string, "Jolt")) {
    return("Jolt")
  } else if (startsWith(input_string, "Shell")) {
    return("Shell")
  } else {
    return(input_string)
  }
}

#Remove a column that wasn't relevant
ZapMap2 <- ZapMap2 %>%
mutate(Branch = sapply(Networks, apply_rules))%>%
select(-"category")

#Move Branch column to front 
ZapMap2<-ZapMap2%>%
select("Branch",everything())

#Rename Branch and Network
ZapMap2<-ZapMap2%>%
rename(
"Conglomerate"="Branch",
"Division"="Networks"
)

#Export ZapMap2 to Excel
install.packages("writexl")
library(writexl)%>%
write_xlsx(ZapMap2, path ="C:/Users/CTUCKER/OneDrive - Department for Transport/Geography Team Work")


install.packages("writexl")
library(writexl)

# Define the file path using double backslashes
file_path <-("~/g/AFP/EITAAll/AMES/002 Energy and Environment/E004 Projects/OLEV Work/Data Sources/Zapmap/r scripts/Taran/Callum/ZapMap2.xlsx")

# Write the dataframe to an Excel file
write_xlsx(ZapMap2, path = file_path)


