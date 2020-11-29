
library(dplyr)
library(purrr)
library(conjoint)
head(experiment_data)
str(experiment_data)
conjoint_data<-experiment_data %>% select(duration:social_proof)
code<-caEncodedDesign(conjoint_data)
print(cor(code))
new_data<-cbind(experiment_data,code)
levels(factor(experiment_data$social_proof))
caModel(new_data[,9],new_data[,10:15])
lev<-c("12 months","3 months","6 months","give you the energy to unlock your fullest potential","help you lead a better life","help you sleep without more pills",
       "improve your health for the long-run","improve your sleep sustainably","breaking bad habits and creating new routines",
       "changing your sleep mindset","empowering you to take back your sleep habits",
       "$20/month","$30/month","$40/month",
       "a program created just for you","cognitive behavioral therapy","daily text messages from a coach","personalized, human coaching","the support of a community of people just like you","unique daily games, challenges and exercises",
       "a method that has helped thousands","leading researchers","professional athletes","scientific evidence")
lev_df<-data.frame(lev)
levels(factor(experiment_data$social_proof))
Conjoint(new_data[,9],new_data[,10:15],lev_df<-data.frame(lev))
