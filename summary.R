

#month with the most checkouts for the book "Verity" by Colleen Hoover
verity_checkouts <- spl_df %>% filter(Title == "Verity" & Creator == "Colleen Hoover")

monthly_checkouts <- verity_checkouts %>% 
  group_by(CheckoutMonth) %>% 
  summarize(total_checkouts = sum(Checkouts))

max_month <- monthly_checkouts %>% filter(total_checkouts == max(total_checkouts))

max_month
#month with the least checkouts for the book "Verity" by Colleen Hoover
monthly_checkouts <- verity_checkouts %>% 
  group_by(CheckoutMonth) %>% 
  summarize(total_checkouts = sum(Checkouts))

min_month <- monthly_checkouts %>% filter(total_checkouts == min(total_checkouts))

min_month
#Average number of checkouts for each material type for Colleen Hoover
library(dplyr)

author_df <- spl_df %>%
  filter(Creator == "Colleen Hoover")

avg_checkouts <- author_df %>%
  group_by(MaterialType) %>%
  summarize(avg_checkouts = mean(Checkouts, na.rm = TRUE))

avg_checkouts
#What is the month with the most checkouts for ebooks for Colleen Hoover
hoover_ebook_df <- author_df %>% filter(MaterialType == "EBOOK")

hoover_ebook_month_df <- hoover_ebook_df %>% group_by(date) %>% 
  summarise(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  arrange(desc(total_checkouts)) %>% 
  filter(date == max(date))
#What is the month with the least checkouts for Ebooks for Colleen Hoover
hoover_ebook_df <- author_df %>% filter(MaterialType == "BOOK")

hoover_ebook_month <- hoover_ebook_df %>% group_by(date) %>% 
  summarise(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  arrange(desc(total_checkouts)) %>% 
  filter(date == min(date))

