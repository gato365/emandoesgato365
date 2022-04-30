---
title: How to embed a Shiny app in blogdown
author: Antoine Soetewey
date: '2020-01-07'
slug: how-to-embed-a-shiny-app-in-blogdown
categories: []
tags:
  - Shiny
  - Web
meta_img: blog/how-to-embed-a-shiny-app-in-a-r-markdown-document_files/shiny-app-in-blogdown.jpeg
# description: Description for the page.
output:
  blogdown::html_page:
    toc: false
# draft: true
runtime: shiny
---



If you have developed and deployed a Shiny app and would like to embed it in blogdown, follow these steps:

1. create a new post as usual
1. add `runtime: shiny` (and `output: html_document` if it is not already included) in the YAML metadata
1. insert the following HTML code in the body of the post:

```
<iframe height="800" width="100%" frameborder="no" src="https://antoinesoetewey.shinyapps.io/statistics-201/"> </iframe>
```

You should change the URL with the URL of your deployed Shiny app (after `src=`, do not forget that the URL should start with `http://` or `https://` and should be surrounded by `"`). Moreover, you can modify the height, the width and include or not a frame border with the corresponding tags.

Here is an example of the result with one of my Shiny app ([link](https://antoinesoetewey.shinyapps.io/statistics-201/) to the app):

<iframe height="800" width="100%" frameborder="no" src="https://antoinesoetewey.shinyapps.io/statistics-201/"> </iframe>

<br>

*Note that the app may not work if it has hit the monthly usage limit. Try again later if that is the case.*
