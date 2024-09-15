install.packages(c( "ggplot2", "plotly","Stringr" ))
library(ggplot2)
library(plotly)
library(stringr)
library(tidyverse)
library(readr)
library(dplyr)

amr_data <- read_tsv("WHO_AMR_PRODUCTS_DATA.tsv.txt")
glimpse(amr_data)
head(amr_data)
summary(amr_data)
sum(is.na(amr_data))
total_missing <- sum(is.na(amr_data))
total_values <- prod(dim(amr_data))
percentage_missing <- (total_missing / total_values) * 100

# Check the structure and summary of missing values
sapply(amr_data, function(x) sum(is.na(x)))

# Identify & remove columns with more than 57% missing values
missing_percentage <- colMeans(is.na(amr_data)) * 100
print(missing_percentage)
high_missing_columns <- names(missing_percentage[missing_percentage > 57])
amr_data_clean <- amr_data[, !names(amr_data) %in% high_missing_columns]

# Handling duplication & missing values
amr_data_clean <- na.omit(amr_data_clean)
amr_data_clean <- amr_data_clean[!duplicated(amr_data_clean), ]

# Check the cleaned dataset
summary(amr_data_clean)
sum(is.na(amr_data_clean))
total_missing <- sum(is.na(amr_data_clean))
total_values <- prod(dim(amr_data_clean))
percentage_missing <- (total_missing / total_values) * 100

#Key trends

#of products in each R&D phase ( interactive )
p <- ggplot(amr_data_clean, aes(x = `R&D phase`)) +
  geom_bar(fill = "darkgreen") +
  labs(title = "Number of Products in Each R&D Phase")
ggplotly(p)

##* separate the product types into individual plots for each antibacterial class.
# Count of products by product type
product_type_counts <- amr_data_clean %>%
  group_by(`Product type`) %>%
  summarise(count = n(), .groups = 'drop')
# Plot the distribution of product types
ggplot(product_type_counts, aes(x = reorder(`Product type`, count), y = count)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  coord_flip() +
  labs(title = "Distribution of Product Types",
       x = "Product Type",
       y = "Number of Products") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(amr_data_clean, aes(x = `Antibacterial class`)) +
  geom_bar(fill = "darkgreen") +
  labs(title = "Antibacterial Class Distribution by Product Type",
       x = "Antibacterial Class",
       y = "Count of Products") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  facet_wrap(~ `Product type`)
#Creates an interactive pie chart showing antibacterial class distribution with hover details 
antibacterial_class_counts <- amr_data_clean %>%
  group_by(`Antibacterial class`) %>%
  summarise(count = n())
plot_ly(antibacterial_class_counts, labels = ~`Antibacterial class`, values = ~count, type = 'pie', 
        textinfo = 'label+percent', hoverinfo = 'label+percent+value') %>%
  layout(title = 'Antibacterial Class Distribution')
# Replace 'N/A' with 'Unknown' in 'Active against priority pathogens?'
amr_data_clean <- mutate(amr_data_clean, across('Active against priority pathogens?', ~ str_replace(., 'N/A', 'Unknown')))
# Grouping by 'Route of administration', 'Product name', and 'R&D phase'
roa <- group_by(amr_data_clean, `Route of administration`, `Product name`, `R&D phase`)
# Count of products by route of administration and R&D phase
route_effectiveness <- amr_data_clean %>%
  group_by(`Route of administration`, `R&D phase`) %>%
  summarise(count = n(), .groups = 'drop')
# Plot the distribution by route of administration and R&D phase
ggplot(route_effectiveness, aes(x = `Route of administration`, y = count, fill = `R&D phase`)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Distribution of Products by Route of Administration and R&D Phase",
       x = "Route of Administration",
       y = "Number of Products") +
  theme_minimal()

# Count of effective products by R&D phase
efficacy_counts <- amr_data_clean %>%
  group_by(`R&D phase`, `Active against priority pathogens?`) %>%
  summarise(count = n(), .groups = 'drop')
# Plot the efficacy across R&D phases
ggplot(efficacy_counts, aes(x = `R&D phase`, y = count, fill = `Active against priority pathogens?`)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Efficacy of Products Against Priority Pathogens Across R&D Phases",
       x = "R&D Phase",
       y = "Count") +
  theme_minimal()

# Subset data for Phase I
roa_phase1 <- roa[roa$`R&D phase` == "Phase I", ]

# Distribution of AMR products in Phase I using different colors for different routes of administration
ggplot(roa_phase1, aes(x = `Product name`, fill = `Route of administration`)) +
  geom_bar() +
  coord_flip() +
  labs(title = "Distribution of AMR Products in Phase I",
       x = "Product name",
       y = "Number of cases") +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))

