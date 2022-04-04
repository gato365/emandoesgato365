---
title: Exploring One-Way ANOVA (Part I)
author: ''
date: '2022-04-04'
slug: exploring-one-way-anova-part-i
categories: [one way anova, statistics, concepts, R, sports]
tags: []
subtitle: 'A guide for my high school students.'
summary: 'Using data to understand statistical techniques.'
authors: []
lastmod: '2022-04-04T12:10:12Z'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---




# Instructions:
Read through this exercise and be sure to commit and push every time I ask you to. You should read the text and copy the text that I write in this post into your R markdown file (do your best to use your own words), making sure you understand what I am doing. This is critical in terms of understanding the analysis. When using your data, consider my suggestion or use the variables that make sense to you.

<span style="color: red;"> Also answer questions along the way in your R markdown file. The questions will be in red.</span> 

<span style="color: purple;">'When you see purple text commit and state what you just did for your commit.'</span>


## 1. The purpose of One-Way ANOVA 
One-Way ANOVA is used to determine whether the population means are the same across 3 more groups. In other words, you would like to determine if the population means are equal to the same value. 

**Example 1**: A farmer has three types of fertilizer and she wants to determine whether the three types of fertilizer has the same impact on her crop yield. In other words, is the population mean of crop yield the same for each fertilizer?

**Example 2**: Does the type of drink (red bull, coffee, orange juice or water) before a 10K have an impact on finishing time? What this question is asking is to determine whether the population mean of finishing time the same for these four drinks.

What do you notice here with these two examples?

1. There are two variables
2. One variable is quantitative and the other is categorical

- Example 1: Fertilizer Type (Categorical) & Crop Yield (Quantitative)
- Example 2: Type of Drink (Categorical) & Finishing Time (Quantitative)

**Special Note: the categorical variable is the explanatory variable, and the quantitative variable is the response variable**

<span style="color: red;">Question 1:  Create an example when it would be appropriate to implement One-Way ANOVA.</span>

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


### Hypothesis Testing
In statistics, we use hypothesis testing to test whether we have evidence against a claim or not. We traditionally call this claim the null hypothesis.

The null hypothesis for *One-Way ANOVA* is that the population means are equal. For example 1, the null hypothesis would be that the population means of crop yields are the same for each type of fertilizer. In example 2, the null hypothesis would be that the population means of finishing time are the across drink type.

On the other hand, the alternative hypothesis for *One-Way ANOVA* is the complement of the null hypothesis which is that at least one of the population means is different from the others. In example 1, at least one of the fertilizer types population mean of crop yield is different from the other fertilizers. Or in example 2, at least one of the type of drinks population mean of finishing time is different from the others drink types.


<span style="color: red;">Question 2:  State the null the alternative hypotheses for the example that you came up with for your example in question 1.</span>

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


The general idea is to acquire a **sample** from the population and use the evidence from the sample to either reject the claim (the null hypothesis) or not reject the claim (the null hypothesis).


**Important Caveat:** The data that we will investigate does not naturally follow the general premise of statistical theory (we are not taking a random sample), but we will still use the data as material to learn about *One-Way ANOVA* even though the population does not exist.

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


## 2. The data
<span style="color: blue;">Use your data in your R markdown file. Use should not mention mtcars but refer to your data set. Email me if you have any questions.</span>

<span style="color: red;">Nick: Consider Year as the explanatory variable and FIPS as the response variable (only start pitchers, include all work (the manipulation aspect) within the R Markdown file)</span>

<span style="color: red;">Sid: Consider Position as the explanatory variable and Points as the response variable (consider only MJ's year, include all work (the manipulation aspect) within the R Markdown file)</span>

<span style="color: red;">Question 3:  State the null the alternative hypotheses based on these variables.</span>
### Description
The data set that we are going to use is the mtcars data frame. I would like to know whether the population mean of miles per gallon is the same for all three levels of cylinders. We do not know how this data set was collected so we cannot trust these results. 

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>

**Side Note: since cylinder is numeric, R is going to treat it as if it is a number so I am going to let R know it is categorical by using the factor function.**


```r
mod_mtcars = mtcars %>% 
  mutate(cyl = as.factor(cyl))
```


## 2.	Visualization
Visualization of data is always a great place to start to get a general understanding of what is going on with the data. We are going to explore two types of plots to gain a better understanding of the data.

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


### Provide a Box Plot with mean

Below is a box plot which provides a 5 number summary (Min, First Quartile, Median, Third Quartile, Max) if miles per gallon for each type of cylinder. 

```r
mod_mtcars %>%  
  ggplot(aes(x = cyl, y = mpg)) +
  geom_boxplot() +
  labs(x = 'Cylinder', y = 'Miles Per Gallon', title = 'Box Plot for One-Way ANOVA') +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, face = 'bold', size = 15))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />
#### Interpretation
This graph is a great was to visualize the distribution of the data, however, we are comparing means. So lets include the mean within the plot.
<span style="color: purple;">'Commit Here: state what you just did for your message'</span>




```r
mod_mtcars %>%  
  ggplot(aes(x = cyl, y = mpg)) +
  geom_boxplot() +
  stat_summary(fun ="mean", color = 'red')+
  labs(x = 'Cylinder', y = 'Miles Per Gallon', title = 'Box Plot for One-Way ANOVA with means') +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, face = 'bold', size = 15))
```

```
## Warning: Removed 3 rows containing missing values (geom_segment).
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-4-1.png" width="672" />
<span style="color: purple;">'Commit Here: state what you just did for your message'</span>



#### Interpretation
The red points denote the mean which look clearly different, however, we should still implement One-Way ANOVA to be sure.

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>



### Provide a violin plot with mean

The violin plot allows us to visualize where a majority of the data lies without eyeballing where the median within the box. The violin plot can also be considered a mix of a density and box plot, in that it shows where a majority of the data is as well as it distribution.

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


```r
mod_mtcars %>%  
  ggplot(aes(x = cyl, y = mpg)) +
  geom_violin() +
  stat_summary(fun ="mean", color = 'red')+
  labs(x = 'Cylinder', y = 'Miles Per Gallon', title = 'Violin Plot for One-Way ANOVA') +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, face = 'bold', size = 15))
```

```
## Warning: Removed 3 rows containing missing values (geom_segment).
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-5-1.png" width="672" />

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


#### Interpretation
The miles per gallon for 4 cylinder cars are evenly spread from about 22 to around 34. However, there is a concentration of miles per gallon around 15 for 8 cylinder cars where the range is between 11 to 19. Lastly, the 6 cylinders cars is concentrated around the mean which is 19. The range is the smallest of all levels of cylinders. 


<span style="color: purple;">'Commit Here: state what you just did for your message'</span>

# Next Post ...

- Summarization of data
- Quick Evidence Check

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>
