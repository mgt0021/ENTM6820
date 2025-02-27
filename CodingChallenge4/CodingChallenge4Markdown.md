### Question 1

1.  A YAML header is the section of the top of .rmd code that sets the
    title, output options, and other global settings. You can set the
    output as a html, word, pdf, or github flavored markdown document.
    You can also set a table of contents in the YAML header.
2.  Literate programming is writing code in a way that is human-readable
    and easy to understand. It is a key part of a reproducible workflow.

### Question 2

Data are published here:

[Noel, Z.A., Roze, L.V., Breunig, M., Trail, F. 2022. Endophytic fungi
aspromising biocontrol agent to protect wheat from Fusarium graminearum
head blight. Plant
Disease.](https://apsjournals.apsnet.org/doi/10.1094/PDIS-06-21-1253-RE)

Load in the MycotinData.csv dataframe.

    # load in data, assigning na with <NA>
    mycotoxindf <- read.csv("MycotoxinData.csv", na.strings = "na")
    str(mycotoxindf) #check that it's right 

    ## 'data.frame':    375 obs. of  6 variables:
    ##  $ Treatment     : chr  "Fg" "Fg" "Fg" "Fg" ...
    ##  $ Cultivar      : chr  "Wheaton" "Wheaton" "Wheaton" "Wheaton" ...
    ##  $ BioRep        : int  2 2 2 2 2 2 2 2 2 3 ...
    ##  $ MassperSeed_mg: num  10.29 12.8 2.85 6.5 10.18 ...
    ##  $ DON           : num  107.3 32.6 416 211.9 124 ...
    ##  $ X15ADON       : num  3 0.85 3.5 3.1 4.8 3.3 6.9 2.9 2.1 0.71 ...

Load in packages and colorblind palette.

    library(ggplot2)
    library(ggpubr)
    #color blind palette vector 
    cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

Create DON~Treatment boxplot.

    # relevel the df so that NTC is the first group in the plot 
    mycotoxindf$Treatment <- factor(mycotoxindf$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))

    #create a boxplot of DON~Treatment 
    DON.bp <- ggplot(mycotoxindf, aes(x= Treatment, y = DON, fill = Cultivar)) +
      geom_boxplot(outliers = F) + 
      geom_point(shape = 21, alpha = 0.6, position = position_jitter(0.25)) +
      xlab(" ") +
      ylab("DON (ppm)") +
      scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
      theme_classic() +
      facet_wrap(~Cultivar)

Create Mass~Treatment boxplot.

    mass.bp <- ggplot(mycotoxindf, aes(x= Treatment, y = MassperSeed_mg , fill = Cultivar)) +
      geom_boxplot(outliers = F) + 
      geom_point(shape = 21, alpha = 0.6, position = position_jitter(0.25)) +
      xlab(" ") +
      ylab("Seed Mass (mg)") +
      scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
      theme_classic() +
      facet_wrap(~Cultivar)

Create X15adon~Treatment boxplot.

    X15ADON.bp <- ggplot(mycotoxindf, aes(x= Treatment, y = X15ADON , fill = Cultivar)) +
      geom_boxplot(outliers = FALSE) + 
      geom_point(shape = 21, alpha = 0.6, position = position_jitter(0.25)) +
      xlab(" ") +
      ylab("15ADON") +
      scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4])) +
      theme_classic() +
      facet_wrap(~Cultivar)

Use ggarange to combine all figures and add p-values to figures

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

![](CodingChallenge4Markdown_files/figure-markdown_strict/combined%20figure-1.png)
