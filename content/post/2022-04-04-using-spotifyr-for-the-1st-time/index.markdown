---
title: Using spotifyr for the 1st time...
author: ''
date: '2022-04-04'
slug: using-spotifyr-for-the-1st-time
categories: []
tags: [spotifyr, tidyverse, kanye west]
subtitle: 'Learning how to use spotifyr'
summary: ''
authors: []
lastmod: '2022-04-04T03:14:47Z'
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






**Step 1:** Go [here](https://developer.spotify.com/dashboard/login) to find your ID and SECRET. You will have to log in using your Spotify information. Remember do save this information in the cloud, store on your laptop

**Step 2:** Install spotifyr by running the following code:


```r
install.packages('spotifyr')
```


**Step 3:** You will have to run this with your ID and SECRET


```r
library(tidyverse)
library(spotifyr)
library(lubridate)
library(scales)
library(kableExtra)
library(secret)

access_token <- get_spotify_access_token()
```



There are many things that you can do with *spotifyr*. I will provide a few 
examples but if you want more information go to the following [website](https://www.rdocumentation.org/packages/spotifyr/versions/2.1.1), look through page as well as towards the bottom that explains all the functions you now have access to.


## What can be done?
My next 3 posts of will be using these functions from *spotifyr* so that you all can have some ideas about potential hurdles.


### 1. Explore an artist
I love Old Kanye West and I try to understand New "Ye". So lets look at (analyze) his songs using the **get_artist_audio_features()** function.





```r
kanye_west_df <- get_artist_audio_features('kanye west') 
```
It takes a while because he has a lot of songs!

There are 39 variables that include various songs metrics such as:

- danceability 
- energy
- key
- loudness
- mode
- speechiness
- acousticness
- instrumentalness             
- liveness 
- valence
- tempo

Spotify has various ways of measuring some of these variables and this [website](https://www.theverge.com/tldr/2018/2/5/16974194/spotify-recommendation-algorithm-playlist-hack-nelson) does a decent job of explaining these variables.

There are other variables that identify the song and album, you can spend 
sometime using this information to understand some of your artists. 

Other important variables include:

- duration_ms: duration in milliseconds
- explicit: TRUE or FALSE if there explicit language (a good variable to look into)
- album_release_date and album_release_year: when songs are released to the public
- track_name: the most important, is the name of the song

There are other worthwhile variables to look into but these stick out the most to me. 


## One thing to note (important)

There are some songs that are duplicated and there are many reasons why this can happen. One reason relates to various artists, according to the [community page](https://community.spotify.com/t5/iOS-iPhone-iPad/Duplicates-of-the-same-albums/td-p/4542505) for Spotify, there seems to be an issue with artists reloading their music. Other reasons are include:

- two versions of a song can occur because one version is clean and the other is explicit


```r
kanye_west_df %>% 
  filter(track_name == 'Jesus Walks') %>% 
  select(track_name,explicit) %>% 
  kable() %>% 
  kable_styling(position = 'center')
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> track_name </th>
   <th style="text-align:left;"> explicit </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Jesus Walks </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Jesus Walks </td>
   <td style="text-align:left;"> FALSE </td>
  </tr>
</tbody>
</table>

- different versions of the same song because some countries wont allow certain versions of a song 

```r
kanye_west_df %>% 
  filter(track_name == 'Addiction') %>% 
  select(track_name,explicit,available_markets)
```

```
##   track_name explicit
## 1  Addiction     TRUE
## 2  Addiction    FALSE
## 3  Addiction     TRUE
##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            available_markets
## 1     AD, AE, AG, AL, AM, AO, AR, AT, AU, AZ, BA, BB, BD, BE, BF, BG, BH, BI, BJ, BN, BO, BR, BS, BT, BW, BY, BZ, CA, CD, CG, CH, CI, CL, CM, CO, CR, CV, CW, CY, CZ, DE, DJ, DK, DM, DO, DZ, EC, EE, EG, ES, FI, FJ, FM, FR, GA, GD, GE, GH, GM, GN, GQ, GR, GT, GW, GY, HK, HN, HR, HT, HU, ID, IL, IN, IQ, IS, IT, JM, JO, JP, KE, KG, KH, KI, KM, KN, KR, KW, KZ, LA, LB, LC, LI, LK, LR, LS, LT, LU, LV, LY, MA, MC, MD, ME, MG, MH, MK, ML, MN, MO, MR, MT, MU, MV, MW, MX, MY, MZ, NA, NE, NG, NI, NL, NO, NP, NR, NZ, OM, PA, PE, PG, PH, PK, PL, PS, PT, PW, PY, QA, RO, RS, RU, RW, SA, SB, SC, SE, SG, SI, SK, SL, SM, SN, SR, ST, SV, SZ, TD, TG, TH, TJ, TL, TN, TO, TR, TT, TV, TW, TZ, UA, UG, US, UY, UZ, VC, VE, VN, VU, WS, XK, ZA, ZM, ZW
## 2 AD, AE, AG, AL, AM, AO, AR, AT, AU, AZ, BA, BB, BD, BE, BF, BG, BH, BI, BJ, BN, BO, BR, BS, BT, BW, BY, BZ, CD, CG, CH, CI, CL, CM, CO, CR, CV, CW, CY, CZ, DE, DJ, DK, DM, DO, DZ, EC, EE, EG, ES, FI, FJ, FM, FR, GA, GB, GD, GE, GH, GM, GN, GQ, GR, GT, GW, GY, HK, HN, HR, HT, HU, ID, IE, IL, IN, IQ, IS, IT, JM, JO, JP, KE, KG, KH, KI, KM, KN, KR, KW, KZ, LA, LB, LC, LI, LK, LR, LS, LT, LU, LV, LY, MA, MC, MD, ME, MG, MH, MK, ML, MN, MO, MR, MT, MU, MV, MW, MX, MY, MZ, NA, NE, NG, NI, NL, NO, NP, NR, NZ, OM, PA, PE, PG, PH, PK, PL, PS, PT, PW, PY, QA, RO, RS, RU, RW, SA, SB, SC, SE, SG, SI, SK, SL, SM, SN, SR, ST, SV, SZ, TD, TG, TH, TJ, TL, TN, TO, TR, TT, TV, TW, TZ, UA, UG, US, UY, UZ, VC, VE, VN, VU, WS, XK, ZA, ZM, ZW
## 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     GB, IE
```


You can just arbitrarily remove variables based on the track name using the *distinct()* function but duplicates can still occur.

```r
kw_df = kanye_west_df %>% 
  distinct(track_name, .keep_all = TRUE) ## keep_all, keeps all variable

kw_df %>% 
  filter(str_detect(track_name,'All Of The Lights' )) %>% 
  select(track_name) %>% 
  kable() %>% 
  kable_styling(position = 'center')
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> track_name </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> All Of The Lights (Interlude) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> All Of The Lights </td>
  </tr>
  <tr>
   <td style="text-align:left;"> All Of The Lights (Interlude) - Album Version (Edited) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> All Of The Lights - Album Version (Edited) </td>
  </tr>
</tbody>
</table>



We are going to explore old Kanye's Top 21 hits from this top 40 list from this  [post](https://www.highsnobiety.com/p/best-kanye-west-songs/). I do not necessarily agree with this list but we will analyze it anyway.



```r
top_21_songs = c('All Of The Lights',
                 'Diamonds From Sierra Leone','Ultralight Beam','All Falls Down',
                 'New Slaves','Monster','Black Skinhead',
                 'Slow Jamz','POWER','Touch The Sky',
                 'Ni**as In Paris','Can\'t Tell Me Nothing','Stronger',
                 'Heartless','Devil In A New Dress','Through The Wire',
                 'Gold Digger','Blood On The Leaves','Jesus Walks',
                 'Flashing Lights','Runaway')
```

## Time to clean


```r
kw_songs_df = kanye_west_df %>% 
  filter(track_name %in% top_21_songs) 
```

There are still duplicates!!!!!



Please notice how I did not use filter, I used distinct because it will extract the first version (row) of a track with the same name. This is problematic if I wanted a specific version of a song, i.e., only explicit song, but this is a simple blog posts. I also scaled valence so that it makes sense in that negative valence values are negative and postive valence values are positive. This variable is called *m1_valence*.

```r
mod_kw_songs_df = kw_songs_df %>% 
  distinct(track_name, .keep_all= TRUE) %>% 
  mutate(m1_valence = 2*valence - 1)
```


We can look at energey and valence of the songs but I label the axes based on the mood

```r
df = data.frame(x = c(0,1), y = c(0,1))
p1 = df %>% 
  ggplot(aes(x = x, y = y)) +
  geom_blank() +
  geom_vline(xintercept = 0,size = 1) +
  geom_hline(yintercept = 0.5,size = 1) +
  scale_x_continuous(limits = c(-1,1), 
                     expand = c(0, 0),
                     labels = label_number(accuracy = 0.1)) +
  scale_y_continuous(limits = c(0,1), expand = c(0, 0))  +
  theme_bw() +
  theme(axis.title = element_text(size = 18, face = 'bold')) +
  geom_rect(aes(xmin=-1, xmax=0, ymin=0, ymax=1),alpha = 0.15, fill = 'red') +
  geom_rect(aes(xmin=0, xmax=1, ymin=0, ymax=1),alpha = 0.15, fill = 'blue') +
  labs(x = 'Valence',y='Energy') +
  theme(axis.text = element_text(size = 12, face = 'bold'),
        plot.margin = margin(0.3, 0.5, 0.1, 0.5, "cm")
  ) +
  annotate("text", x=-0.5, y=0.25, label= "Sad",size = 15.5, color = 'white') +
  annotate("text", x=0.55, y=0.25, label= "Chill",size = 15.5, color = 'white') +
  annotate("text", x=-0.5, y=0.75, label= "Anger",size = 15.5, color = 'white') +
  annotate("text", x=0.55, y=0.75, label= "Happy",size = 15.5, color = 'white')

p1
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-11-1.png" width="672" />



Lets look at these songs with these moods:

```r
p1 +
  geom_point(data = mod_kw_songs_df,aes(x = m1_valence  , y = energy),size = 2.1) + 
  theme(legend.position = 'bottom')
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-12-1.png" width="672" />



I guess he was still angry and some and less sad and chill...

Why don't you find how 'Ye' compares.
