author_df <- spl_df %>% filter(str_detect(Creator, "Colleen Hoover"))

total_ebook_checkouts <- spl_df %>% group_by(MaterialType) %>% 
  summarise(TotalCheckouts = sum(Checkouts, na.rm = TRUE)) %>% 
  arrange(desc(TotalCheckouts)) %>%
  slice(1:5)

book_plot <- ggplot(total_ebook_checkouts) +
  geom_col(aes(x = MaterialType, y = TotalCheckouts, fill = MaterialType)) +
  labs(title = "Top 5 Material Types with Most Checkouts for Colleen Hoover",
       x = "Material Type", y = "Total Checkouts") +
  scale_y_continuous(breaks = seq(0, 3000000, by = 500000))

ggplotly(book_plot)
