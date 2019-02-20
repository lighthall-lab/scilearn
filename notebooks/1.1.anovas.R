#install.packages("car")

# Using `car` library for Anova() which allows Type III SumSq tests
library(car)
#library(sjstats)

# Read the data
data <- read.csv('../derivatives/20190218/all_subject_level_bound.csv')

# Set factors
data$AgeGroup <- as.factor(data$AgeGroup)
data$Condition <- as.factor(data$Condition)

# Map descriptors to categoricals
levels(data$Condition) <- list("Annotated"=1,"Video"=2,"Original"=3)
levels(data$AgeGroup) <- list("YA"=1,"OA"=2)
levels(data$Gender) <- list("Male"=1,"Female"=2)

# Set the contrasts for type III sum of squares
options(contrasts = c("contr.sum", "contr.poly"))
options("contrasts")

# Two-way AgeGroup x Condition ANOVA on comprehension delta
fit <- lm(comp_change_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on comprehension at T1
fit <- lm(comp_t1_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on comprehension at T2
fit <- lm(comp_t2_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on n-back reaction time
fit <- lm(nb_RT_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on n-back corrected recognition
fit <- lm(nb_CoR_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)



# Two-way AgeGroup x Condition ANOVA on processing speed reaction time
fit <- lm(procspd_RT_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Sampling Error Check: Processing Speed
oa_data <- subset(data, AgeGroup == 'OA')
fit <- lm(procspd_RT_bound ~ Condition, data = oa_data)
Anova(fit, type=3)



# Two-way AgeGroup x Condition ANOVA on vocabulary score
fit <- lm(vocab_sum_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on Need for Cognition score
fit <- lm(NFCS_sum_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on Trust in Science/Scientists score
fit <- lm(TSSI_sum_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on Science Attitudes subscale-A
fit <- lm(SciTudeA_sum_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on Science Attitudes subscale-L
fit <- lm(SciTudeL_sum_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on Science Attitudes subscale-s
fit <- lm(SciTudeS_sum_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)

# Two-way AgeGroup x Condition ANOVA on Science Literacy
fit <- lm(SciLit_sum_bound ~ AgeGroup * Condition, data)
Anova(fit, type=3)
#eta_sq(fit)
