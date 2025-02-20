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

sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = "na")