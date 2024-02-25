# the following exercises are a test in disguise. 
# what do you think about the coding? 
# can you think of any improvements to the following?


rm(list=ls()) #always clean up your environment! 

# install.packages("tidyverse") #uncomment to install tidyverse if you haven't already

library(tidyverse)

## PROBLEM 1 ##

> visualizing your data is important!
  > summary statistics can be highly misleading, and simply plotting the data can reveal a lot more!
  > Lets look at the Anscombe’s Quartet data. There are four different data sets.
> Anscombe, F. J. (1973). "Graphs in Statistical Analysis". American Statistician. 27 (1): 17–21. doi:10.1080/00031305.1973.10478966. JSTOR 2682899.

anscombe_quartet = readRDS("anscombe_quartet.rds")

# let's explore the dataset 
str(anscombe_quartet)

# what does the function str() do? 
# The function str() gives an overview of the data set. It tells you how many categories there are in the dataset (dataset, x, y in this case). It also shows the first few data points of each category.

# let's check some summary statistics:

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

# what do the summary statistics tell us about the different datasets? 
# All four datasets have the same means for x and y. For dataset 1 to 3, the mimimum value of x is 4; and the minimum value of x is 8 for only dataset 4. The minimum values of y differ across the four dataset, with dataset 2 having the smallest minimum y value (3.1), and dataset 3 having the largest minimum y value (5.39). Similarly, for dataset 1 to 3, the maximum value of x is 14; and for dataset 4, the maximum value of x is 19. Dataset 2 again has the smallest maximum y value and dataset 3 again has the biggest maximum y value. All four datasets have very similar correlation coefficient (though dataset_4's x and y correlation coefficient is slightly larger by 0.001). This means that for all four datasets, the correlations between x and y are positive and relatively strong (close to 1); furthermore, the degrees of correlation for the four dataset are approximately the same.

# let's plot the data with ggplot:

#require(ggplot2)---I wouldn't use require() here. Since the package tidyverse already contains ggplot2, I would simply delete this line of code. If we need a package that is not included in tidyverse already, I would use library() function.


ggplot(anscombe_quartet, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)

#save the plot

ggsave("anscombe_quartet.png", width = 20, height = 20, units = "cm", dpi = 500)

# what do the plots tell us about the different datasets? 
# The plots tell us that although the four data sets have exactly the same mean x and mean y values and almost the same correlation coefficients between x and y, the patterns of data points for these datasets are visibly different. 

# describe the relationship between x and y in the different datasets. 
#

# would linear regression be an appropriate statistical model to analyse the x-y relationship in each dataset?

# what conclusions can you draw for the plots and summary statistics? 




## PROBLEM 2 ##

# load in the datasaurus dataset
datasaurus_dozen = readRDS("datasaurus_dozen.rds")

# explore the dataset 

# how many rows and columns does the datasaurus_dozen file have? 

# plot the dataset 

# calculate the correlations and summary statistics for x and y in all datasets: 

# Plot the relationships between x and y in each dataset including the line of best fit.

# save the plot 

# what conclusions can you draw for the plots and summary statistics? 
