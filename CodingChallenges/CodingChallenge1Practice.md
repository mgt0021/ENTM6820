CodingChallege1Practice
================
MT
2025-03-05

- Where do you type code?
  - viewing window
- Where is the output of the code?
  - console
- Where do plots show up?
  - plots tab
- What is a global environment?
  - the area where all generated objects populate
- How do you get help for a function through R studio?
  - help tab or help() function
- What is an R package?
  - downloadable prewritten functions/code
- What is a function?
  - chunk of code that can perform actions on an input and spit out an
    output  
- How do you find the installed and loaded packages?
  - packages tab
- What is a working directory, and how do you find it?
  - getwd() - the folder in your computer that all the project files are
    stored within
- What is a relative file path and how is it different than an absolute
  file path?
  - a relative file path is a path that points back to the working
    directory but an absolute file path is saved on your individual
    computer and can’t be tranferred to other computers easily.

Explain the steps to start a new R project connected to a GitHub
repository.

- create a new repo in git Hub and create a readme. Go to r and start a
  project and make sure to start one with version control. Paste link
  from github repo into r when it prompts.

Please explain the different data classes and how they are similar and
different from each other.

- Vector - one dimensional, one data type of scalar objects
- Dataframe - 2D and multiple data types
- Matrix - 2D but all one data type

Create a vector named ‘z’ with the values 1 to 200

``` r
z <- (1:200)
```

Print the mean and standard deviation of z on the console

``` r
mean(z)
```

    ## [1] 100.5

``` r
sd(z)
```

    ## [1] 57.87918

Create a logical vector named zlog that is ‘TRUE’ for z values greater
than 30 and ‘FALSE’ otherwise.

``` r
zlog <- (z>30)
```

Make a dataframe with z and zlog as columns. Name the dataframe zdf

``` r
zdf <- data.frame(z, zlog)
```

Change the column names in your new dataframe to equal “zvec” and
“zlogic”

``` r
colnames(zdf) <- c("zvec", "zlogic")
```

Make a new column in your dataframe equal to zvec squared (i.e., z2).
Call the new column zsquared.

``` r
zdf$zsquared <- (zdf$zvec)^2
```

Subset the dataframe with and without the subset() function to only
include values of zsquared greater than 10 and less than 100

``` r
zdf[(zdf$zsquared > 10) & (zdf$zsquared < 100),]
```

    ##   zvec zlogic zsquared
    ## 4    4  FALSE       16
    ## 5    5  FALSE       25
    ## 6    6  FALSE       36
    ## 7    7  FALSE       49
    ## 8    8  FALSE       64
    ## 9    9  FALSE       81

``` r
subset(zdf, zsquared >10 & zsquared <100)
```

    ##   zvec zlogic zsquared
    ## 4    4  FALSE       16
    ## 5    5  FALSE       25
    ## 6    6  FALSE       36
    ## 7    7  FALSE       49
    ## 8    8  FALSE       64
    ## 9    9  FALSE       81

Subset the zdf dataframe to only include the values on row 26

``` r
zdf[26,]
```

    ##    zvec zlogic zsquared
    ## 26   26  FALSE      676

Subset the zdf dataframe to only include the values in the column
zsquared in the 180th row.

``` r
zdf$zsquared[180]
```

    ## [1] 32400

Download the Tips.csv file from Canvas. Use the read.csv() function to
read the data into R so that the missing values are properly coded.
\*\*Note the missing values are reported in the data as a period (i.e.,
“.”). How do you know the data were read correctly?

``` r
tips <- read.csv("TipsR.csv", na.strings = ".")
```

