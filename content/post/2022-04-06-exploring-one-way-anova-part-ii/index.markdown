---
title: Exploring One-Way ANOVA (Part II)
author: ''
date: '2022-04-06'
slug: exploring-one-way-anova-part-ii
categories: [one way anova, statistics, concepts, R, sports, gato365, datascience]
tags: []
subtitle: 'A further guide for my high school students.'
summary: 'Using data to understand statistical techniques.'
authors: []
lastmod: '2022-04-06T18:11:46Z'
featured: no
katex: true
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---




# Instructions:
Read through this exercise and be sure to commit and push every time I ask you to. 

Remember:
<span style="color: red;"> Also answer questions along the way in your R markdown file. The questions will be in red.</span> 

<span style="color: purple;">'When you see purple text commit and state what you just did for your commit.'</span>

## Welcome back!!
In the last post we focused on:

**1. The purpose of One-Way ANOVA** is to determine whether the population means are the same across 3 more groups

**2. Visualizations of Data for One-Way ANOVA**
  
  - Box Plot
  - Violin Plot

Today we are going to summarize the data and evaluate a specific statistic to understand hypothesis testing further for One-Way ANOVA.

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>



Before I begin, I must mutate cyl because R will consider to be numeric.



```r
mod_mtcars = mtcars %>% 
  mutate(cyl = as.factor(cyl))
```


### Summaization of the Data


```r
summary_mtcars_df = mod_mtcars %>% 
  group_by(cyl) %>% 
  summarise(sample_size = n(),
            mean_mpg = mean(mpg,na.rm = TRUE),
            sd_mpg = sd(mpg,na.rm = TRUE))

summary_mtcars_df
```

```
## # A tibble: 3 × 4
##   cyl   sample_size mean_mpg sd_mpg
##   <fct>       <int>    <dbl>  <dbl>
## 1 4              11     26.7   4.51
## 2 6               7     19.7   1.45
## 3 8              14     15.1   2.56
```

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


**Coding Notes:**

What is *na.rm =TRUE* and why did I use it? This is for values that may be missing (NA) in your data set, I do not have missing values, but you may.


**Summary Notes**

- The sample size not equal across the number of cylinders
- It can be seen as the number of cylinders increase the mean of miles per gallon decreases. We cannot talk about causality because we did not implement an experiment.
- The standard deviation of the 4 cylinder cars is more that 3 times (4.51/1.45) more than 8 cylinder cars

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


<span style="color: red;">Question 1: What does mean measure with the sample? the center or variability? Explain.</span>

<span style="color: red;">Question 2: What does standard deviation measure within the sample? the center or variability? Explain.</span>

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>





The point of One-Way ANOVA is to determine if the population means are equal using
the information from a sample. A good way to think of One-Way ANOVA is to think of
the ratio between the standard deviation of the sample means compared to the mean 
of the standard deviations.
\\(\frac{\text{Standard Deviation of the Means}}{\text{Mean of the Standard Deviations}}\\)
Here is how it is calculated in R:

```r
ratio_anova = sd(summary_mtcars_df$mean_mpg) / mean(summary_mtcars_df$sd_mpg)
ratio_anova
```

```
## [1] 2.048148
```

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


In a situation when the means are different, the ratio that we just found,2.0481485 would be quite large. Below I give a rationale on why this does not work for this data set.


In a proper implementation of One-Way ANOVA we assume that the standard deviation across all groups are equal. A good gauge to see if the standard deviations are approximately equal is the look at the ratio between the max and min standard deviation \\(s_{max}/s_{min}\\). If this ratio is less than 2 this assumption has been met, if not interesting result will occur.


```r
max(summary_mtcars_df$sd_mpg)/min(summary_mtcars_df$sd_mpg)
```

```
## [1] 3.102593
```

Since this ratio is so large the following description does not work well for
this data. If your box plots are extremely different in your post for part 1 
and/or the means are extremely different from your summarized data (above),
the standard deviation ratio \\(s_{max}/s_{min}\\) is the issue.

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


