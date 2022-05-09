---
title: Preparing for Mr. Morale & the Big Steppers...Kendrick's New Album
author: ''
date: '2022-04-26'
slug: preparing-for-mr-morale-the-big-steppers
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2022-04-26T18:37:00Z'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---



```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
```

```
## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
## ✓ tibble  3.1.6     ✓ dplyr   1.0.8
## ✓ tidyr   1.2.0     ✓ stringr 1.4.0
## ✓ readr   2.1.2     ✓ forcats 0.5.1
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(spotifyr)
library(scales)
```

```
## 
## Attaching package: 'scales'
```

```
## The following object is masked from 'package:purrr':
## 
##     discard
```

```
## The following object is masked from 'package:readr':
## 
##     col_factor
```

```r
access_token <- get_spotify_access_token()
```



### Step 1: Extract the Data

```r
kl_df <- get_artist_audio_features('kendrick lamar') 
```
