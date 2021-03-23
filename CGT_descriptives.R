## Descriptives for CGT as a whole
library(dplyr)

# Overall demographics for serum CRP data (age mean and SD, age range, %F)
# 881 total observations
mean(serum$AgeFaceToFace, na.rm = TRUE)
sd(serum$AgeFaceToFace, na.rm = TRUE)
range(serum$AgeFaceToFace, na.rm = TRUE)
sum(serum$Sex == "F", na.rm = TRUE)
sum(serum$Sex == "M", na.rm = TRUE)
table(serum$Sex) / length(serum$Sex)


# Overall demographics for DNAm CRP data (age mean and sd, age range, %F)
# 600 total observations
count(mDNA)
mean(mDNA$AgeFaceToFace, na.rm = TRUE)
sd(mDNA$AgeFaceToFace, na.rm = TRUE)
range(mDNA$AgeFaceToFace, na.rm = TRUE)
sum(mDNA$Sex == "F", na.rm = TRUE)
sum(mDNA$Sex == "M", na.rm = TRUE)
table(mDNA$Sex) / length(mDNA$Sex)

# Overall race demos
count(ids)
count(ids, race)
table(ids$race) / length(ids$race)
table(ids$nationality) / length(ids$nationality)


## Descriptives by serum CRP Status

# Age, by serum CRP status (mean and SD, Wilcoxon T-Test)
mean(serum$AgeFaceToFace, na.rm = TRUE)
sd(serum$AgeFaceToFace, na.rm = TRUE)
aggregate(serum$AgeFaceToFace, by = list(serum$CRPStatus), FUN = mean, na.rm = TRUE)
aggregate(serum$AgeFaceToFace, by = list(serum$CRPStatus), FUN = sd, na.rm = TRUE)
#aggregate(serum$AgeFaceToFace, by = list(serum$CRPStatus), FUN = median, na.rm = TRUE)
#aggregate(serum$AgeFaceToFace, by = list(serum$CRPStatus), FUN = IQR, na.rm = TRUE)
wilcox.test(AgeFaceToFace ~ CRPStatus, data = serum)

# Sex, by serum CRP status (n and % F, chi squared)
library(dplyr)
sum(serum$Sex == "F", na.rm = TRUE)
sum(serum$Sex == "M", na.rm = TRUE)
table(serum$Sex) / length(serum$Sex)
sum(serum$Sex == "F")
count(serum, serum$Sex, serum$CRPStatus)
pc <- function(x) {table(x)/length(x)}
aggregate(serum$Sex, by = list(serum$CRPStatus), FUN = pc)
chisq.test(serum$Sex, serum$CRPStatus)

# BMI, by serum CRP status (Mean, SD)
mean(serum$BMI, na.rm = TRUE)
sd(serum$BMI, na.rm = TRUE)
aggregate(serum$BMI, by = list(serum$CRPStatus), FUN = mean, na.rm = TRUE)
aggregate(serum$BMI, by = list(serum$CRPStatus), FUN = sd, na.rm = TRUE)
wilcox.test(BMI ~ CRPStatus, data = serum)

# Lifetime MDD status, by serum CRP status (n)
count(serum, serum$LifetimeMDD)
count(serum, serum$LifetimeMDD, serum$CRPStatus)

# Total QIDS, by serum CRP status (mean and SD, Wilcoxon T-Test)
mean(serum$TotalQIDS, na.rm = TRUE)
sd(serum$TotalQIDS, na.rm = TRUE)
aggregate(serum$TotalQIDS, by = list(serum$CRPStatus), FUN = mean, na.rm = TRUE)
aggregate(serum$TotalQIDS, by = list(serum$CRPStatus), FUN = sd, na.rm = TRUE)
#aggregate(serum$TotalQIDS, by = list(serum$CRPStatus), FUN = median, na.rm = TRUE)
#aggregate(serum$TotalQIDS, by = list(serum$CRPStatus), FUN = IQR, na.rm = TRUE)
wilcox.test(TotalQIDS ~ CRPStatus, data = serum)


## n/analyses
summary(CGT_serum)
summary(CGT_mDNA)
count(CGT_serum, CGT_serum$CRPStatus)

summary(fMRI_serum)
summary(fMRI_mDNA)
count(fMRI_serum, CRPStatus)



## Affective cognition descriptive statistics - N, mean, sd, one-way anova p all by CRP status

## CGT-Win
sum(CGT_serum$CRPStatus == "0", na.rm = TRUE)
sum(CGT_serum$CRPStatus == "1", na.rm = TRUE)
aggregate(CGT_serum$RiskAdjustment_WIN, by = list(CGT_serum$CRPStatus), FUN = mean, na.rm = TRUE)
aggregate(CGT_serum$RiskAdjustment_WIN, by = list(CGT_serum$CRPStatus), FUN = sd, na.rm = TRUE)
res.aov <- aov(RiskAdjustment_WIN ~ CRPStatus, data = CGT_serum)
summary(res.aov)
rm(res.aov)

## CGT-Loss
sum(CGT_serum$CRPStatus == "0", na.rm = TRUE)
sum(CGT_serum$CRPStatus == "1", na.rm = TRUE)
aggregate(CGT_serum$RiskAdjustment_LOSS, by = list(CGT_serum$CRPStatus), FUN = mean, na.rm = TRUE)
aggregate(CGT_serum$RiskAdjustment_LOSS, by = list(CGT_serum$CRPStatus), FUN = sd, na.rm = TRUE)
res.aov <- aov(RiskAdjustment_LOSS ~ CRPStatus, data = CGT_serum)
summary(res.aov)
rm(res.aov)