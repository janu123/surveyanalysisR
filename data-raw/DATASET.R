## code to prepare  dataset goes here
## Data Preparation for conjoint analysis
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

## Data Prepartion for survey data analysis
survey_data<-read_sav("data-raw/survey_data.sav")
usethis::use_data(survey_data,overwrite = TRUE)

## Demographic Profile
survey_demo<- survey_data %>% select(response_id, d_urban:s_problem, d_marital:weights)
variables_with_labels = map(survey_demo, function(x) attr(x, "class") == "haven_labelled") %>% names()
factored_demo<-survey_demo %>%
  mutate_at(all_of(variables_with_labels), as_factor)
usethis::use_data(factored_demo,overwrite = TRUE)

## Philosophy
survey_philosophy <-
  survey_data %>%
  select(response_id, contains('m1_philosophy'))
variables_with_labels = map(survey_philosophy, function(x) attr(x, "class") == "haven_labelled") %>% names()
factored_philosophy<-survey_philosophy %>%
  mutate_at(all_of(variables_with_labels), as_factor)
usethis::use_data(factored_philosophy)

## Awareness
survey_awareness <-
  survey_data %>%
  select(response_id, contains('m2_awareness'))
variables_with_labels = map(survey_awareness, function(x) attr(x, "class") == "haven_labelled") %>% names()
factored_awareness<-survey_awareness %>%
  mutate_at(all_of(variables_with_labels), as_factor)
usethis::use_data(factored_awareness)

## Source
survey_source <-
  survey_data %>%
  select(response_id, contains('source'))
variables_with_labels = map(survey_source, function(x) attr(x, "class") == "haven_labelled") %>% names()
factored_source<-survey_source %>%
  mutate_at(all_of(variables_with_labels), as_factor)
usethis::use_data(factored_source)

## Behaviour
survey_behavior <-
  survey_data %>%
  select(response_id, contains('behavior'))
variables_with_labels = map(survey_behavior, function(x) attr(x, "class") == "haven_labelled") %>% names()
factored_behavior<-survey_behavior %>%
  mutate_at(all_of(variables_with_labels), as_factor)
usethis::use_data(factored_behavior)

## Other_Behavior
survey_behavior_other <-
  survey_data %>%
  select(response_id, interst_cbt:interest_coach)
variables_with_labels = map(survey_behavior_other, function(x) attr(x, "class") == "haven_labelled") %>% names()
factored_behavior_other<-survey_behavior_other %>%
  mutate_at(all_of(variables_with_labels), as_factor)
usethis::use_data(factored_behavior_other)
