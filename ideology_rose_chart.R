library(tidyverse)

numbers <- runif(54)

numbers <- as.data.frame(numbers)

numbers$ideology <- rep(c("left liberal", "left moderate", "left authoritarian",
  "centre liberal", "centre moderate", "centre authoritarian",
  "right liberal", "right moderate", "right authoritarian"),
  times = 6)

numbers$issue <- c(rep("economy", 9),
                   rep("brexit", 9),
                   rep("nhs", 9),
                   rep("immigration", 9),
                   rep("crime", 9),
                   rep("environment", 9))


numbers %>% 
  mutate(ideology = 
           factor(ideology,
                  levels = c("left authoritarian", "centre authoritarian", "right authoritarian",
                             "left moderate", "centre moderate", "right moderate",
                             "left liberal", "centre liberal", "right liberal"))) %>% 
  ggplot() + 
  aes(x = issue,
      y = numbers,
      fill = issue) +
  geom_col() +
  facet_wrap(~ ideology) +
  coord_polar() +
  theme_minimal() +
  theme(axis.text = element_blank()) +
  theme(legend.position = "top") +
  labs(x = "",
       y = "",
       fill = "")
