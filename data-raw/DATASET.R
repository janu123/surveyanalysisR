## code to prepare  dataset goes here
experiment_data<-read_sav("data-raw/experiment_data.sav")
conjoint_data<-experiment_data %>% select(duration:answer)
conjoint_data<-caEncodedDesign(conjoint_data)
lev<-c("12 months","3 months","6 months","give you the energy to unlock your fullest potential","help you lead a better life","help you sleep without more pills",
       "improve your health for the long-run","improve your sleep sustainably","breaking bad habits and creating new routines",
       "changing your sleep mindset","empowering you to take back your sleep habits",
       "$20/month","$30/month","$40/month",
       "a program created just for you","cognitive behavioral therapy","daily text messages from a coach","personalized, human coaching","the support of a community of people just like you","unique daily games, challenges and exercises",
       "a method that has helped thousands","leading researchers","professional athletes","scientific evidence")
lev_df<-data.frame(lev)
usethis::use_data(conjoint_data,overwrite = TRUE)
survey_data<-read_sav("data-raw/survey_data.sav")
usethis::use_data(survey_data,overwrite = TRUE)
survey_demo<- survey_data %>% select(response_id, d_urban:s_problem, d_marital:weights)
variables_with_labels = map(survey_demo, function(x) attr(x, "class") == "haven_labelled") %>% names()
factored_demo<-survey_demo %>%
  mutate_at(all_of(variables_with_labels), as_factor)
usethis::use_data(factored_demo,overwrite = TRUE)
