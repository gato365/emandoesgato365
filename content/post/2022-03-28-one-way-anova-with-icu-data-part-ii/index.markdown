---
title: One-Way ANOVA with GPA Data Part II
author: ''
date: '2022-04-04'
slug: one-way-anova-with-gpa-data-part-ii
categories: []
tags: [ANOVA, statistics, R, Simulation Based Inference, One-Way ANOVA]
subtitle: ''
summary: ''
authors: []
lastmod: '2022-03-28T19:38:40Z'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />



{{< toc >}} 






## Going a bit deeper
We have to remember what the null hypothesis is.

The null is that the population means of GPA are the same across the sports.

Using Symbols:
$$\mu_1 = \mu_2 = \mu_3 = \mu_4 $$

If we assume the null hypothesis is true, it does not matter which sport a student plays, the mean GPA for each sport will approximately be the same.

So let's randomly assign a student to a sport and determine the likelihood of observing the mean and standard deviation GPA and of each sport (measured by the test statistic) that we actually observed in the previous post.

This brain activity is important because it gives us the chances of observing such a difference between sport's mean GPA if the null hypothesis is true.


This code randomly assigns a sport to each student

```r
mod_sports_df = transform( sports_df, sport = sample(sport) )
```


1) The original data frame

```r
head(sports_df,4) %>% 
  kable() %>% 
  kable_styling(full_width = TRUE) %>% 
  column_spec(1:2,bold = TRUE,color = 'red')
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> gpa </th>
   <th style="text-align:left;"> drive </th>
   <th style="text-align:left;"> sport </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;font-weight: bold;color: red !important;"> 2.877 </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> bus </td>
   <td style="text-align:left;"> football </td>
  </tr>
  <tr>
   <td style="text-align:right;font-weight: bold;color: red !important;"> 2.822 </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> drive </td>
   <td style="text-align:left;"> football </td>
  </tr>
  <tr>
   <td style="text-align:right;font-weight: bold;color: red !important;"> 2.856 </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> bus </td>
   <td style="text-align:left;"> football </td>
  </tr>
  <tr>
   <td style="text-align:right;font-weight: bold;color: red !important;"> 2.984 </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> bus </td>
   <td style="text-align:left;"> football </td>
  </tr>
</tbody>
</table>

2) Randomly assign sports data frame

```r
head(mod_sports_df,4) %>% 
  kable() %>% 
  kable_styling(full_width = TRUE) %>% 
  column_spec(1:2,bold = TRUE,color = 'red')
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> gpa </th>
   <th style="text-align:left;"> drive </th>
   <th style="text-align:left;"> sport </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;font-weight: bold;color: red !important;"> 2.877 </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> bus </td>
   <td style="text-align:left;"> baseball </td>
  </tr>
  <tr>
   <td style="text-align:right;font-weight: bold;color: red !important;"> 2.822 </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> drive </td>
   <td style="text-align:left;"> football </td>
  </tr>
  <tr>
   <td style="text-align:right;font-weight: bold;color: red !important;"> 2.856 </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> bus </td>
   <td style="text-align:left;"> basketball </td>
  </tr>
  <tr>
   <td style="text-align:right;font-weight: bold;color: red !important;"> 2.984 </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> bus </td>
   <td style="text-align:left;"> soccer </td>
  </tr>
</tbody>
</table>



As you can see the first two columns within both data frames are the same while the sport in the randomly assign data frame is different from the original.


## Visualize and Summarize



<!-- Other Way -->
<!-- https://recipes.tidymodels.org/reference/step_shuffle.html -->



