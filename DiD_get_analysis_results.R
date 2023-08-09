library(tidyverse)
library(ggsci)
library(ggpubr)
library(ggallin)
library(broom)
library(multcomp)

path <- "~/<your-path>/"

df_short_term_batch_2_norm <- read.csv(paste0(path,'df_short_term_batch_2_norm_first_week.csv'))
df_short_term_batch_2_norm$after_merge <-
  (df_short_term_batch_2_norm$week > df_short_term_batch_2_norm$MERGE_DATE)

df_short_term_batch_1_norm <- read.csv(paste0(path,'df_short_term_batch_1_norm_first_week.csv'))
df_short_term_batch_1_norm$after_merge <-
  (df_short_term_batch_1_norm$week > df_short_term_batch_1_norm$MERGE_DATE)


did_short_term_batch_2 <- lm(Normalized.Downloads ~ 
                               Treatment*after_merge,
                             data=df_short_term_batch_2_norm)
summary(did_short_term_batch_2)
tidy(did_short_term_batch_2, conf.int = TRUE)

confint(multcomp::glht(did_short_term_batch_2, linfct = t(c(0,0,1,1))))

ggplot(df_short_term_batch_2_norm, 
       aes(x = factor(week),  y = (1+Normalized.Downloads),
           fill = Treatment)) +
  geom_boxplot() +
  labs(x = "Week", y = "Downloads") +
  scale_fill_manual(values = c("red", "blue")) +
  theme_classic()+
  scale_y_log10()


ggplot(df_short_term_batch_1_norm, 
       aes(x = factor(week),  y = (1+Normalized.Downloads),
           fill = Treatment)) +
  geom_boxplot() +
  labs(x = "Week", y = "Downloads") +
  scale_fill_manual(values = c("red", "blue")) +
  theme_classic()+
  scale_y_log10()

did_short_term_batch_1 <- lm(Normalized.Downloads ~ 
                               Treatment*after_merge,
                             data=df_short_term_batch_1_norm)
summary(did_short_term_batch_1)
tidy(did_short_term_batch_1, conf.int = TRUE)
confint(multcomp::glht(did_short_term_batch_1, linfct = t(c(0,0,1,1))))



df_short_term_batch_1_norm <- df_short_term_batch_1_norm %>% 
  mutate(treatment_control=ifelse(Treatment=='Treatment',
                                                       'Treatment, Batch 1',
                                                       'Control'))

df_short_term_batch_2_norm <- df_short_term_batch_2_norm %>% 
  mutate(treatment_control=ifelse(Treatment=='Treatment',
                                  'Treatment, Batch 2',
                                  'Control'))

df_short_term_all_batches <- bind_rows(df_short_term_batch_1_norm, 
                                        df_short_term_batch_2_norm)
df_box_plot <- df_short_term_all_batches %>% 
  group_by(Model, after_merge, treatment_control) %>%
  summarise(mean_download = mean(Normalized.Downloads)) %>% 
  pivot_wider(
    names_from = after_merge,
    values_from = mean_download,
    names_prefix = "downloads_after_merge",
    names_sep = "_") %>%
  mutate(downloads_diff = downloads_after_mergeTRUE - 
           downloads_after_mergeFALSE)

stat.test <- compare_means(
  downloads_diff ~ treatment_control, data = df_box_plot,
  method = "wilcox.test"
)
stat.test <- stat.test %>%
  filter(!(grepl('Treatment',group1)&grepl('Treatment',group2)))%>%
  mutate(y.position = c(200, 350))
png('~/<your-path>/boxplot.png',
    width=6, height=4,res=300, unit='in')
ggplot(df_box_plot, 
       aes(x = (treatment_control),  y = (downloads_diff))) +
  geom_boxplot(aes(fill = treatment_control)) +
  labs(x = "Week", y = "Downloads") +
  theme_classic()+
  scale_fill_nejm()+
  ylab('Changes in downloads')+
  xlab('Treatment groups')+
  guides(fill="none")+
  scale_y_continuous(breaks=c(0,50,100,200,500),
                     trans = pseudolog10_trans,
                     labels=c("0%", "50%", "100%","200%",'500%'))+
  theme_classic(base_size=14)+
  geom_text(aes(x = 1.5, y = 200, label = "p=0.30"), 
            position = position_dodge(width = 1),size=5)+
  geom_text(aes(x = 2.5, y = 380, label = "p=0.01"), 
            position = position_dodge(width = 1),size=5)+
  geom_segment(aes(x = 1, y = 150, xend = 2, yend = 150), 
               size = 0.5, color = "black")+
  geom_segment(aes(x = 1, y = 300, xend = 3, yend = 300), 
               size = 0.5, color = "black")+
  geom_segment(aes(x = 1, y = 150, xend = 1, yend = 120), 
               size = 0.5, color = "black")+
  geom_segment(aes(x = 2, y = 150, xend = 2, yend = 120), 
               size = 0.5, color = "black")+
  geom_segment(aes(x = 1, y = 300, xend = 1, yend = 250), 
               size = 0.5, color = "black")+
  geom_segment(aes(x = 3, y = 300, xend = 3, yend = 250), 
               size = 0.5, color = "black")


dev.off()