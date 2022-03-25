---
title: One-Way ANOVA with ICU Data (Part I)
author: 'Immanuel Williams PhD'
date: '2022-03-23'
slug: one-way-anova-with-icu-data
categories: []
tags: [ANOVA, statistics, R, Simulation Based Inference, One-Way ANOVA,]
subtitle: ''
summary: 'Using ICU data to implement One-Way ANOVA.'
authors: []
lastmod: '2022-03-23T19:26:20Z'
featured: no
image:
  focal_point: "/cloud/project/content/post/2022-03-23-one-way-anova-with-icu-data/boxplots_icu.png"
projects: []
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />




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

## The Statistical Question: 

Is the population mean of systolic blood pressure the same across Age Groups?

Using Symbols:
`$$\mu_1 = \mu_2 = \mu_3$$`

Before we discuss this statistical question, lets summarize and visualize the data that are used in this statistical question.

## Summarize the data

```r
ICU %>% 
  group_by(AgeGroup) %>% 
  summarise(`Sample Size` = n(),
            `Mean of Systolic Blood Pressure` = round(mean(SysBP,na.rm =TRUE),3),
            `SD of Systolic Blood Pressure` = round(sd(SysBP,na.rm =TRUE),3)) %>% 
  kable() %>% 
  kable_styling(position = 'center') %>% 
  row_spec(0,bold = TRUE)
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;font-weight: bold;"> AgeGroup </th>
   <th style="text-align:right;font-weight: bold;"> Sample Size </th>
   <th style="text-align:right;font-weight: bold;"> Mean of Systolic Blood Pressure </th>
   <th style="text-align:right;font-weight: bold;"> SD of Systolic Blood Pressure </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:right;"> 129.847 </td>
   <td style="text-align:right;"> 22.001 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:right;"> 133.026 </td>
   <td style="text-align:right;"> 39.408 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 133.625 </td>
   <td style="text-align:right;"> 33.208 </td>
  </tr>
</tbody>
</table>
*General Comments:*

- The sample sizes are not the same but that is not an issue.
- The means for group 2 and 3 are approximately the same
- The equal variance assumption should not be an issue `\(s_{max}/s_{min} = 1.5\)`


## Visualize the data

```r
ICU %>% 
  mutate(AgeGroup = as.factor(AgeGroup) )%>% 
  ggplot(aes(x = AgeGroup, y = SysBP , fill = AgeGroup)) +
  geom_boxplot() +
  theme_bw() + 
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9")) +
  stat_summary(fun="mean", color="red", shape=15, size = 1.2) +
  labs(x = 'Age Group', 
       y = 'Systolic Blood Pressure', 
       title = 'Boxplots of Systolic Blood \n Pressure Across Age Groups') +
  theme(plot.title = element_text(hjust = 0.5, size = 15, face = 'bold'),
        axis.title = element_text(size = 10, color = 'black'), legend.position = 'NONE') 
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

*General Comments:*

- The red square are the means, whereas, the horizontal line in the middle. These values are approximately the same for all three groups
- Group 1 and 2 have outliers



Do we have evidence against this claim in the statistical question? 

In other words, if we assume that the population means of systolic blood pressure are the same for all 3 Age Groups, what is the likelihood of observing these means with this sample?

- The larger the likelihood is, the more likely we will observe the sample means under the idea that the population means of systolic blood pressure are the same across Age Groups.

- Whereas, the smaller the likelihood is, the more evidence we have against the claim that the population means of systolic blood pressure are the same across Age Groups. 




```r
a <- aov(SysBP ~ as.factor(AgeGroup), data = ICU)
tidy(a) %>% 
  kable() %>% 
  kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> term </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> sumsq </th>
   <th style="text-align:right;"> meansq </th>
   <th style="text-align:right;"> statistic </th>
   <th style="text-align:right;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> as.factor(AgeGroup) </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 507.7448 </td>
   <td style="text-align:right;"> 253.8724 </td>
   <td style="text-align:right;"> 0.231998 </td>
   <td style="text-align:right;"> 0.7931641 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Residuals </td>
   <td style="text-align:right;"> 197 </td>
   <td style="text-align:right;"> 215574.5752 </td>
   <td style="text-align:right;"> 1094.2872 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table>


*Comments:*

- p-value indicates the likelihood of observing these differences between the sample means given the null hypothesis is true
- Since the p-value is large (*>0.05*), it is very likely for us to see these differences given the population means of systolic blood pressure across age groups are the same

<!-- Q1. What are the ages within each age group? Answer this question using programming -->