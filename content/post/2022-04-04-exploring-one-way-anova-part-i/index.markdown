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


### Hypothesis Testing
In statistics, we use hypothesis testing to test whether we have evidence against a claim or not. We traditionally call this claim the null hypothesis.

The null hypothesis for *One-Way ANOVA* is that the population means are equal. For example 1, the null hypothesis would be that the population means of crop yields are the same for each type of fertilizer. In example 2, the null hypothesis would be that the population means of finishing time are the across drink type.

On the other hand, the alternative hypothesis for *One-Way ANOVA* is the complement of the null hypothesis which is that at least one of the population means is different from the others. In example 1, at least one of the fertilizer types population mean of crop yield is different from the other fertilizers. Or in example 2, at least one of the type of drinks population mean of finishing time is different from the others drink types.


<span style="color: red;">Question 2:  State the null the alternative hypotheses for the example that you came up with for your example in question 1.</span>

The general idea is to acquire a **sample** from the population and use the evidence from the sample to either reject the claim (the null hypothesis) or not reject the claim (the null hypothesis).


**Important Caveat:** The data that we will investigate does not naturally follow the general premise of statistical theory (we are not taking a random sample), but we will still use the data as material to learn about *One-Way ANOVA* even though the population does not exist.



## 2. The data
The data set that we are going to use is the mtcars data frame. I would like to know whether the population mean of miles per gallon is the same for all three levels of cylinders. We do not know how this data set was collected so we cannot trust these results. 

<span style="color: blue;">Use your data in your R markdown file</span>

Nick: 
Sid: Consider Position and Points

**Side Note: since cylinder is numeric, R is going to treat it as if it is a number so I am going to let R know it is categorical by using the factor function.**


```r
mod_mtcars = mtcars %>% 
  mutate(cyl = as.factor(cyl))
```


## 2.	Visualization
Visualization of data is always a great place to start to get a general understanding of what is going on with the data. We are going to explore two types of plots to gain a better understanding of the data.

### Provide box plot with mean


```r
mod_mtcars %>%  
  ggplot(aes(x = cyl, y = mpg)) +
  geom_boxplot() +
  labs(x = 'Cylinder', y = 'Miles Per Gallon', title = 'Box Plot for One-Way ANOVA') +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, face = 'bold', size = 15))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />


i.	Benefits 
ii.	Interpretations



b.	Provide Violin plot with mean
i.	Benefits 
ii.	Interpretations
