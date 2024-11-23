library(survival)
recovery_times <- c(7, 11, 21, 15, 23, 8, 7, 8, 25, 6, 7, 8, 16, 18, 19, 22, 35)
censored <- c(1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0)
treatment <- c(rep(1, 9), rep(2, 8))
data <- data.frame(recovery_times, censored, treatment)
data
surv_obj <- Surv(time = data$recovery_times, event = data$censored)
fit <- survfit(surv_obj ~ treatment, data = data)
summary(fit)
plot(fit, col = c("red", "blue"), xlab = "Time to Recovery",
     ylab = "Survival Probability",
     main = "Kaplan-Meier Survival Curves: Treatment Method 1 vs 2",
     lty = 1:2,
     mark.time = TRUE)
legend("bottomleft",
       legend = c("Method 1", "Method 2"),
       col = c("red", "blue"),
       lty = 1:2)
log_rank_test <- survdiff(Surv(recovery_times, censored) ~ treatment, data = data)
log_rank_test