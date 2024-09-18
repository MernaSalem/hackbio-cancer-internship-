library(ggplot2)
library(plotly)
library(dplyr)
library(tidyr)
library(maps)

#Data loading & checking
Cases_of_cholera <- read.csv('CHOLERA_0000000001.csv')
glimpse(Cases_of_cholera)
Cases_unique_values <- lapply(Cases_of_cholera, unique)

Deaths_from_cholera <- read.csv('CHOLERA_0000000002.csv')
glimpse(Deaths_from_cholera)
Deaths_unique_values <- lapply(Deaths_from_cholera, unique)

Fatality_rate <- read.csv('CHOLERA_0000000003.csv')
glimpse(Fatality_rate)
Fatality_rate_unique_values <- lapply(Fatality_rate, unique)

#Checking missing values
sum(is.na(Cases_of_cholera))
sum(is.na(Deaths_from_cholera))
sum(is.na(Fatality_rate))

#Editing data types
Deaths_from_cholera$Number.of.reported.deaths.from.cholera <- as.integer(Deaths_from_cholera$Number.of.reported.deaths.from.cholera)
glimpse(Deaths_from_cholera)

Fatality_rate$Cholera.case.fatality.rate <- as.double(Fatality_rate$Cholera.case.fatality.rate)
glimpse(Fatality_rate)

#Visualization
#Report and visualize cholera outbreaks since 1949
#Interactive bar plot for Countries with highst cases
highest_cases <- Cases_of_cholera %>%
  group_by(Countries..territories.and.areas) %>%
  summarise(total_cases = sum(Number.of.reported.cases.of.cholera, na.rm = TRUE)) %>%
  arrange(desc(total_cases))

bar_plot <- plot_ly(highest_cases, 
                    x = ~Countries..territories.and.areas, 
                    y = ~total_cases, 
                    type = 'bar',
                    marker = list(color = 'darkred')) %>%
  layout(title = "Total Cholera Cases by Country",
         xaxis = list(title = "Country"),
         yaxis = list(title = "Total Cases"))

bar_plot  

# 1. Top 5 Countries with the Highest Total Number of Reported Cases
highest_cases_top5 <- Cases_of_cholera %>%
  group_by(Countries..territories.and.areas) %>%
  summarise(total_cases = sum(Number.of.reported.cases.of.cholera, na.rm = TRUE)) %>%
  arrange(desc(total_cases)) %>%
  top_n(5, total_cases)  

bar_plot_top5 <- plot_ly(highest_cases_top5, 
                         x = ~Countries..territories.and.areas, 
                         y = ~total_cases, 
                         type = 'bar',
                         marker = list(color = 'darkred')) %>%
  layout(title = "Top 5 Countries with the Highest Cholera Cases",
         xaxis = list(title = "Country"),
         yaxis = list(title = "Total Cases"))

bar_plot_top5  

# Find the country and year with the highest number of cholera Cases
highest_Cases_record <- Cases_of_cholera %>%
  filter(Number.of.reported.cases.of.cholera == max(Number.of.reported.cases.of.cholera, na.rm = TRUE))
# Print the result (country and year)
print(highest_Cases_record %>% select(Countries..territories.and.areas, Year, Number.of.reported.cases.of.cholera))

# List of all countries from the map data
all_countries <- data.frame(Countries = unique(map_data("world")$region))

highest_cases_top5_full <- all_countries %>%
  left_join(highest_cases_top5, by = c("Countries" = "Countries..territories.and.areas")) %>%
  replace_na(list(total_cases = 0)) 

# Interactive World Map 
map_plot <- plot_ly(highest_cases_top5_full, 
                    type = 'choropleth', 
                    locations = ~Countries, 
                    locationmode = 'country names', 
                    z = ~total_cases, 
                    colorscale = list(c(0, 'rgb(240,240,240)'),  
                                      c(1, 'rgb(255,0,0)')),     
                    marker = list(line = list(color = 'rgb(0,0,0)', width = 0.5))) %>%  
  layout(title = "Top 5 Countries with the Highest Cholera Cases",
         geo = list(showframe = FALSE,
                    showcoastlines = TRUE,  
                    projection = list(type = 'natural earth')))

map_plot  

# 2. First Country to Have the Highest Cases in the Oldest Year
first_highest_case <- Cases_of_cholera %>%
  arrange(Year) %>%
  filter(Year == min(Year)) %>%
  arrange(desc(Number.of.reported.cases.of.cholera)) %>%
  top_n(1, Number.of.reported.cases.of.cholera)

print(first_highest_case)

