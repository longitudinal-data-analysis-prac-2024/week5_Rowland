# week5_Rowland

```{r}
library(tidyverse)
```

# Week 5 Practice #

*the following exercises are a test in disguise.*
*what do you think about the coding?* 
*can you think of any improvements to the following?*

## PROBLEM 1 ##

*visualizing your data is important!*
*summary statistics can be highly misleading, and simply plotting the data can reveal a lot more!*
*Lets look at the Anscombe’s Quartet data. There are four different data sets.*
*Anscombe, F. J. (1973). "Graphs in Statistical Analysis". American Statistician. 27 (1): 17–21. doi:10.1080/00031305.1973.10478966. JSTOR 2682899.*

```{r}
anscombe_quartet <-  readRDS("anscombe_quartet.rds")
```

**let's explore the dataset**

```{r}
str(anscombe_quartet)
```

**what does the function str() do?**
<span style = "color:blue"> The function str() gives an overview of the data set. It tells you how many categories there are in the dataset (dataset, x, y in this case). It also shows the first few data points of each category.</span>

**let's check some summary statistics:**
```{r}
anscombe_quartet %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )
```

**what do the summary statistics tell us about the different datasets?**
<span style = "color:blue"> All four datasets have the same means for x and y. For dataset 1 to 3, the mimimum value of x is 4; and the minimum value of x is 8 for only dataset 4. The minimum values of y differ across the four dataset, with dataset 2 having the smallest minimum y value (3.1), and dataset 3 having the largest minimum y value (5.39). Similarly, for dataset 1 to 3, the maximum value of x is 14; and for dataset 4, the maximum value of x is 19. Dataset 2 again has the smallest maximum y value and dataset 3 again has the biggest maximum y value. All four datasets have very similar correlation coefficient (though dataset_4's x and y correlation coefficient is slightly larger by 0.001). This means that for all four datasets, the correlations between x and y are positive and relatively strong (close to 1); furthermore, the degrees of correlation for the four dataset are approximately the same.</span>

**let's plot the data with ggplot:**
~~require(ggplot2)~~
<span style = "color:blue"> I wouldn't use require() here. Since the package tidyverse already contains ggplot2, I would simply delete this line of code. If we need a package that is not included in tidyverse already, I would use library() function.</span>
```{r, echo=TRUE}
ggplot(anscombe_quartet, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)
```

**save the plot**
```{r}
ggsave(".../dataset/anscombe_quartet.png", width = 20, height = 20, units = "cm", dpi = 500)
```

**what do the plots tell us about the different datasets?**
<span style = "color:blue">The plots tell us that although the four data sets have exactly the same mean x and mean y values and almost the same correlation coefficients between x and y, the patterns of data points for these data sets are visibly different.</span>

**describe the relationship between x and y in the different datasets.**
<span style = "color:blue">In data set 1, x and y could be described with a positive linear relationship-as x becomes larger, y becomes larger too. For data set 2, the relationship between x and y is rather quadratic, since the shape of distribution of data points is a parabola. In other words, there is a peak at one point of x where y is the largest, and y values are smaller than this maximum value when x values are elsewhere. For data set 3, x and y follows an approximately positive linear relationship but there is an outlier y value when x is approximately 13. For data set 4, almost all x values are gathered at one point except for one. There is no relationship between x and y for this dataset.</span>

**would linear regression be an appropriate statistical model to analyse the x-y relationship in each dataset?**
<span style = "color:blue">I would only use linear regression model to analyze the x-y relationship in data set 1 and data set 3. In data set 3 though, depending on differential experimental conditions, I might need to omit or take further considerations about the outlier data point.</span>

**what conclusions can you draw for the plots and summary statistics?**
<span style = "color:blue">The takeaway is that even if the summary statisics of a set of data (mean, sd, min, max, etc.) are extremely similar, we do not really know if the underlying distribution patterns of datasets are also similar. It is always helpful to plot out individual datapoints to see the general patterns of a set of data.</span>

# #Problem 2 ##
**load in the datasaurus dataset**
```{r}
datasaurus_dozen <- readRDS("datasaurus_dozen.rds")
```

**explore the dataset**
```{r}
str(datasaurus_dozen)
```

**how many rows and columns does the datasaurus_dozen file have?**
<span style = "color:blue">The file has three columns-dataset, x and y. And there are 1846 rows.</span>

**plot the dataset**
```{r, echo=TRUE}
ggplot(datasaurus_dozen, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)
```

**calculate the correlations and summary statistics for x and y in all datasets:**
```{r}
datasaurus_dozen %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )
```

**Plot the relationships between x and y in each dataset including the line of best fit**
```{r, echo=FALSE}
ggplot(datasaurus_dozen, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)
```

**save the plot**
```{r}
ggsave(".../dataset/datasaurus_dozen.png", width = 20, height = 20, units = "cm", dpi = 500)
```

**what conclusions can you draw for the plots and summary statistics? **
<span style = "color:blue">According to the summary statistics, all datasets have the same mean x values and mean y values. The max x and max y values are very similar too. Furthermore, we can see the linear correlation coefficients are very similar across all datasets in this file. However, we can see in the plots that the distributions of data points are distinctly different for each data set. Similar to problem 1, the takeaway woudl eb that it is helpful to plot out individual data points when doing analysis.</span>
