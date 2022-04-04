


library(dplyr)
## gpa|sport|drive to school
n = c(15,12,10,11)
groups = c('football','baseball','basketball','soccer')
mean_g = c(2.9,3.1,2.6,3.3)
sd_g = c(0.08,0.06,0.07,0.05)



rnorm(n[1],mean_g)


set.seed(236)
fb_df = data.frame(gpa = rnorm(n[1],mean_g[1],sd_g[1]),
                   drive = ifelse(rbinom(n[1],1,0.2) ==1,
                                  'drive',
                                  'bus'),
                   sport = rep(groups[1],n[1])
)

ba_df = data.frame(gpa = rnorm(n[2],mean_g[2],sd_g[2]),
                   drive = ifelse(rbinom(n[2],1,0.8) == 1,
                                  'drive',
                                  'bus'),
                   sport = rep(groups[2],n[2])
)

bb_df = data.frame(gpa = rnorm(n[3],mean_g[3],sd_g[3]),
                   drive = ifelse(rbinom(n[3],1,0.9) ==1,
                                  'drive',
                                  'bus'),
                   sport = rep(groups[3],n[3])
)

sc_df = data.frame(gpa = rnorm(n[4],mean_g[4],sd_g[4]),
                   drive = ifelse(rbinom(n[4],1,0.1) ==1,
                                  'drive',
                                  'bus'),
                   sport = rep(groups[4],n[4])
)




df = bind_rows(fb_df,sc_df,bb_df,ba_df) %>% 
  mutate(gpa = round(gpa,3))
write.csv(df,'sports.csv',row.names = FALSE)