line_plot <- Cases_of_cholera %>%
  group_by(Year) %>%
  summarise(total_cases = sum(Number.of.reported.cases.of.cholera, na.rm = TRUE)) %>%
  plot_ly(x = ~Year, 
          y = ~total_cases, 
          type = 'scatter', 
          mode = 'lines+markers', 
          line = list(color = 'darkred')) %>%
  layout(title = "Cholera Cases Over Time",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Total Cases"))

line_plot 

#Deaths_from_cholera visualization 

# Visualization
# Report and visualize cholera deaths since 1949

# Interactive bar plot for Countries with highest deaths
highest_deaths <- Deaths_from_cholera %>%
  group_by(Countries..territories.and.areas) %>%
  summarise(total_deaths = sum(Number.of.reported.deaths.from.cholera, na.rm = TRUE)) %>%
  arrange(desc(total_deaths))

bar_plot <- plot_ly(highest_deaths, 
                    x = ~Countries..territories.and.areas, 
                    y = ~total_deaths, 
                    type = 'bar',
                    marker = list(color = 'darkgray')) %>%
  layout(title = "Total Cholera Deaths by Country",
         xaxis = list(title = "Country"),
         yaxis = list(title = "Total Deaths"))

bar_plot  

# 1. Top 5 Countries with the Highest Total Number of Reported Deaths
highest_deaths_top5 <- Deaths_from_cholera %>%
  group_by(Countries..territories.and.areas) %>%
  summarise(total_deaths = sum(Number.of.reported.deaths.from.cholera, na.rm = TRUE)) %>%
  arrange(desc(total_deaths)) %>%
  top_n(5, total_deaths)  

bar_plot_top5 <- plot_ly(highest_deaths_top5, 
                         x = ~Countries..territories.and.areas, 
                         y = ~total_deaths, 
                         type = 'bar',
                         marker = list(color = 'darkgray')) %>%
  layout(title = "Top 5 Countries with the Highest Cholera Deaths",
         xaxis = list(title = "Country"),
         yaxis = list(title = "Total Deaths"))

bar_plot_top5  

# Find the country and year with the highest number of cholera deaths
highest_death_record <- Deaths_from_cholera %>%
  filter(Number.of.reported.deaths.from.cholera == max(Number.of.reported.deaths.from.cholera, na.rm = TRUE))
# Print the result (country and year)
print(highest_death_record %>% select(Countries..territories.and.areas, Year, Number.of.reported.deaths.from.cholera))

# List of all countries from the map data
all_countries <- data.frame(Countries = unique(map_data("world")$region))

highest_deaths_top5_full <- all_countries %>%
  left_join(highest_deaths_top5, by = c("Countries" = "Countries..territories.and.areas")) %>%
  replace_na(list(total_deaths = 0)) 

# Interactive World Map 
map_plot <- plot_ly(highest_deaths_top5_full, 
                    type = 'choropleth', 
                    locations = ~Countries, 
                    locationmode = 'country names', 
                    z = ~total_deaths, 
                    colorscale = list(c(0, 'rgb(220,220,220)'),  # Lighter gray for lower values
                                      c(0.25, 'rgb(180,180,180)'),  
                                      c(0.5, 'rgb(140,140,140)'),  
                                      c(0.75, 'rgb(100,100,100)'),  
                                      c(1, 'rgb(50,50,50)')),     # Darkest gray for highest values
                    marker = list(line = list(color = 'rgb(0,0,0)', width = 0.5))) %>%  
  layout(title = "Top 5 Countries with the Highest Cholera Deaths",
         geo = list(showframe = FALSE,
                    showcoastlines = TRUE,  
                    projection = list(type = 'natural earth')))

map_plot  

# 2. First Country to Have the Highest Deaths in the Oldest Year
first_highest_death <- Deaths_from_cholera %>%
  arrange(Year) %>%
  filter(Year == min(Year)) %>%
  arrange(desc(Number.of.reported.deaths.from.cholera)) %>%
  top_n(1, Number.of.reported.deaths.from.cholera)

print(first_highest_death)

# Line plot showing cholera deaths over time
line_plot <- Deaths_from_cholera %>%
  group_by(Year) %>%
  summarise(total_deaths = sum(Number.of.reported.deaths.from.cholera, na.rm = TRUE)) %>%
  plot_ly(x = ~Year, 
          y = ~total_deaths, 
          type = 'scatter', 
          mode = 'lines+markers', 
          line = list(color = 'darkgray')) %>%
  layout(title = "Cholera Deaths Over Time",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Total Deaths"))

line_plot  

