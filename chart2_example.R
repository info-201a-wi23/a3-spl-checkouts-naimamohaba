spl_df <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", 
                   stringsAsFactors = FALSE)

spl_df <- spl_df %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth,
                                          "-01"))

spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

author_df <- spl_df %>% filter(str_detect(Creator, "Colleen Hoover"))

book_checkouts <- author_df %>% group_by(Title) %>% 
  summarise(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>% 
  arrange(desc(total_checkouts)) %>%
  top_n(5)

hoover_top5_df <- author_df %>%
  filter(Title %in% book_checkouts$Title)

checkout_plot <- ggplot(hoover_top5_df) +
  geom_line(aes(x = date, y = Checkouts, color = Title)) +
  labs(title = "Colleen Hoover Top 5 most checked out books",
       x = "Month", y = "Total Checkouts") +
  scale_y_continuous(breaks = seq(0, 700, 50))

ggplotly(checkout_plot)
