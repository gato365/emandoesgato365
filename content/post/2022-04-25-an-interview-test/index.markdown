---
title: An Interview Test (Part 1)
author: ''
date: '2022-04-25'
slug: an-interview-test
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2022-04-25T16:38:31Z'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---


We are going switch things around a tad bit. We are going to use this last week to remember all the techniques we learned since October. 

After GATO365 Learning Center, you earn an internship with your local community college where they are interested in determining how students perform across various majors and other aspects of their college training.  Therefore they take a sample of students from their database in which they want you to analyze.

## Steps to get Started

1. Install readr

2. Run the following code to gain access to the relevant data frames

```r
library(readr)
grades_url = 'https://raw.githubusercontent.com/gato365/emandoesgato365/main/content/post/2022-04-25-an-interview-test/grades.csv'
assignments_url = 'https://raw.githubusercontent.com/gato365/emandoesgato365/main/content/post/2022-04-25-an-interview-test/assignments.csv' 
students_url = 'https://raw.githubusercontent.com/gato365/emandoesgato365/main/content/post/2022-04-25-an-interview-test/students.csv'
grades_df = read_csv(url(grades_url))
assignments_df = read_csv(url(assignments_url))
students_df = read_csv(url(students_url))
```


3. Explore each data frame and get familiar with the variables.

4. Answer all questions within 1 R markdown file within your website folder

5. Make sure to show your work by providing the code to each question.

## Interview Questions 1:

Q1. How many students are there? Make sure to check for duplicate students.

Q2. How many unique majors are there? How many students are in each major? 

Q3. How many students are in each major by student level?

Q4. [Challenge] Using the information from Q3., which major and student level has the least amount of students? (Hint: Use the ungroup() function.)

Q5. Create a visualization that displays the frequency of each major. Make this visualization look very professional (i.e., titles and color).


Q6. Create a visualization that displays the frequency of each major by student level. Make this visualization look very professional (i.e., titles and color). Change the size of the font so that it is presentable.


<!-- Day 2: Join Data sets and analyze -->
<!-- Day 3: One Way ANOVA by Majors -->
<!-- Day 3: KNN -->
<!-- Day 4: develop an R Shiny -->
