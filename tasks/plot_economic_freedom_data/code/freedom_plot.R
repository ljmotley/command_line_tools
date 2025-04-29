# plot

library(ggplot2)

data <- read.csv("../input/freedom_data.csv")

print(head(data))
ggplot(data, aes(x=Year, y=`Economic.Freedom.Summary.Index`, group=`World.Bank.Region`, color=`World.Bank.Region`)) +
  geom_smooth() +
  labs(title="Human Freedom Score by Region",
       x="Year",
       y="Human Freedom Score",
    color="Region") +
  theme_minimal() +
  scale_color_brewer(palette="Set1")
ggsave("../output/freedom_plot.png", bg="white", width=8, height=6, dpi=300)
