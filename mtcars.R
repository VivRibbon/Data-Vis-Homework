data(mtcars)
library(tidyverse)

str(mtcars)
head(mtcars)

filtered_data <- mtcars %>% filter(mpg > 25, am == 1)
mtcars <- mtcars %>% mutate(hp_per_cyl = hp / cyl)
average_mpg <- mtcars %>%
  group_by(drat) %>%
  summarize(average_mpg = mean(mpg))

ggplot(
  data = mtcars,
  aes(x = hp, y = mpg, color = gear)
) +
  geom_point() +
  labs(title = "HP by MPG") +
  theme_minimal()

ggplot(data = mtcars, aes(am, qsec)) +
  geom_boxplot(aes(fill = am)) +
  theme_minimal()

top_hp_per_cyl <- mtcars %>%
  arrange(desc(hp_per_cyl)) %>%
  head(1)


ggplot(mtcars, aes(x = mpg, fill = as.factor(cyl))) +
  geom_histogram(position = "identity", binwidth = 2, alpha = 0.5) +
  labs(
    title = "Histogram of mpg by Number of Cylinders",
    x = "Miles Per Gallon (mpg)", y = "Count",
    fill = "Number of Cylinders"
  ) +
  theme_minimal()
