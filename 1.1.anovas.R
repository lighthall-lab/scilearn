library('sjstats')
scilearn <- read.csv(file('../derivatives/0.4.joined/all_subject_level.csv'))

scilearn$Condition <- as.factor(scilearn$Condition)
scilearn$AgeGroup <- as.factor(scilearn$AgeGroup)
scilearn$SciGroup <- as.factor(scilearn$SciGroup)

fit <- aov(nb_RT ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(nb_CoR ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(procspd_RT ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(vocab_sum ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(TSSI_sum ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(NFCS_sum ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(SciLit_sum ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(SciTude_sum ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(comp_t1 ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(comp_change ~ AgeGroup, scilearn)
summary(fit)
eta_sq(fit)

fit <- aov(comp_change ~ Condition, scilearn)
summary(fit)
eta_sq(fit)
TukeyHSD(fit)

fit <- aov(comp_change ~ AgeGroup+Condition, scilearn)
summary(fit)
eta_sq(fit)
TukeyHSD(fit)

fit <- aov(comp_change ~ SciGroup, scilearn)
summary(fit)
eta_sq(fit)
TukeyHSD(fit)
