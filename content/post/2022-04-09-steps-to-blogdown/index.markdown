---
title: Steps to blogdown
author: ''
date: '2022-04-09'
slug: steps-to-blogdown
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2022-04-09T14:02:53Z'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---


Important Terminology - what is:

- hugo? - static site generator
- blogdwn? - website platform (i.e., Wordpress)
- Netlify? - web development platform
- GitHub? - version control & Sharing
  - Commit - Snap shot
  - Push - Save snap shot onto GitHub
- A YAML-  Header of files

Before we begin, let's get inspired:
  
  - [Kelly Bodwin](https://www.kelly-bodwin.com/) & [Github](https://github.com/kbodwin/kbodwin-apero)
  - [Andrew Heiss](https://datavizf17.classes.andrewheiss.com/) & [GitHub](https://github.com/andrewheiss/datavizs21.classes.andrewheiss.com)

## **Part 1:** Create a new repository via GitHub

**Step 1:** Create a new Repository (Click the Green Button)
 
Name it ‘theNameOfYourWebsite’ 

✓ Keep the repository Public -  who can see your repository  

✓ Add a README file - a location to place what is the purpose of the repo and how to use code

✓ Add .gitignore  - is a system used to not add certain files to the repo, there are different systems that exists <span style="color: red;">[do not click gitignore this time]</span>

✓ Choose a license - a license tells others what they can and can't do with 
your source code, there are different types of licenses so that users can do specific things with the code based on the selected license




**Step 2:** Click Create Repository (Using R Studio Cloud)

When done, make sure HTTPS is selected, press the copy button, below is an example

https://github.com/gato365/theNameOfYourWebsite.git



**Step 3:** Go to R Studio Cloud

**Step 4:** Click on the New Project then within R Studio Cloud 

**Step 5:** Click on New Project from Git Repository 

**Step 6:** Paste https://github.com/gato365/theNameOfYourWebsite.git where it says "URL for your Git Repository" Click OK





## **Part 2:** Create website with {blogdown} 

**Step 1:** install.packages("blogdown")                  # install the blogdown package 


**Step 2:** install.packages("rstudioapi")                # to be able to navigate files


**Step 3:** library(blogdown)                             # load blogdown 


**Step 4:** new_site(theme = "wowchemy/starter-academic") # create your website! 

*Part of the process:* 1-2 pop screens will show up, just hit 'Save' hit no to preview website



## **Part 3:** Changing Git Ignore File


**Step 1:** Open gitignore file
Run the following code in the console: file.edit("gitignore") 
**Step 2:** Paste specific commands in gitignore file

.Rproj
.user 
.Rhistory 
.RData 
.Ruserdata 
.DS_Store

**Step 3:**  Check Site

Run through blogdown::check_site() to determine what needs to be so that the site works properly

Two boxes come up click save twice

**Step 4:**  Make more changes to gitignore file

Then add these to gitignore file 

Thumbs.db 
/public/ 
/resources/ 
.hugo_build.lock

**Step 5:** Check Site

Run through blogdown::check_site() to determine what needs to be so that the site works properly
Two boxes come up click save twice

**Step 6:** Follow To Do Lists

Make sure you do all the tasks on the to-do lists

One of the tasks includes making sure the most up to dat verision of blog down has is used

options(blogdown.hugo.version = "0.93.3")



## **Part 4:** Netlify

**Step 1:** Sign up with Netlify using your GitHub account
**Step 2:** Click on Sites
**Step 3:** Click on Add New Sites
**Step 4:** Click on Import an Existing Project
**Step 5:** Click on GitHub and it should link up
**Step 6:** Click on the repository that connects to your repository
**Step 7:** Scroll down on the next page to Deploy Site
**Step 8:** Wait for Deploy bots
**Step 9:** Click Custom Domain

  a. Click Site Settings
  
  b. Click Change Site name (use the same name as GitHub)



## **Part 5:**

**Step 1:**
**Step 2:**
**Step 3:**
**Step 4:**
**Step 5:**
**Step 6:**
**Step 7:**
**Step 8:**
## **Part 3:** 
