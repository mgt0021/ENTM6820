# Data Visualization 

# base R plotting ####
data("mtcars") #load in dataset that's preloaded in R
str(mtcars) #summarizes dataframe
plot(mtcars$wt, mtcars$mpg, 
     xlab = "Car Weight", 
     ylab = "Miles per Gallon", 
     font.lab = 6,
     pch = 3)
# ggplot is easier to use

# GGPLOT2 ####
library(ggplot2)

##Continuous variables ####
ggplot(mtcars, aes(x = wt, y = mpg)) + #first argument is df
  geom_smooth(method = lm, se = FALSE, color = "grey") +        #adds the line thru points, lm makes it a line, se takes away error bars
  geom_point(aes(size = cyl), color = "blue") +                      #layer with points
  xlab("Car Weight") +
  ylab("Miles per Gallon")

# change order of layers to display it differently (can move geom_point to after smooth to bring the points to the front)
# adding an argument (like size) to the first aes function applies the change to everything
# instead, add aes to just the layer you want to change (ex. adding aes(size to geom_point))


### add a color scale for the hp variable
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = lm, se = FALSE, color = "grey") +        
  geom_point(aes(size = cyl, color = hp)) +              #add color = var name in aes      
  xlab("log10 Car Weight") +
  ylab("Miles per Gallon") +
  scale_color_gradient(low = "green", high = "black") +   #changes colors of scale in hp color gradient 
  scale_x_log10() +                                     #puts x axis on log scale
  scale_y_continuous(labels = scales::percent)     #changes y into percentage (doesn't make sense here)
  

## Categorical variables #####
# load in data
bull.richness <- read.csv("Bull_richness.csv")
bull.richness.soy.no.till <- bull.richness[bull.richness$Crop == "Soy" & 
                                  bull.richness$Treatment == "No-till",] # subset to soy data

### Boxplots #####
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) +
  geom_boxplot() + #one of best ways to visualize a distribution
  xlab(" ") +      #gets rid of x axis label
  ylab("Fungal Richness") + 
  geom_point(position = position_jitterdodge()) #makes sure points aren't overlapping (jitter) and lines them up with each box (dodge)

  #problem with boxplots is that they don't show all your points (not showing outliers)
  #bar plots are common but don't give you a sense of the distribution of the data

### Barcharts ####

  # box plots plot distribution automatically
  # bar charts doesn't know that's what you're trying to do 
  # statsummary calulates means and se for you 

ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, fill = Fungicide, color = Fungicide)) +
  stat_summary(fun=mean, geom ="bar", position = "dodge") + #barchart, make sure to dodge so they aren't on top of each other 
  stat_summary(fun.data = mean_se, geom = "errorbar",  position = "dodge") + #make sure it's fun.data
  xlab(" ") +      #gets rid of x axis label
  ylab("Fungal Richness") + 
  geom_point(position = position_jitterdodge(dodge.width = 0.9))

  # color vs fill 
  # color: colors outline
  # fill: fills in the bar 
  # error bars and points are based on the color not the fill 


### Line Chart ####
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + #add group by fungicide to trace lines between growth stages
  stat_summary(fun=mean, geom = "line") + #lines
  stat_summary(fun.data = mean_se, geom = "errorbar") + #make sure it's fun.data
  xlab(" ") +      #gets rid of x axis label
  ylab("Fungal Richness") 


## Faceting ####
# what if you want to split your data
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean, geom = "line") + #lines
  stat_summary(fun.data = mean_se, geom = "errorbar") + #make sure it's fun.data
  xlab(" ") +      #gets rid of x axis label
  ylab("Fungal Richness") + 
  facet_wrap(~Treatment) #making multiple plots, give it var to split data by (Treatment)

#can do interaction by adding another var after * 
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean, geom = "line") + #lines
  stat_summary(fun.data = mean_se, geom = "errorbar") + #make sure it's fun.data
  xlab(" ") +      #gets rid of x axis label
  ylab("Fungal Richness") + 
  facet_wrap(~Treatment*Crop, scales = "free") #generates separate panels for each crop*treatment combination
  #free scales eliminates parts of the axes that are not needed for each facet (other options free_y, free_x)
  #can change order of facets by changing order that vars are input (~Crop*Treatment)