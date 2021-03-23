# Load packages
library(dplyr)

# Overall demographics for fMRI data
mean(fMRI$Demo_age, na.rm = TRUE)
sd(fMRI$Demo_age, na.rm = TRUE)
range(fMRI$Demo_age, na.rm = TRUE)
sum(fMRI$Demo_sex == "F", na.rm = TRUE)
sum(fMRI$Demo_sex == "M", na.rm = TRUE)
table(fMRI$Demo_sex) / length(fMRI$Demo_sex)

# Other interesting demographics
count(fMRI_epsi_serum)
count(fMRI_epsi_serum, Race)
count(fMRI_epsi_mDNA)
count(fMRI_epsi_mDNA, Race)

