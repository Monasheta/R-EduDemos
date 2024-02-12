
# Install required packages

install.packages("ggplot2")
install.packages("ggrepel")

library(ggplot2)
library(ggrepel)

# Define the stages of the journey
stages <- c("Quiet Library", "Laboratory", "Cancer Research", "Research Philosophy", "Classroom")

# Define the descriptions for each stage
descriptions <- c(
  "Research journey begins \nin the quiet of the library",
  "Transition to \nthe laboratory setting",
  "Dedication to cancer research \nafter personal loss",
  "Evolution of research philosophy \ntowards helping others",
  "Sharing insights \nin the classroom"
)

# Create a dataframe for the journey
journey_data <- data.frame(
  Stage = stages,
  Description = descriptions,
  X = seq_along(stages),
  Y = seq_along(stages)
)

# Create a ggplot object for the journey pathway
ggplot(journey_data, aes(x = X, y = Y, label = Stage)) +
  geom_segment(aes(x = X, y = Y, xend = c(tail(X, -1), NA), yend = c(tail(Y, -1), NA)), 
               arrow = arrow(type = "closed", length = unit(0.1, "inches")), color = "gray", size = 1.5) +
  geom_text(color = "blue", size = 4) +
  geom_text(aes(label = paste(Description)), color = "black", size = 3, hjust = 0, vjust = 2) +  # Add stage and description
  geom_text(x = 2.5, y = 5.6, label = "Brushstrokes of My Journey (BOMJ)", color = "darkblue", size = 6, fontface = "bold") +
  geom_text(x = 2.5, y = 4.8, label = "From the library to the classroom,\nconnected by curiosity and a desire\nto make wonders accessible.", 
            color = "darkgray", size = 3, hjust = 0.5, vjust = 0) +
  theme_void() +
  xlim(0.5, 5.5) +
  ylim(0.5, 5.5) +
  theme(plot.title = element_text(hjust = 0.5))
