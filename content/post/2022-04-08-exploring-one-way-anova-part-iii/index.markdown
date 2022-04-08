---
title: Exploring One-Way ANOVA (Part III)
author: ''
date: '2022-04-08'
slug: exploring-one-way-anova-part-iii
categories: [one way anova, statistics, concepts, R, sports]
tags: []
subtitle: 'Calculations of One-Way ANOVA'
summary: 'Calculations and being able to explain why!'
authors: []
lastmod: '2022-04-08T14:36:00Z'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---


# Instructions:
This is a tough post so I am going to have you just implement this code on your data and
we will discuss the equations in class tomorrow after the website. 

<span style="color: purple;">'When you see purple text commit and state what you just did for your commit.'</span>




```r
mod_mtcars = mtcars %>% 
  mutate(cyl = as.factor(cyl))
```



### Implementation of the One-Way ANOVA Model

```r
model1 <- aov(mpg ~ cyl, mod_mtcars)
tidy(model1)
```

```
## # A tibble: 2 × 6
##   term         df sumsq meansq statistic  p.value
##   <chr>     <dbl> <dbl>  <dbl>     <dbl>    <dbl>
## 1 cyl           2  825.  412.       39.7  4.98e-9
## 2 Residuals    29  301.   10.4      NA   NA
```

## We are going to explain each number


K: number of cylinders (groups)

n: sample size

In this problems K = 3 (types of cylinder) & n = 32 (cars)




```r
K = 3
n = 32
```

<span style="color: purple;">'Commit Here: state the sample size and number of groups'</span>




degrees of freedom of cyl term is K - 1 = 2


degrees of freedom of Residuals term is n - K = 29





```r
df_groups = K - 1 
df_residuals = n - K
```

<span style="color: purple;">'Commit Here: determine the degrees of freedom'</span>



### Sums of Square cyl

```r
overall_mean = mean(mod_mtcars$mpg, na.rm = TRUE)

SS_groups_df = mod_mtcars %>% 
  group_by(cyl) %>% 
  summarise(group_means = mean(mpg,na.rm = TRUE), group_sample_size = n()) %>% 
  mutate(mean_diff = (group_means - overall_mean)) %>% 
  mutate(mean_diffsq = (mean_diff)^2) %>% 
  mutate(sam_mean_diffsq = (group_sample_size)* mean_diffsq )
  
(SS_groups = sum(SS_groups_df$sam_mean_diffsq))
```

```
## [1] 824.7846
```

<span style="color: purple;">'Commit Here: calculate sums of square of groups'</span>



### Sums of Square Residuals


```r
SS_residuals_df = mod_mtcars %>% 
  group_by(cyl) %>% 
  summarise(sd_group = sd(mpg, na.rm = TRUE), group_sample_size = n()) %>% 
  mutate(sp2 =  (group_sample_size - 1)*(sd_group^2))

(SS_residuals = sum(SS_residuals_df$sp2))
```

```
## [1] 301.2626
```

<span style="color: purple;">'Commit Here: calculate the sums of squares of residuals'</span>



### Mean Square

#### Groups

```r
(MS_groups = SS_groups/df_groups)
```

```
## [1] 412.3923
```

<span style="color: purple;">'Commit Here: calculate the mean square of groups'</span>



#### Residuals

```r
(MS_residual = SS_residuals/df_residuals)
```

```
## [1] 10.38837
```


<span style="color: purple;">'Commit Here: Calculate the mean square of residuals'</span>


### Test Statistic

```r
(TS = MS_groups / MS_residual)
```

```
## [1] 39.69752
```


<span style="color: purple;">'Commit Here: calculate the test statistic'</span>



### p-value

```r
1 -  pf(TS, df_groups,df_residuals)
```

```
## [1] 4.978919e-09
```


<span style="color: purple;">'Commit Here: calculate the p-value'</span>






