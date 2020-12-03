## Philosophy
factored_philosophy %>%
  pivot_longer(m1_philosophy_1:m1_philosophy_9, names_to = "question", values_to = "response") %>%
  ggplot(aes(x = response)) +
  geom_bar() +
  facet_wrap(vars(question), ncol = 3) +
  labs(x = "Response (on a 1 to 5 scale)", y = "Number of respondents")+theme(axis.text.x = element_text(angle = 15,hjust = 0.5, size =7))+
  scale_x_discrete(labels = function(x) str_wrap(x, width = 8))

## Awareness
factored_awareness %>%
  pivot_longer(m2_awareness_apps_1:m2_awareness_apps_14, names_to = "question", values_to = "response") %>% filter(response!="NA")%>%
  ggplot(aes(x = response)) +
  geom_bar() +
  labs(x = " ", y = "Number of respondents")+theme(axis.text.x = element_text(angle = 15,hjust = 0.5, size =7))+
  scale_x_discrete(labels = function(x) str_wrap(x, width = 8))

## Source
factored_source %>%
  pivot_longer(source_1:source_17, names_to = "question", values_to = "response") %>% filter(response!="NA")%>%
  ggplot(aes(x = response)) +
  geom_bar() +
  labs(x = " ", y = "Number of respondents")+theme(axis.text.x = element_text(angle = 15,hjust = 0.5, size =7))+
  scale_x_discrete(labels = function(x) str_wrap(x, width = 8))

## Behaviour
factored_behavior %>%
  pivot_longer(behavior_1:behavior_16, names_to = "question", values_to = "response") %>% filter(response!="NA")%>%
  ggplot(aes(x = response)) +
  geom_bar() +
  labs(x = " ", y = "Number of respondents")+theme(axis.text.x = element_text(angle = 15,hjust = 0.5, size =7))+
  scale_x_discrete(labels = function(x) str_wrap(x, width = 8))

## Other Behaviour
factored_behavior_other %>%
  pivot_longer(interst_cbt:interest_coach, names_to = "question", values_to = "response") %>% filter(response!="NA")%>%
  ggplot(aes(x = response)) +
  facet_wrap(vars(question), ncol = 3) +
  geom_bar() +
  labs(x = " ", y = "Number of respondents")+theme(axis.text.x = element_text(angle = 15,hjust = 0.5, size =7))+
  scale_x_discrete(labels = function(x) str_wrap(x, width = 8))
