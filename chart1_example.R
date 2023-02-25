library("dplyr")
library("ggplot2")
library("plotly")
library("tidyverse")

# Filter the dataset to include only books by James Patterson and J.K. Rowling
spl_df <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", 
                   stringsAsFactors = FALSE)
spl_df <- spl_df %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth,
                                          "-01"))

spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

creator_df <- spl_df %>% filter(Creator %in% c("Colleen Hoover"))

# Group the data by checkout year and calculate the total number of checkouts for each year
yearly_checkouts <- creator_df %>% 
  group_by(date, Creator) %>% 
  summarize(total_checkouts = sum(Checkouts))

# Create a line chart with separate lines for each author
year_checkout_plot <- ggplot(yearly_checkouts) +
  geom_line(aes(x = date, y = total_checkouts)) +
  labs(title = "Checkout Trends Over Time for Colleen Hoover",
       x = "Checkout Year",
       y = "Total Checkouts") +
  scale_y_continuous(breaks = seq(0, 2000, 250))

ggplotly(year_checkout_plot)
