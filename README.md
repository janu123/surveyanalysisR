
<!-- README.md is generated from README.Rmd. Please edit that file -->
surveyanalysisR
===============

<!-- badges: start -->
[![R build status](https://github.com/janu123/surveyanalysisR/workflows/R-CMD-check/badge.svg)](https://github.com/janu123/surveyanalysisR/actions) <!-- badges: end -->

The goal of surveyanalysisR package is to analyse the market research survey data

As an example lets see the survey responses by gender and age group

``` r
library(surveyanalysisR)
library(scales)
survey1<-factored_demo %>%
  group_by(s_gender,s_age)%>%
  summarise(count=n())
ggplot(data=survey1, aes(x=s_age, fill=s_gender)) +scale_fill_brewer(palette="Set1",  na.value = "gray")+
  geom_bar(data=filter(survey1, s_gender=="Female"), aes(y=count), stat="identity") + 
  geom_bar(data=filter(survey1, s_gender=="Male"), aes(y=count*(-1)), stat="identity") +
  scale_y_continuous(breaks=seq(-600, 600, 100), 
                     labels=comma(abs(seq(-600, 600, 100)))) + 
  labs(x="Age", y="count", title="Survey responses by Age Groups") +
  coord_flip() +
  theme_bw()
```

![](README_files/figure-markdown_github/unnamed-chunk-2-1.png)