#2-2 product name and route of admission (interactive)
ggplotly(ggplot(amr_data_clean, aes(x = `Product name`, fill = `Route of administration`)) +
           geom_bar() + coord_flip() +
           labs(title = "Relation between Product Name and Route of Administration") +
           theme_minimal())

#3 Subset data for Phase I and IV route of administration
roa_phase1_1 <- roa_phase1[roa_phase1$`Route of administration` == "IV", ]
# Heatmap of product name against pathogen name and activity for Phase I IV-administered products
ggplot(roa_phase1_1, aes(x = `Product name`, y = `Pathogen name`)) +
  geom_tile(aes(fill = `Active against priority pathogens?`)) +
  scale_fill_brewer(palette = "Blues") +
  labs(title = "Effect of Phase I IV-administered products on pathogens",
       x = "Product name",
       y = "Pathogen name") +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, hjust = 1))

# Subset data for Phase III
roa_phase3 <- roa[roa$`R&D phase` == "Phase III", ]
# Distribution of AMR products in Phase III using different colors for different routes of administration
ggplot(roa_phase3, aes(x = `Product name`, fill = `Route of administration`)) +
  geom_bar() +
  coord_flip() +
  labs(title = "Distribution of AMR Products in Phase III",
       x = "Product name",
       y = "Count") +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))

# Subset data for Phase III and IV route of administration
roa_phase3_1 <- roa_phase3[roa_phase3$`Route of administration` == "IV", ]
# Heatmap of product name against pathogen name and activity for Phase III IV-administered products
ggplot(roa_phase3_1, aes(x = `Product name`, y = `Pathogen name`)) +
  geom_tile(aes(fill = `Active against priority pathogens?`)) +
  scale_fill_brewer(palette = "Blues") +
  labs(title = "Effect of Phase III IV-administered products on pathogens",
       x = "Product name",
       y = "Count") +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, hjust = 1))

#6 Count of products active against priority pathogens across different R&D phases

# Visualizations of activity against priority pathogens across phases

# Trial 1: Jitter plot
ggplot(roa, aes(x = `R&D phase`, y = `Active against priority pathogens?`)) +
  geom_jitter() +
  labs(title = "Activity against priority pathogens across different phases",
       x = "Phase",
       y = "Activity") +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))


# Trial 2: Bubble plot
ggplot(efficacy_counts, aes(x = `R&D phase`, y = `Active against priority pathogens?`, size = count, color = count)) +
  geom_point() +
  labs(title = "Activity against priority pathogens across different phases",
       x = "Phase",
       y = "Activity") +
  scale_size_continuous(range = c(3, 18)) +  # Adjust point sizes
  scale_color_gradient(low = "blue", high = "red") +  # Color by count
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))

# Show which pathogens are targeted by which products, using a heatmap
ggplot(amr_data_clean, aes(x = `Product name`, y = `Pathogen name`)) + 
  geom_tile(aes(fill = `Pathogen activity`)) +
  scale_fill_manual(values = c("lightblue", "darkblue", "green", "yellow")) +  # Customize colors for each category
  labs(title = "Heatmap of Pathogens vs AMR Products",
       x = "Product",
       y = "Pathogen") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# Bar plot of Product name grouped by Product type
ggplot(amr_data_clean, aes(x = `Product type`, fill = `Product name`)) + 
  geom_bar() +
  labs(title = "Distribution of AMR Products by Product Type",
       x = "Product Type",
       y = "Number of Products") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal()

#the count of each product, grouped by whether they are classified as NCE or not.
ggplot(amr_data_clean, aes(x = `Product name`, fill = `NCE?`)) +
  geom_bar(position = "dodge") +
  labs(title = "Relation between Product Name and NCE Status",
       x = "Product Name",
       y = "Count of Products",
       fill = "NCE") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#the different levels of pathogen activity within each pathogen name (interactive)
p <- ggplot(amr_data_clean, aes(x = `Pathogen name`, fill = `Pathogen activity`)) +
  geom_bar(position = "stack") +
  labs(title = "Stacked Bar Chart of Pathogen Activity by Pathogen Name",
       x = "Pathogen Name",
       y = "Count of Pathogens",
       fill = "Pathogen Activity") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggplotly(p)

# an interactive heatmap of product vs pathogen (interactive)
ggplotly(ggplot(amr_data_clean, aes(x = `Product name`, y = `Pathogen name`, fill = `Active against priority pathogens?`)) + 
           geom_tile() + scale_fill_brewer(palette = "Blues"))