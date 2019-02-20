
setwd('\\\\net1110.net.ucf.edu/research2/lighthall_lab/experiments/scilearn/code')

data <- read.csv('../derivatives/20190218/all_subject_level_bound.csv')

data$AgeGroup <- as.factor(data$AgeGroup)


# Between-Groups MLR models (All)

# comp_change (All)
fit <- lm(comp_change ~
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=data)
summary(fit)

# comp_t1 (All)
fit <- lm(comp_t1 ~ 
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=data)
summary(fit)

# comp_t2 (All)
fit <- lm(comp_t2 ~
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=data)
summary(fit)



# Within-Groups Models (OA)
oa_data = subset(data, AgeGroup == 'OA')

# comp_change (OA)
fit <- lm(comp_change ~
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=oa_data)
summary(fit)

# comp_t1 (OA)
fit <- lm(comp_t1 ~ 
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=oa_data)
summary(fit)

# comp_t2 (OA)
fit <- lm(comp_t2 ~
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=oa_data)
summary(fit)


# Within-Groups Models (YA)
ya_data = subset(data, AgeGroup == 'YA')

# comp_change (YA)
fit <- lm(comp_change ~
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=ya_data)
summary(fit)

# comp_t1 (YA)
fit <- lm(comp_t1 ~ 
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=ya_data)
summary(fit)

# comp_t2 (YA)
fit <- lm(comp_t2 ~
            nb_RT_bound + procspd_RT_bound + 
            NFCS_sum_bound + TSSI_sum_bound + 
            vocab_sum_bound + SciLit_sum_bound,
          data=ya_data)
summary(fit)