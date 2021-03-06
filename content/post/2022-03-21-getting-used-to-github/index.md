---
title: Getting Used to GitHub
author: 'Immanuel Williams PhD'
date: '2022-03-21'
slug: getting-used-to-github
categories: []
tags: [data science, github]
subtitle: ''
summary: 'It is always good use version control.'
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


**Step 7:** Click on the Terminal on one of the panes
Type the following information with your credentials:

- git config --global user.name "YOUR FULL NAME"

- git config --global user.email "YOUR EMAIL ADDRESS"


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
- Type personal key for R Studio' or something relating to what you are doing with github and R Studio
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


### 
If you ever need to go back to a previous version of your code for some reason based on your actions, you must revert or back track. There are many reasons why you need a previous version of code, go [here](https://sethrobertson.github.io/GitFixUm/fixup.html) to determine what to do based on your reason. If you use the website above, it will ask you a series of question which will guide through the code you must run to get your code back into shape.

I wanted to get my code into a version that I recently committed and these were the questions and answers that I had to answer:

Q1: Have you committed?

Ans 1: Yes, commits were made → 

Q2: Do you have uncommitted stuff in your working directory?

Ans 2: No, I have no changes/working directory is clean → 

Q3: Have you committed?

Ans 3: Yes, commits were made → 


Q4: Have you pushed?

Ans 4: Yes, pushes were made → 

Q5: Can you make a positive commit to fix the problem and what is the fix class?

Ans 5: Yes, I can make a new commit but the bad commit is a simple commit I want to totally remove


Use the following code to revert within the terminal:


git revert SHA 

SHA is a hash ID that is assigned to each commit that is made

To find the hash ID that corresponds to the version of the code your would like to restore, *click the Git* button. Then *click* History. 

A list of your commits will appear and on the last column denotes the SHA for each commit. You can scroll down to find a version of your code that you would like.


Additional Resources:

- Commit -- https://www.gitkraken.com/learn/git/commit
- Pull -- https://www.atlassian.com/git/tutorials/syncing/git-pull
- Generate GitHub Tokens -- https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
- Fork -- https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/about-forks
- Revert - https://r-pkgs.org/git.html, more details https://sethrobertson.github.io/GitFixUm/fixup.html





