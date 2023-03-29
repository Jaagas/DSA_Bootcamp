library(tidyverse)
library(dplyr)
new_data <- read_csv("bina_az.csv")
view(new_data)


#1. Remove “X1” columns and assign it to “newdata”.
newdata <- new_data %>% select(-...1) 
#2. Move variable “ID” to first column.
newdata <- newdata %>% select(ID,sahe, nov,everything())
#3. Select Address columns.
adres <- newdata %>% select(contains("Adres"))
#4. Create new variable. Name it “newcol” and the value is “sahe” divided by “otaq”. 
#Keep only newcreated variable.
newdata <- newdata <- drop_na()
newdata2 <- newdata %>% transmute(newcol=sahe/as.numeric(otaq))
newdata %>% str()
#5. What is the maximum price of “kohne tikili”?
newdata %>% filter(nov=="Köhnə tikili")%>% select(qiymet)%>% arrange(desc(qiymet)) %>% head(1)
#6. Find unique addresses in the "address" column.
newdata %>% select(contains('Adres')) %>% gather(key = column, value = row) %>% select(row)%>% unique() %>% count()
#7. Show frequency of 'otaq' column for new houses (Yeni tikili) having price more than 500 000.
newdata %>% filter(nov=="Yeni tikili", qiymet>500000) %>% count(otaq)
#8. Calculate average price of houses having 'kupça' and an area more than 200m2
newdata %>% filter(kupca=="var",sahe>200) %>% summarise(orta_qiymet=mean(qiymet,na.rm=T),sum_=sum(qiymet))
#9. Calculate price range of houses having 4 rooms.
newdata %>% filter(otaq==4) %>% summarise(min_q=min(qiymet,na.rm=T),max_q=max(qiymet,na.rm=T))
#10.How many “mülkiyyətçi” placed an ad for a "Yeni tikili" with an area more than 100m2?
newdata %>% filter(sahe>100, nov=="Yeni tikili",elani_yerlesdiren=='mülkiyyətçi') %>% count()
