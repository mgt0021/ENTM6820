# Advanced Data Visualization Part 2

library(tidyverse)
library(ggpubr) #integrate stats
library(ggrepel) #label points

# accessibility in figure design 
  # consistent style
  # simple figures (not overly complicated)
  # translate each figure into one sentence 
  # papers should be able to print in black and white
  # color blind accessible

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")



# load in data ####
sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = "na")
sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
sample.data.bac$Crop <- factor(sample.data.bac$Crop, level = c("Soil", "Cotton", "Soybean")) #relevel



# Bacterial Evenness; Figure 2B - boxplots #### 

bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, color = Crop)) +
      geom_boxplot(position = position_dodge(0.85)) +   #boxplots with dodged position to prevent overlap
      geom_point(position = position_jitterdodge(0.05)) + #jittered points
      xlab("Hours post sowing") + 
      ylab("Pielou's evenness") +
      scale_color_manual(values = cbbPalette) + 
      theme_classic() #use a classic theme to get rid of grid lines etc

bac.even

# Water Imbibition per crop; Figure 2A ####
# subset data
sample.data.bac.nosoil <- subset(sample.data.bac, Crop != "Soil")

water.imbibed <- ggplot(sample.data.bac.nosoil, aes(x = Time_Point, y = Water_Imbibed*1000, color = Crop)) + # water imbibed in mg instead of g now
  geom_jitter(width = 0.5, alpha = 0.5) +  #add transparent jittered points
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) + #add lines representing mean value for each 
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  xlab("Hours post sowing") + 
  ylab("Water Imbibed (mg)") +
  scale_color_manual(values = c(cbbPalette[2], cbbPalette[3])) +  #manually set colors from cbbpalette
  theme_classic() + #use a classic theme to get rid of grid lines etc
  theme(strip.background = element_blank(), legend.position ="none") + #strip background gets rid of box around facet labels, legend.position gets rid of legend
  facet_wrap(~Crop, scales = "free")

water.imbibed

# Figure 2C ####

water.imbibed.cor <- ggplot(sample.data.bac.nosoil, aes(x = Water_Imbibed*1000, y = even, color = Crop)) + 
  geom_smooth(method = lm, se = FALSE) + #add linear model line
  geom_point(aes(shape = Time_Point)) + # add points with different shapes based on time point
  xlab("Water Imbibed (mg)") +
  ylab("Pielou's evenness") +
  facet_wrap(~Crop, scales = "free") + 
  scale_color_manual(values = c(cbbPalette[2], cbbPalette[3]), name = "", labels = c("", "")) +                 # set colors 
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  # set shapes 
  theme_classic() +
  guides(color = "none") + #gets rid of color legend
  theme(strip.background = element_blank(), legend.position = "right")
 

water.imbibed.cor


# Combine previous 3 ggplots into one figure ###

figure2 <- ggarrange(
  water.imbibed, #1st panel
  bac.even, #2nd panel
  water.imbibed.cor,  #3rd panel
  labels = c("A)", "B)", "C)"), #or label them a, b, c automatically with labels = "auto"
  nrow = 3, #arrange plot into 3 rows
  ncol = 1, #arrange into 1 column
  legend = FALSE # dr. noel adds his manually outside of R 
)
figure2


# Add stats to graph ####
# use this method only for exploratory stats not for final products! 

#quick way to look at stats of anova
bac.even + 
  stat_compare_means(method = "anova") # do an anova 

bac.even +
  geom_pwc(aes(group = Crop), method = "t.test", label = "p.adj.format") # or get p-vals for individual groups 

bac.even +
  geom_pwc(aes(group = Crop), method = "t.test", label = "p.adj.signif") #just shows * instead of p-vals

bac.even +
  geom_pwc(aes(group = Crop), method = "t.test", label = "{p.adj.format}{p.adj.signif}") #both

#display correlation data 
water.imbibed.cor + 
  stat_cor() +        #pearson correlation, gives R and p
  stat_regline_equation

water.imbibed.cor + 
stat_regline_equation() #gives equation for the line (y int and slope)



# Specific point labelling ####

diff.abund <- read.csv("diff_abund.csv")
str(diff.abund)

#create a new column
diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean)
#subset data to only large log10 p-values (most sig)
diff.abund.label <- diff.abund[diff.abund$log10_pvalue >30,]


#plotting points separately from labels <- labelling everything would be too much 
ggplot() +  #don't set anything in here because we want to include 2 different dfs
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) +
  geom_point(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean), shape = 17, size = 4, color = "red") + #emphasize the labeled points 
  theme_classic() + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) + #geom_text works also but repel keeps them from overlapping
  scale_color_manual(values = cbbPalette, name = "Significant") +
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")


# adding sig letters to rep multiple pairwise comparisons (ANOVA) ####
library(lme4)
#install.packages("emmeans")
library(emmeans)
library(multcomp)
library(multcompView)

