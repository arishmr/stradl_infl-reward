## Main regression analyses - associations between serum and DNAm CRP status and main key contrasts for brain regions

# Load packages
library(dplyr)

# Read in your dataset e.g. BERT data
data = fMRI_epsi_mDNA

# Reorder dataset to f.eid, behavioural columns, covariate columns, factor columns 
# to select columns run colnames(data)
# IMPORTANT: THE ID column must be changed to f.eid or the pipeline won't work
colnames(fMRI_epsi_mDNA)
data = data[,c(1:22)] #select columns in your dataset


# ANALYSIS
#============================================================================================
#Linear Model
# ID|| factors || dependent variables || covariates
# select the relevant columns in your dataset and input to model

dat_sub= data
targetdata_long= NA

colnames(fMRI_epsi_mDNA)
targetdata_short = dat_sub[,c(1, # f.eid
                              2, # factor (e.g. serum CRP status)
                              3,14,4,6,5,8,7,13,12,10,9,11, # dependent variables- BERT, CGT or FAGN summary measure
                              15:16)]    # covariates- age, sex, site, BMI 
no_fvar_long = NA
no_fvar_short = 1 # how many factors you want to test & included in the short-format data e.g here it is 1- serum CRP but you can run multiple factors
no_dvar_long = NA
no_dvar_short = 12  # how many dependent vars included in the short-format data e.g. 1 for BERT summary measure
vinteraction = F  #if you want to look at interaction effects change to T and the first covariate will be included as an interaction term
no_invar_long = 1
no_invar_short = NA

# the long format columns are NA as these are relevant to imaging data

#=====================================================================================
source('UKB_lme_reg.R') #change to the location you keep this file or have it in the same WD
library(nlme)
result.temp = UKB_lme_reg(targetdata_long,targetdata_short,
                          no_fvar_long, no_fvar_short, no_dvar_long, no_dvar_short,
                          vinteraction,1)
View(result.temp)
write.csv(result.temp, "results-DNAm_fMRI_epsi_glm.csv") #save results as .csv file

#Remove extraneous elements in the environment
rm(result.temp)
rm(targetdata_short, dat_sub, data)
rm(no_dvar_long, no_dvar_short, no_fvar_long, no_fvar_short,
   no_invar_long, no_invar_short, targetdata_long, vinteraction)


## Errors- wrong model- check the column numbers are right in the model/ dependent variable numbers
## You would run this separately for each summary hot cognition measure as you're not FDR correcting over them all