The periods were replaced with NA in the df.

    ##    Delivery School Total   Tip Gender PaymentMethod
    ## 1        A1      1 19.78  3.00      m             4
    ## 2        A2      1 18.50  2.50      m             2
    ## 3        A3      3  7.85  0.15      m             2
    ## 4        A4      1  7.99  1.21      f             1
    ## 5        A5      2 13.07  2.93      m             2
    ## 6        A6      2 13.07  1.93      f             2
    ## 7        A7      3 11.99  1.32      f             1
    ## 8        A8      3  8.42  1.08      f             1
    ## 9        A9      1 12.51  2.49      m             2
    ## 10      A10      1 22.89  2.48      m             1
    ## 11      A11      3 25.70  4.30      m             1
    ## 12      A12      3 11.48  1.50      m             1
    ## 13      A13      1 60.42  4.00      f             1
    ## 14      A14      1 14.84  0.00      f             1
    ## 15      A15      1 13.64  0.00      f             1
    ## 16      A16      1 16.84  2.00      f             1
    ## 17      A17      1  6.99  1.15      f             1
    ## 18      A18      3 11.19  3.00      m             1
    ## 19      A19      3  7.07  1.00      m             1
    ## 20       B1      3 22.49  5.00      m             3
    ## 21       B2      3  8.98  4.00      f             1
    ## 22       B3      3 11.99  3.00      m             3
    ## 23       B4      2 23.41  3.50      m             2
    ## 24       B5      2 30.50  5.00      f             1
    ## 25       B6      1 13.07  5.00      m             2
    ## 26       B7      2 23.42  6.58      m             2
    ## 27       B8      1 13.07  0.00      m             2
    ## 28       B9      1 14.70  0.00      M             1
    ## 29      B10      1 13.07  3.00      m             1
    ## 30      B11      1 23.49 20.00      m             1
    ## 31      B12      2 15.25  0.00      f             2
    ## 32       C1      1 14.75  3.25   <NA>             2
    ## 33       C2      3 14.75  0.00   <NA>             1
    ## 34       C3      3 22.27  3.67      f             1
    ## 35       C4      3 13.97  2.31   <NA>             1
    ## 36       C5      2 17.42  2.50   <NA>             2
    ## 37       C6      2 51.19  3.50   <NA>             2
    ## 38       C7      2  9.78  3.00   <NA>             1
    ## 39       C8      2  7.07  0.00   <NA>             1
    ## 40       C9      2 14.49  2.00   <NA>             1
    ## 41      C10      3 11.42  3.48   <NA>             2
    ## 42       D1      2 18.52  9.48      m             2
    ## 43       D2      1 16.39  4.00   <NA>             1
    ## 44       D3      1 35.97  7.12   <NA>             1
    ## 45       D4      1 12.51  2.49   <NA>             1
    ## 46       D5      3 26.48  4.37   <NA>             1
    ## 47       D6      2 10.33  2.00   <NA>             1
    ## 48       D7      2 11.42  2.00   <NA>             1
    ## 49       D8      1 29.49  0.41   <NA>             1
    ## 50       D9      2 11.79  2.00   <NA>             1
    ## 51      D10      2  7.07  3.00   <NA>             1
    ## 52      D11      2 21.43  2.57      f             2
    ## 53      D12      3  4.45  1.00   <NA>             1
    ## 54      D13      3 13.46  2.00      m             1
    ## 55       E1      3  6.49  1.51   <NA>             2
    ## 56       E2      3 12.47  2.07   <NA>             1
    ## 57       E3      3 10.48  2.00   <NA>             1
    ## 58       E4      2 38.82  4.00      m             1
    ## 59       E5      2 23.42  1.50      m             1
    ## 60       E6      2  7.07  1.00      f             1
    ## 61       E7      1 13.07  3.00   <NA>             1
    ## 62       E8      1  6.49  0.71   <NA>             1
    ## 63       F1      3 19.47  5.00   <NA>             1
    ## 64       F2      3 18.96  3.11   <NA>             1
    ## 65       F3      2 13.19  3.00   <NA>             4
    ## 66       F4      1 25.58  5.00   <NA>             1
    ## 67       F5      1  7.07  5.93   <NA>             2
    ## 68       F6      3 53.47  6.53   <NA>             1
    ## 69       F7      3 13.97  2.31   <NA>             1
    ## 70       F8      1 49.03  3.97   <NA>             2
    ## 71       F9      3 11.99  1.98   <NA>             1
    ## 72      F10      1 26.14  4.00      f             3
    ## 73      F11      1  7.07  0.00      f             2
    ## 74      F12      3 13.07  1.93      m             1
    ## 75      F13      3 13.97  2.32      m             1
    ## 76      F14      2  6.49  2.00      m             4
    ## 77      F15      3 43.44  4.78      m             1
    ## 78      F16      1 10.12  0.63      f             2
    ## 79       G1      3 44.36  0.64      m             2
    ## 80       G2      3 11.99  1.98      m             1
    ## 81       G3      2  8.16  1.00      m             2
    ## 82       G4      2 13.99  3.01      m             2
    ## 83       G5      2 18.52  2.00      m             1
    ## 84       G6      2  7.07  1.93      f             2
    ## 85       G7      2 15.84  2.00      f             1
    ## 86       G8      1 13.07  1.93      m             2
    ## 87       G9      1  7.07  1.00      m             2
    ## 88      G10      2  8.71  2.00      m             1
    ## 89      G11      2  7.07  3.93      m             2
    ## 90      G12      2 18.52  0.00      f             4
