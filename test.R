library(survival)
library(survminer)
data(cancer)
head(cancer)
cox_model <- coxph(Surv(time, status) ~ age + sex, data = cancer)
summary(cox_model)
ggsurvplot(
  survfit(cox_model),
  data = cancer,
  xlab = "Time",
  ylab = "Survival Probability",
  title = "Cox Proportional hazard model",
  palette = "#2E9FDF",
  ggtheme = theme_minimal()
)

