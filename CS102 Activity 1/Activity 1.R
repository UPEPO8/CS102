library(ggplot2)
library(dplyr)
library(polite)
library(xml2)
library(magrittr)
library(rvest)
library(httr)


polite::use_manners(save_as = "polite_scrape.R")
url1 <- 'https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A172635&ref=nav_em__nav_desktop_sa_intl_printers_0_2_6_11'
url2 <- 'https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A172584&ref=nav_em__nav_desktop_sa_intl_scanners_0_2_6_12'
url3 <- 'https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A193870011&ref=nav_em__nav_desktop_sa_intl_computer_components_0_2_6_3'

session1 <- bow(url1,
                 user_agent = "Educational")
session1

session2 <- bow(url2,
                user_agent = "Educational")
session2

session3 <- bow(url3,
                user_agent = "Educational")
session3
  
  
#Get the Parent Node
parent1 <- scrape(session1) %>% 
  html_elements('div.sg-col-inner')
  
  
title1 <- parent1 %>%
  html_node('.a-size-base-plus.a-color-base.a-text-normal') %>%
  html_text()
  
price1 <- parent1 %>%
  html_node('.a-offscreen') %>%
  html_text()

stars1 <- parent1 %>%
  html_node('.a-icon-alt') %>%
  html_text()

numberRatings1 <- parent1 %>%
  html_node('.a-size-base.s-underline-text') %>%
  html_text()


#Number 2
parent2 <- scrape(session2) %>% 
  html_elements('div.sg-col-inner')


title2 <- parent2 %>%
  html_node('.a-size-base-plus.a-color-base.a-text-normal') %>%
  html_text()

price2 <- parent2 %>%
  html_node('.a-offscreen') %>%
  html_text()

stars2 <- parent2 %>%
  html_node('.a-icon-alt') %>%
  html_text()

numberRatings2 <- parent2 %>%
  html_node('.a-size-base.s-underline-text') %>%
  html_text()


#Number 3

parent3 <- scrape(session3) %>% 
  html_elements('div.sg-col-inner')


title3 <- parent3 %>%
  html_node('.a-size-base-plus.a-color-base.a-text-normal') %>%
  html_text()

price3 <- parent3 %>%
  html_node('.a-offscreen') %>%
  html_text()

stars3 <- parent3 %>%
  html_node('.a-icon-alt') %>%
  html_text()

numberRatings3 <- parent3 %>%
  html_node('.a-size-base.s-underline-text') %>%
  html_text()


allTitle <- c(title1,title2,title3)
allTitle

allPrice <- c(price1,price2,price3)

allStars <- c(stars1,stars2,stars3)

allNumberRatings <- c(numberRatings1,numberRatings2,numberRatings3)
df <- data.frame(allTitle,allPrice,allStars,allNumberRatings)
View(df)



  
 




