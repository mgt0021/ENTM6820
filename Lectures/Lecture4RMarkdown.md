## Markdown YAML Header

The header lets you change file type that the code is rendered as and
add a table of contents

    title: "Lecture4RMarkdown"
    author: "MT"
    date: "2025-02-27"
    output:             # It will render as first output listed 
       md_document:      # allows display in GitHub
       variant: gfm      # creates github flavored markdown
     html_document:       
        toc: true        # table of contents
        toc_float: true
    word_document:          
    pdf_document:

This is an example of an R Code chunk.

    # this is R code, echo = TRUE, eval = FALSE
    summary(mtcars)

r chunks look like this

    {r Name of Chunk, parameters = TRUE}

some parameters are: include, echo, and eval. These control if chunk is
run and what parts are displayed.

Can include figures

    library(ggplot2)
    data("mtcars")
    ggplot(mtcars, aes(x = wt, y = mpg)) +
      geom_point()

![](Lecture4RMarkdown_files/figure-markdown_strict/unnamed-chunk-1-1.png)

## R Markdown formatting options

# First level header

*this text is italics* by putting single asterisks around text

**this text is bold ** by putting double asterisks around text

#### List (this needs to be a heading for it to work)

-   one item
-   another item
    -   one subitem with indent

Ordered list (or have line between it and the first list item)

1.  item
2.  item 2

### Links (second level header)

[Link to my github](https://github.com/mgt0021/ENTM6820.git)

## Images

<figure>
<img src="fieldworkimage.JPG" alt="Image name" />
<figcaption aria-hidden="true">Image name</figcaption>
</figure>

## Formatted tables

    library(knitr)
    kable(head(mtcars, n = 5), digits=3, format = "markdown")

<table style="width:100%;">
<colgroup>
<col style="width: 26%" />
<col style="width: 7%" />
<col style="width: 5%" />
<col style="width: 7%" />
<col style="width: 5%" />
<col style="width: 7%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 7%" />
<col style="width: 7%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">mpg</th>
<th style="text-align: right;">cyl</th>
<th style="text-align: right;">disp</th>
<th style="text-align: right;">hp</th>
<th style="text-align: right;">drat</th>
<th style="text-align: right;">wt</th>
<th style="text-align: right;">qsec</th>
<th style="text-align: right;">vs</th>
<th style="text-align: right;">am</th>
<th style="text-align: right;">gear</th>
<th style="text-align: right;">carb</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Mazda RX4</td>
<td style="text-align: right;">21.0</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">160</td>
<td style="text-align: right;">110</td>
<td style="text-align: right;">3.90</td>
<td style="text-align: right;">2.620</td>
<td style="text-align: right;">16.46</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">4</td>
</tr>
<tr class="even">
<td style="text-align: left;">Mazda RX4 Wag</td>
<td style="text-align: right;">21.0</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">160</td>
<td style="text-align: right;">110</td>
<td style="text-align: right;">3.90</td>
<td style="text-align: right;">2.875</td>
<td style="text-align: right;">17.02</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Datsun 710</td>
<td style="text-align: right;">22.8</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">108</td>
<td style="text-align: right;">93</td>
<td style="text-align: right;">3.85</td>
<td style="text-align: right;">2.320</td>
<td style="text-align: right;">18.61</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">Hornet 4 Drive</td>
<td style="text-align: right;">21.4</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">258</td>
<td style="text-align: right;">110</td>
<td style="text-align: right;">3.08</td>
<td style="text-align: right;">3.215</td>
<td style="text-align: right;">19.44</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Hornet Sportabout</td>
<td style="text-align: right;">18.7</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">360</td>
<td style="text-align: right;">175</td>
<td style="text-align: right;">3.15</td>
<td style="text-align: right;">3.440</td>
<td style="text-align: right;">17.02</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">2</td>
</tr>
</tbody>
</table>

## File Trees

    library(fs)
    fs::dir_tree()

    ├── BacterialAlpha.csv
    ├── Bull_richness.csv
    ├── CodingChallenge1.R
    ├── CodingChallenge2DataVisualization.R
    ├── CodingChallenge3DataVisualizationAdvanced.R
    ├── diff_abund.csv
    ├── ENTM6820.Rproj              # Top level directory .Rproh file = working directory
    ├── fieldworkimage.JPG
    ├── Lecture1IntroR.R
    ├── Lecture2DataVisualization.R
    ├── Lecture3DataVisualizationAdvanced.R
    ├── Lecture4RMarkdown.html
    ├── Lecture4RMarkdown.md
    ├── Lecture4RMarkdown.Rmd
    ├── Lecture4RMarkdown_files
    │   └── figure-gfm
    │       ├── pressure-1.png
    │       └── unnamed-chunk-1-1.png
    ├── MycotoxinData.csv
    ├── README.html
    ├── README.md                   # Top level directory README
    └── TipsR.csv       

## Zenodo

1.  Create a zenodo account and link to github.
2.  Go to GitHub tab in settings of zenodo.
3.  Flip the switch for the repo you want to create a doi for
4.  Create a release for that repo in github

-   on the side window of the github repo page there should be a
    Releases section
-   click create new release
-   make a tag name (ex: v1.0.0)
-   release title (ex: creating zenodo link)
-   publish (creates zipped source code = stable working repository)

1.  Go back to zenodo and a badge should appear next to the turned on
    repo name (sync and reload if it doesn’t pop up, it could take a
    couple minutes)
2.  Copy badge markdown link and paste in README
