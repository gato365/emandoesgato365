---
title: One-Way ANOVA with GPA Data (Part I - Superficial)
author: 'Immanuel Williams PhD'
date: '2022-03-26'
slug: one-way-anova-with-gpa-data
categories: []
tags: [ANOVA, statistics, R, Simulation Based Inference, One-Way ANOVA,]
subtitle: ''
summary: 'Using simulated GPA data to implement One-Way ANOVA.'
authors: []
lastmod: '2022-03-23T19:26:20Z'
featured: no
image:
projects: [] 
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />

{{< toc >}} 








## Context of Data:

This data set was generated for the purpose of teaching One- & Two- Way ANOVA. This example  includes three different variables: GPA, sport, whether the student drives to school or not. Within this post I will discuss how to summarize, visualize, and analyze the data.


## Variables in Data Set

1: GPA - Quantitative 
2: sport  - Categorical (soccer, basketball, baseball, football)
3: drive - whether they drive or take the bus


## The Statistical Question: 

Is the population mean of GPA the same across the types of sports?

Using Symbols:
$$\mu_1 = \mu_2 = \mu_3 = \mu_4 $$
Where 1: soccer, 2: is basketball, 3: baseball, and 4: football


Before we discuss this statistical question, lets summarize and visualize the data that are used in this statistical question.

## Summarize the data



```r
sports_df %>% 
  group_by(sport) %>% 
  summarise(`Sample Size` = n(),
            `Mean of GPA` = round(mean(gpa,na.rm =TRUE),3),
            `SD of GPA` = round(sd(gpa,na.rm =TRUE),3))  %>% 
  kable() %>%
  kable_styling(position = 'center') %>%
  row_spec(0,bold = TRUE)
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;"> sport </th>
   <th style="text-align:right;font-weight: bold;"> Sample Size </th>
   <th style="text-align:right;font-weight: bold;"> Mean of GPA </th>
   <th style="text-align:right;font-weight: bold;"> SD of GPA </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> baseball </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 2.973 </td>
   <td style="text-align:right;"> 0.130 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> basketball </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2.858 </td>
   <td style="text-align:right;"> 0.163 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> football </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 2.890 </td>
   <td style="text-align:right;"> 0.135 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> soccer </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 3.072 </td>
   <td style="text-align:right;"> 0.169 </td>
  </tr>
</tbody>
</table>
*General Comments:*

- The sample sizes are not the same but that is not an issue.
- The sample mean GPA for football and soccer are dramatically different
- The equal variance assumption should not be an issue because `\(\frac{s_{max}}{s_{min}} = 1.47 < 2\)`


## Visualize the data

```r
sports_df %>% 
  ggplot(aes(x = sport, y = gpa, fill = sport)) +
  geom_boxplot() +
  theme_bw() + 
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9",'#7CC439')) +
  stat_summary(fun="mean", color="red", shape=10, size = 0.9) +
  labs(x = 'Sports', 
       y = 'GPA', 
       title = 'GPA across Sports') +
  theme(plot.title = element_text(hjust = 0.5, size = 15, face = 'bold'),
        axis.title = element_text(size = 10, color = 'black'), legend.position = 'NONE') 
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

*General Comments:*

- Medians are approximately equal to the means (the points)
- The means do not appear to be equal
- The order of GPAs (soccer> baseball > football > basketball)



Do we have evidence against this claim in the statistical question? 

In other words, if we assume that the population means of GPA are the same for all 4 sports, what is the likelihood of observing these means with this sample?

- The larger the likelihood is, the more likely we will observe these sample means under the idea that the population means of GPA are the same across sports.

- Whereas, the smaller the likelihood is, the more evidence we have against the claim that the population means of GPA are the same across sports.



```r
a <- aov(gpa ~ sport, data = sports_df)
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
   <td style="text-align:left;"> sport </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.3538122 </td>
   <td style="text-align:right;"> 0.1179374 </td>
   <td style="text-align:right;"> 5.264004 </td>
   <td style="text-align:right;"> 0.0032583 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Residuals </td>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:right;"> 1.0530118 </td>
   <td style="text-align:right;"> 0.0224045 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table>


*Comments:*

- p-value indicates the **likelihood** of observing these differences between the sample means given the null hypothesis is true

- Since the p-value is small (*= 0*), it is very unlikely for us to see these differences given the population means of GPA across sports are the same


## Next Post will be...
My Simulation Based inference Approach

<!-- Q1. What are the ages within each age group? Answer this question using programming -->
