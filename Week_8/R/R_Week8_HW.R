library(tidyverse)
library(dplyr)
new_data <- read_csv("turbo_az.csv")
view(new_data)

#1. Rename “barter_mumkundurmu” column to “Barter” and “sign” column to “Valyuta” then assign dataset to “new_turbo_data”.
new_turbo_data <- new_data %>% 
  rename("barter" = "barter_mumkundurmu",
         "Valyuta" = "sign")
view(new_turbo_data)
#2. Find maximum price of new "Lexus" cars.
new_turbo_data %>% filter(Marka=="Lexus",Yeni=="Bəli") %>% summarise(max(Qiymet,na.rm=T))
#3. Which car ("marka") has the maximum price?
select(new_turbo_data, Marka) %>% max(new_turbo_data$Qiymet,na.rm=T)
#4. Which color is most frequent for BMW?
new_turbo_data %>% filter(Marka=="BMW") %>% count(Reng)
#5. How many black "Porsche" cars are new?
new_turbo_data %>% filter(Marka=="BMW",Reng=="Qara") %>% count(Yeni=="Bəli")
#6. What is the maximum price of "Mercedes" cars if the currency is "AZN" and "Oturucu" is "Tam"?
new_turbo_data %>% filter(Marka=="Mercedes",Valyuta=="AZN", Oturucu=="Tam") %>% summarise(max(Qiymet,na.rm=T))
#7. How many new cars are "Mercedes" brand and "E220" model?
new_turbo_data %>% filter(Marka=="Mercedes",Model=="E 220") %>% count()
#8. How many unique colors are in dataset?
unique(new_turbo_data[c("Reng")]) %>% count()
#9. What is the median price for black "Opel" cars?
new_turbo_data %>% filter(Marka=="Opel",Reng=="Qara") %>% summarise(median(Qiymet,na.rm=T))
#10. How many Nissan cars are "Offroader / SUV”?
new_turbo_data %>% filter(Marka=="Nissan",Ban_novu=="Offroader / SUV") %>% count()
