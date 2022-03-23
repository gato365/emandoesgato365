---
title: One-Way ANOVA with ICU Data (Part I)
author: ''
date: '2022-03-23'
slug: one-way-anova-with-icu-data
categories: []
tags: [ANOVA, statistics, R, Simulation Based Inference]
subtitle: ''
summary: ''
authors: []
lastmod: '2022-03-23T19:26:20Z'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---


```r
library(tidyverse)
load("/cloud/project/content/post/2022-03-23-one-way-anova-with-icu-data/ICU.rda")
```


## Context of Data:
(Get From STAT Book)

## Variables in Data Set

1. ID: Not a variable
2. Survive: Categorical Binary (0: survived, 1: did not survived)
3. Age: Quantitative
4. AgeGroup: Categorical (1: young ,2: middle age,3: old)
5. Sex: Categorical Binary
6. Infection: Categorical Binary (0: not infected ,1: infected )
7. SysBP: Quantitative
8. Pulse: Quantitative
9. Emergency: Categorical Binary (0: not an emergency ,1: emergency)

Statistical Question: 

Is the population mean of systolic blood pressure the same across Age Groups?

Using Symbols:
`$$\mu_1 = \mu_2 = \mu_3$$`


```r
ICU %>% 
  group_by(AgeGroup) %>% 
  summarise(`Sample Size` = n(),
            `Mean of Systolic Blood Pressure` = round(mean(SysBP,na.rm =TRUE),3),
            `SD of Systolic Blood Pressure` = round(sd(SysBP,na.rm =TRUE),3))
```

```
## # A tibble: 3 × 4
##   AgeGroup `Sample Size` `Mean of Systolic Blood Pressure` `SD of Systolic Blo…`
##      <int>         <int>                             <dbl>                 <dbl>
## 1        1            59                              130.                  22.0
## 2        2            77                              133.                  39.4
## 3        3            64                              134.                  33.2
```





Do we have evidence against this claim? 

In other words, if we assume that the population means of systolic blood pressure are the same for all 3 Age Groups, what is the likelihood of observing these means with this sample?

- The larger the likelihood is, the more likely we will observe the sample means under the idea that the population means of systolic blood pressure are the same across Age Groups.

- Whereas, the smaller the likelihood is, the more evidence we have against the claim that the population means of systolic blood pressure are the same across Age Groups. 

