# Install packages
install.packages("pwr")
library(pwr)

# Run power analysis - leave only ONE empty
# u = number of predictors (df)
# v = number of participants (df)
# f2 = effect size (0.02 is small, 0.15 is medium, 0.35 is large)
# sig.level = alpha, usually 0.05
# power = desired power, usually 0.8
power <- pwr.f2.test(u = 5, f2 = 0.08, sig.level = 0.05, power = 0.95)
power
rm(power)
# required sample size = u + v + 1

