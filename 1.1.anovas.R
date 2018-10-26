library(car)
library(sjstats)
data <- read.csv('../derivatives/0.4.joined/all_subject_level.csv')

data$AgeGroup <- as.factor(data$AgeGroup)
data$Condition <- as.factor(data$Condition)

levels(data$Condition) <- list("Annotated"=1,"Video"=2,"Original"=3)
levels(data$AgeGroup) <- list("YA"=1,"OA"=2)
levels(data$Gender) <- list("Male"=1,"Female"=2)

options(contrasts = c("contr.helmert","contr.poly"))
options("contrasts")

fit <- lm(comp_change ~ AgeGroup * Condition, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(comp_t1 ~ AgeGroup * Condition, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(comp_t2 ~ AgeGroup * Condition, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(nb_RT ~ AgeGroup, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(nb_CoR ~ AgeGroup, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(procspd_RT ~ AgeGroup, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(vocab_sum ~ AgeGroup, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(NFCS_sum ~ AgeGroup, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(TSSI_sum ~ AgeGroup, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(SciTude_sum ~ AgeGroup, data)
Anova(fit, type=3)
eta_sq(fit)

fit <- lm(SciLit_sum ~ AgeGroup, data)
Anova(fit, type=3)
eta_sq(fit)