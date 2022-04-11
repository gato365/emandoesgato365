---
title: Two-Way ANOVA is a simple extension (Part I)
author: ''
date: '2022-04-11'
slug: two-way-anova-is-a-simple-extension-part-i
categories: [one way anova, statistics, concepts, R, sports, gato365, datascience, two way anova]
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2022-04-11T19:16:59Z'
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

## 1. The purpose of Two-Way ANOVA 
The primary purpose of two-way another is to determine if two explanatory variables 
have an impact on a response variable, in other words, are the means the same 
across each level of an explanatory variables as well the interaction of the
explanatory variables on the response. It works in a very subtle way, so lets 
use the *mtcars* data frame to make sense of this technique. Let's say we want 
to know whether the means of miles per gallon are the same across the levels
of cylinders (4, 6, 8) as well as the the means of miles per gallon across
the transmission types (i.e., manual and automatic).


**Example 1**: A farmer has three types of fertilizer and four types of corn. She wants to determine whether the three types of fertilizer and four types of corn has the same impact on her crop yield. They are three questions that she could ask:

 1. Is the population mean of crop yield the same for each fertilizer?
 2. Is the population mean of crop yield the same for each type of corn?
 3. Is there an interaction effect on crop yield between fertilizer and corn type?

**Example 2**: Does the type of drink (red bull, coffee, orange juice or water) or type of food (donuts or eggs) before a 10K have an impact on finishing time? Again, there are now three questions that can be asked:

  1. Determine whether the population mean of finishing time of the 10K the same for these four drinks.
  2. Determine whether the population mean of finishing time of the 10K the same for the two types of food.
  3. Determine whether there is an interaction effect between food and drink types on the 10K finishing time.

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>

What do you notice here with these two examples?

1. There are 3 variables
2. One variable is quantitative and the other two are categorical or categorical binary

  - Example 1: Corn type (Categorical), Fertilizer type (Categorical) & 
  Crop Yield (Quantitative)
  - Example 2: Food type (Categorical Binary) Type of Drink (Categorical) & 
  Finishing Time (Quantitative)

<span style="color: red;">Question 1:  Create an example when it would be appropriate
to implement Two-Way ANOVA. State the variables, their types (i.e., categorical
"binary" or quantitative), and which are the explanatory variables and response
variable. </span>

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>

### Hypothesis Testing

The null hypothesis for *Two-Way ANOVA* is that the population means are equal 
across both explanatory variables. For example 1, 

- the null hypothesis would be that the population means of crop yields are the
  same for each type of fertilizer
- the null hypothesis would be that the population means of crop yields are the
  same for each type of corn
- the null hypothesis for the interaction effect (both corn and fertilizer
  types) would be that there is **not** an interaction effect

In example 2, 

- the null hypothesis would be that the population means of finishing time are
  the across drink type
- the null hypothesis would be that the population means of finishing time are
  the across food type.
- the null hypothesis for the interaction effect (both food and drink
  types) would be that there is **not** an interaction effect

On the other hand, the alternative hypothesis for *One-Way ANOVA* is the complement of the null hypothesis which is that at least one of the population means is different from the others. In example 1,

- at least one of the fertilizer types population mean of crop yield is
  different from the other fertilizers
- at least one of the corn types population mean of crop yield is different from the other corns
- there is an interaction effect on crop yield by corn and fertilizer

Or in example 2,

- at least one of the type of drinks population mean of finishing time is
  different from the others drink types
- at least one of the type of foods population mean of finishing time is
  different from the others food types
- there is an interaction effect on finishing time by food and drink types

<span style="color: red;">Question 2:  State the null the alternative hypotheses for the example that you came up with for your example in question 1.</span>

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


The general idea is to acquire a **sample** from the population and use the evidence from the sample to either reject the claim (the null hypothesis) or not reject the claim (the null hypothesis).


**Important Caveat:** The data that we will investigate does not naturally follow the general premise of statistical theory (we are not taking a random sample), but we will still use the data as material to learn about *Two-Way ANOVA* even though the population does not exist.

<span style="color: purple;">'Commit Here: state what you just did for your message'</span>


## 2. The data
<span style="color: blue;">Use your data in your R markdown file. Use should not mention mtcars but refer to your data set. Email me if you have any questions.</span>


#### <span style="color: red;">**Nick:**</span>

<span style="color: red;">You will use Lg (League) and year to explain the variability in FIPS.</span> 

#### <span style="color: red;">**Sid:**</span>

<span style="color: red;">You should create a new variable named binary_mp where there are two levels:</span>

- <span style="color: red;">less than 20 named 'few_mp'</span>
- <span style="color: red;">greater than or equal to 20 named 'large_mp'</span>


<span style="color: red;">You will use binary_mp and position to explain the variability in points scored.</span> 

<span style="color: red;">Question 3:  State the null the alternative hypotheses based on these variables.</span>


We will look at how transmission and number of cylinders have an impact on miles per gallon. I make the following adjustments so that we we can analyze the data more efficiently. 

```r
mod_mtcars = mtcars %>% 
  mutate(cyl = as.factor(cyl),
         am = case_when( 
           am == 1 ~ 'manual',
           am == 0 ~ 'automatic'))
```

The null hypothesis for Two-Way ANOVA in terms of the variables of interest 
within the mtcars data frame are:
- the null hypothesis would be that the population means of miles per gallon are the
  same for each type of fertilizer
- the null hypothesis would be that the population means of miles per gallon are the
  same for each type of corn
- the null hypothesis for the interaction effect (both corn and fertilizer
  types) would be that there is **not** an interaction effect on miles per gallon


## 3.	Visualization

install and run the following package 'ggpubr' to run a two-way anova visualization of the data.



```r
ggboxplot(mod_mtcars, x = "cyl", y = "mpg", color = "am",
          palette = c("#00AFBB", "#E7B800")) +
  labs(x = 'Cylinder', y = 'Miles Per Gallon', title = 'Box Plot for One-Way ANOVA with means') +
  theme(plot.title = element_text(hjust = 0.5, face = 'bold', size = 15))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />
#### Interpretation





```r
ggline(mod_mtcars, x = "cyl", y = "mpg", color = "am",
       add = c("mean_se", "dotplot"),
       palette = c("#00AFBB", "#E7B800"))
```

```
## Bin width defaults to 1/30 of the range of the data. Pick better value with `binwidth`.
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-4-1.png" width="672" />



