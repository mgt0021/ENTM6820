# Coding Challenge 2: Data Visualization

### Q2 ####
# load in packages
#install.packages("ggplot2")
library(ggplot2)

# load in data
mycotoxindf <- read.csv("MycotoxinData.csv", na.strings = "na")
str(mycotoxindf)

# make a boxplot
ggplot(mycotoxindf, aes(x= Treatment, y = DON, color = Cultivar)) +
  geom_boxplot() + 
  xlab(" ") +
  ylab("DON (ppm)")



### Q3 ####
# make a barcharts
ggplot(mycotoxindf, aes(x= Treatment, y = DON, color = Cultivar, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar",  position = "dodge") +  #position dodge makes sure that the two colors of boxplots are not on top of each other
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab(" ") +
  ylab("DON (ppm)")



### Q4 ####
# add points with specific shape and color that are spread out over the boxplots and barcharts
ggplot(mycotoxindf, aes(x= Treatment, y = DON, color = Cultivar, fill = Cultivar)) + #need color (error) and fill (bars) here
  stat_summary(fun = mean, geom = "bar", position = "dodge") + 
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(shape = 21, color = "black", position = position_jitterdodge(dodge.width = 0.9)) +
  xlab(" ") +
  ylab("DON (ppm)")

ggplot(mycotoxindf, aes(x= Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() + 
  geom_point(shape = 21, color = "black", position = position_jitterdodge(dodge.width = 0.9)) +
  xlab(" ") +
  ylab("DON (ppm)")



### Q5 ####
# change colors of boxplot to colorblind palette
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(mycotoxindf, aes(x= Treatment, y = DON, fill = Cultivar)) + 
  geom_boxplot() + 
  geom_point(shape = 21, color = "black", position = position_jitterdodge()) +
  xlab(" ") +
  ylab("DON (ppm)") +
  scale_fill_manual(values = c("#56B4E9", "#D55E00"))

# another way to do it: 
#  scale_fill_manual(values = c(cbbPalette[[2]], cbbPalette[[5]]))
# OR scale_fill_manual(values = cbbPalette)



### Q6 ####
# facet by cultivar
ggplot(mycotoxindf, aes(x= Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() + 
  geom_point(shape = 21, color = "black", position = position_jitterdodge()) +
  xlab(" ") +
  ylab("DON (ppm)") +
  scale_fill_manual(values = c("#56B4E9", "#D55E00")) +
  facet_wrap(~Cultivar)



### Q7 ####
# make points transparent
ggplot(mycotoxindf, aes(x= Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() + 
  geom_point(shape = 21, color = "black", alpha = 0.5, position = position_jitterdodge()) + #alpha sets transparency
  xlab(" ") +
  ylab("DON (ppm)") +
  scale_fill_manual(values = c("#56B4E9", "#D55E00")) +
  facet_wrap(~Cultivar)



### Q8 ####
# make violin plots to display the distribution of the data
ggplot(mycotoxindf, aes(x= Treatment, y = DON, color = Cultivar)) +
  geom_violin(scale = "count") +
  xlab(" ") +
  ylab("DON (ppm)") +
# facet_wrap(~Cultivar*Treatment, scales = "free", ncol = 5)  # I like the look of grid better because everything is on the same axis
  facet_grid(~Cultivar*Treatment, scales = "free") +          # doesn't look right unless I facet by both
  stat_summary(fun.y="median", geom="point", size=2, shape = 15) + #adds the median to the plot 
# geom_boxplot(width = 0.2, alpha = 0.5) +                        #could do this to overlay boxplots over the violins
  scale_color_manual(values = c("#56B4E9", "#D55E00")) +     
  theme(strip.background = element_blank(),
        strip.text = element_blank()) 


