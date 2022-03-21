---
title: Getting Used to GitHub
author: ''
date: '2022-03-21'
slug: getting-used-to-github
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2022-03-21T16:06:30Z'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---



### 1. Some Important Questions 

**Question 1:** What is GitHub?  

*Answer 1:* version control, in other words, it allows programmers the ability to track and control changes to their code


**Question 2:** Why is it important?

*Answer 2:* GitHub is important because it allows for seamless collaboration without compromising the integrity of the original project


### 2. Some Great GitHub Profiles include:

Hadley Wickham (inventor of tidyverse) - https://github.com/hadley 

Devon Carew (random guy who works at Google) - https://github.com/devoncarew


### 3. Getting started with GitHub

**Step 1:** Create a GitHub account with the same email that you use for R Studio cloud 

**Step 2a:** Create a new Repository (Click the Green Button)
 
Name it ‘yourName1stProject’ 

✓ Keep the repository Public -  who can see your repository  

✓ Add a README file - a location to place what is the purpose of the repo and how to use code

✓ Add .gitignore  - is a system used to not add certain files to the repo, there are different systems that exists

✓ Choose a license - a license tells others what they can and can't do with 
your source code, there are different types of licenses so that users can do specific things with the code based on the selected license




**Step 2b:** Click Create Repository (Using R Studio Cloud)

When done, make sure HTTPS is selected, press the copy button, below is an example

https://github.com/gato365/learningAboutGitHub.git



**Step 3:** Go to R Studio Cloud

**Step 4:** Click on the New Project then within R Studio Cloud 

**Step 5:** Click on New Project from Git Repository 

**Step 6:** Paste https://github.com/gato365/learningAboutGitHub.git where it says "URL for your Git Repository" Click OK


### 4. Some Terminology we should be aware of:

**Commit** - a snapshot of your repository at a specific point in time in your coding process

**Push** - post snapshot on GitHub

#### Not discussed in post
**Pull** - used to gather and download material within a repo from a remote repo and immediately update the local repo to match the material

**Fork** - a copy of a repository that you manage without modifying the original repo


### 5. Commiting and Pushing your First File to GitHub

**Step 1:** Create a R markdown file and delete content 
for fun: create a histogram of mpg from the mtcars data frame 

**Step 2:** Save the file as test_markdown 

**Step 3:** Click on the Git Symbol in the middle of the screen 

**Step 4:** Click Commit... 

**Step 5:** Click on the boxes under the *Staged*

**Step 6:** Type notes on what you did in the box titled *Commit Message*

**Step 7:** Click commit press *OK* then click *Push*

#### *The following steps are for R Studio Cloud*
**Step 8:** A screen will pop-up and you should type your login username for GitHub and Click *OK*

*We need to go back to GitHub to get*
More steps: 

- Click Settings under your profile
- Click Developer settings (bottom on the left of Screen) 
- Click on Personal access tokens
- Click Generate new token 
- Type 'personal key for R Studio' or something relating to what you are doing with github and R Studio
- Set Expiration Date (three months)
- Click the repo check box (there are many others but this is the only one needed for our purposes)
- Click Generate Token
- Copy token save in a good location within a text file on your computer

**Step 9:** Copy and paste token in the box for the password and Click *OK*

**Step 10:** Go to GitHub and go to your Repo Folder (Under Profile, Click Repositories), your file should be there

There is a more technical way to do this using the terminal but I will not cover this here.


### Check the Power of GitHub
**Step 1:** Now erase the code in R Studio that you made for the histogram and create a scatter plot between mpg and wt within mtcars

**Step 2:** Save the file and follow the process to commit and push (you do not have to generate a new token, you can use it for the specified time) 

**Step 3:** Now click on *History* and you can see both versions of the code you created




Additional Resources:

- Commit -- https://www.gitkraken.com/learn/git/commit
- Pull -- https://www.atlassian.com/git/tutorials/syncing/git-pull
- Generate GitHub Tokens -- https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
- Fork -- https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/about-forks





