# Coding challenge 3: Advanced Visualization

#load in packages
library(ggplot2)
library(ggpubr) #needed for ggarrange and to add stats 

# load in data, assigning na with <NA>
mycotoxindf <- read.csv("MycotoxinData.csv", na.strings = "na")
str(mycotoxindf) #check that it's right 

#color blind palette vector 
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")



# Question 1 ####
#create a boxplot of DON~Treatment 
Box1 <- ggplot(mycotoxindf, aes(x= Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  geom_point(shape = 21, alpha = 0.6, position = position_jitter(0.25)) +
  xlab(" ") +   # label x axis
  ylab("DON (ppm)") +  # label y axis 
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) + #fill boxplots with color blind palette colors 
  theme_classic() +
  facet_wrap(~Cultivar) #split into a panel for each cultivar
Box1

# Question 2 #### 
# relevel the df so that NTC is the first group in the plot 
mycotoxindf$Treatment <- factor(mycotoxindf$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))
str(mycotoxindf) #check that it worked 

#rerun the code with the updated df
DON.bp <- ggplot(mycotoxindf, aes(x= Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  geom_point(shape = 21, alpha = 0.6, position = position_jitter(0.25)) +
  xlab(" ") +
  ylab("DON (ppm)") +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar)
DON.bp

# Question 3 ####
# MassperSeed_mg is new y var 
mass.bp <- ggplot(mycotoxindf, aes(x= Treatment, y = MassperSeed_mg , fill = Cultivar)) +
  geom_boxplot(outliers = F) + 
  geom_point(shape = 21, alpha = 0.6, position = position_jitter(0.25)) +
  xlab(" ") +
  ylab("Seed Mass (mg)") +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar)
mass.bp 

# 15adon is new y var 
X15ADON.bp <- ggplot(mycotoxindf, aes(x= Treatment, y = X15ADON , fill = Cultivar)) +
  geom_boxplot(outliers = FALSE) + 
  geom_point(shape = 21, alpha = 0.6, position = position_jitter(0.25)) +
  xlab(" ") +
  ylab("15ADON") +
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
  theme_classic() +
  facet_wrap(~Cultivar)
X15ADON.bp

# Question 4 ####
# combine the prior three plots into 1 plot 
figure <- ggarrange(
  DON.bp, 
  mass.bp, 
  X15ADON.bp,
  nrow = 3, 
  ncol = 1, 
  labels = c("A)", "B)", "C)"), 
  common.legend = TRUE,   # creates 1 legend that is shared by all three plots 
  legend = "bottom"       #set the location of the legend 
)
figure

#Question 5 ####
# adds t-test pairwise p-values to each of the figures
X15ADON.bp.ttest <- X15ADON.bp +
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format") 

mass.bp.ttest <- mass.bp +
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format") 

DON.bp.ttest <- DON.bp +
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format") 

#combines those three plots with the ttest pvalues into a single plot with 3 panels
figure.ttest <- ggarrange(
  DON.bp.ttest, 
  mass.bp.ttest, 
  X15ADON.bp.ttest,
  nrow = 3, 
  ncol = 1, 
  labels = c("A)", "B)", "C)"), 
  common.legend = TRUE, 
  legend = "bottom"
)
figure.ttest

