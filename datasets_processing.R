## Merge behavioural reward and inflammation datasets and reorder columns to: f.eid, factors, covariates, response variables
# CGT
merge1 <- merge(CGT, serum,  by = "f.eid", all.x = FALSE, all.y = FALSE)
merge2 <- merge(merge1, demos, by = "f.eid", all.x = F, all.y = F)
merge3 <- merge(merge2, alcohol, by = "f.eid", all.x = F, all.y = F)
colnames(merge3)
CGT_serum <- merge3[, c(1,
                        37, 36,
                        39, 38, 40, 41,
                        17, 33,
                        68, 69, 70, 71, 42)]
names(CGT_serum)[names(CGT_serum) == "AlcUnitsWeek"] <- "AlcoholWeek"
names(CGT_serum)[names(CGT_serum) == "AlcUnitsYest"] <- "AlcoholYesterday"
names(CGT_serum)[names(CGT_serum) == "Cigarettes"] <- "Cigarettes"
colnames(CGT_serum)
rm(merge1, merge2, merge3)

merge1 <- merge(CGT, mDNA,  by = "f.eid", all.x = FALSE, all.y = FALSE)
merge2 <- merge(merge1, demos, by = "f.eid", all.x = F, all.y = F)
merge3 <- merge(merge2, alcohol, by = "f.eid", all.x = F, all.y = F)
colnames(merge3)
CGT_mDNA <- merge3[, c(1,
                       55,
                       60, 61, 57, 62, 40, 58,
                       17, 33,
                       63, 89, 90, 91, 92, 100)]
names(CGT_mDNA)[names(CGT_mDNA) == "ever_smoke"] <- "Smoking"
names(CGT_mDNA)[names(CGT_mDNA) == "AlcUnitsWeek"] <- "AlcoholWeek"
names(CGT_mDNA)[names(CGT_mDNA) == "AlcUnitsYest"] <- "AlcoholYesterday"
names(CGT_mDNA)[names(CGT_mDNA) == "Cigarettes"] <- "Cigarettes"
colnames(CGT_mDNA)
rm(merge1, merge2, merge3)
write.csv(CGT_serum, "CGT_serum.csv")
write.csv(CGT_mDNA, "CGT_mDNA.csv")



## Merge imaging reward and inflammation datasets and reorder columns to: f.eid, factors, response variables, covariates
# fMRI_epsi
merge1 <- merge(fMRI_epsi, serum,  by = "f.eid", all.x = FALSE, all.y = FALSE)
merge2 <- merge(fMRI_epsi, mDNA,  by = "f.eid", all.x = FALSE, all.y = FALSE)
colnames(merge1)
colnames(merge2)
fMRI_epsi_serum <- merge1[, c(1,
                         273, 272,
                         232, 235, 238, 241, 244, 247, 253, 256, 259, 262, 265, 268,
                         274, 50,
                         48, 49, 62, 278)]
fMRI_epsi_mDNA <- merge2[, c(1,
                        291,
                        232, 235, 238, 241, 244, 247, 253, 256, 259, 262, 265, 268,
                        293, 276, 294,
                        48, 49, 50, 62, 299)]
colnames(fMRI_epsi_serum)
colnames(fMRI_epsi_mDNA)
# Editing column names
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Demo_race"] <- "Race"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Demo_AlcUnitsWeek"] <- "AlcoholWeek"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Demo_AlcUnitsYest"] <- "AlcoholYesterday"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Demo_Cigarettes"] <- "Cigarettes"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_ACC_Out_epsi_choice100100min0"] <- "ACC"
#names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_MCC_Out_epsi_choice100100min0"] <- "MCC"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_VTA_Out_epsi_choice100100min0"] <- "VTA"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_L_antInsIFG_Out_epsi_choice100100min0"] <- "L_antInsIFG"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_R_antInsIFG_Out_epsi_choice100100min0"] <- "R_antInsIFG"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_L_amygdala_Out_epsi_choice100100min0"] <- "L_amyg"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_R_amygdala_Out_epsi_choice100100min0"] <- "R_amyg"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_L_hippocampus_Out_epsi_choice100100min0"] <- "L_hpc"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_R_hippocampus_Out_epsi_choice100100min0"] <- "R_hpc"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_L_antThalamus_Out_epsi_choice100100min0"] <- "L_antThal"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_R_antThalamus_Out_epsi_choice100100min0"] <- "R_antThal"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_R_NAc_Out_epsi_choice100100min0"] <- "R_NAc"
names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_L_SN_Out_epsi_choice100100min0"] <- "L_SN"
#names(fMRI_epsi_serum)[names(fMRI_epsi_serum) == "Out_epsi_R_TPJ_Out_epsi_choice100100min0"] <- "R_TPJ"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "ever_smoke"] <- "Smoking"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Demo_AlcUnitsWeek"] <- "AlcoholWeek"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Demo_AlcUnitsYest"] <- "AlcoholYesterday"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Demo_race"] <- "Race"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Demo_Cigarettes"] <- "Cigarettes"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_ACC_Out_epsi_choice100100min0"] <- "ACC"
#names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_MCC_Out_epsi_choice100100min0"] <- "MCC"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_VTA_Out_epsi_choice100100min0"] <- "VTA"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_L_antInsIFG_Out_epsi_choice100100min0"] <- "L_antInsIFG"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_R_antInsIFG_Out_epsi_choice100100min0"] <- "R_antInsIFG"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_L_amygdala_Out_epsi_choice100100min0"] <- "L_amyg"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_R_amygdala_Out_epsi_choice100100min0"] <- "R_amyg"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_L_hippocampus_Out_epsi_choice100100min0"] <- "L_hpc"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_R_hippocampus_Out_epsi_choice100100min0"] <- "R_hpc"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_L_antThalamus_Out_epsi_choice100100min0"] <- "L_antThal"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_R_antThalamus_Out_epsi_choice100100min0"] <- "R_antThal"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_R_NAc_Out_epsi_choice100100min0"] <- "R_NAc"
names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_L_SN_Out_epsi_choice100100min0"] <- "L_SN"
#names(fMRI_epsi_mDNA)[names(fMRI_epsi_mDNA) == "Out_epsi_R_TPJ_Out_epsi_choice100100min0"] <- "R_TPJ"
colnames(fMRI_epsi_serum)
colnames(fMRI_epsi_mDNA)
rm(merge1, merge2)
# Collapsing across hemispheres - serum data
hpc <- data.frame(fMRI_epsi_serum$L_hpc, fMRI_epsi_serum$R_hpc)
fMRI_epsi_serum$hpc <- apply(hpc, 1, FUN = mean)
antInsIFG <- data.frame(fMRI_epsi_serum$L_antInsIFG, fMRI_epsi_serum$R_antInsIFG)
fMRI_epsi_serum$antInsIFG <- apply(antInsIFG, 1, FUN = mean)
antThal <- data.frame(fMRI_epsi_serum$L_antThal, fMRI_epsi_serum$R_antThal)
fMRI_epsi_serum$antThal <- apply(antThal, 1, FUN = mean)
amyg <- data.frame(fMRI_epsi_serum$L_amyg, fMRI_epsi_serum$R_amyg)
fMRI_epsi_serum$amyg <- apply(amyg, 1, FUN = mean)
colnames(fMRI_epsi_serum)
rm(hpc, antInsIFG, antThal, amyg)
# Write CSV files
write.csv(fMRI_epsi_serum, "fMRI_epsi_serum.csv")
write.csv(fMRI_epsi_mDNA, "fMRI_epsi_mDNA.csv")


## Merge imaging reward and inflammation datasets and reorder columns to: f.eid, factors, response variables, covariates
# fMRI_plain
merge1 <- merge(fMRI_plain, serum,  by = "f.eid", all.x = FALSE, all.y = FALSE)
merge2 <- merge(merge1, demos, by = "f.eid", all.x = F, all.y = F)
colnames(merge2)
fMRI_plain_serum <- merge2[, c(1,
                              8, 7,
                              2:5,
                              9,
                              13, 39:42)]
colnames(fMRI_plain_serum)
names(fMRI_plain_serum)[names(fMRI_plain_serum) == "Out_100gr0_basic_L_hippo"] <- "L_hpc"
names(fMRI_plain_serum)[names(fMRI_plain_serum) == "Out_100gr0_basic_R_hippo"] <- "R_hpc"
names(fMRI_plain_serum)[names(fMRI_plain_serum) == "Out_100gr0_basic_L_NAc"] <- "L_NAc"
names(fMRI_plain_serum)[names(fMRI_plain_serum) == "Out_100gr0_basic_R_NAc"] <- "R_NAc"
colnames(fMRI_plain_serum)
rm(merge1, merge2)
write.csv(fMRI_plain_serum, "fMRI_plain_serum.csv")

merge1 <- merge(fMRI_plain, mDNA,  by = "f.eid", all.x = FALSE, all.y = FALSE)
merge2 <- merge(merge1, demos, by = "f.eid", all.x = F, all.y = F)
colnames(merge2)
fMRI_plain_mDNA <- merge2[, c(1,
                             26,
                             2:5,
                             28, 11,
                             34, 60:63)]
colnames(fMRI_plain_mDNA)
names(fMRI_plain_mDNA)[names(fMRI_plain_mDNA) == "Out_100gr0_basic_L_hippo"] <- "L_hpc"
names(fMRI_plain_mDNA)[names(fMRI_plain_mDNA) == "Out_100gr0_basic_R_hippo"] <- "R_hpc"
names(fMRI_plain_mDNA)[names(fMRI_plain_mDNA) == "Out_100gr0_basic_L_NAc"] <- "L_NAc"
names(fMRI_plain_mDNA)[names(fMRI_plain_mDNA) == "Out_100gr0_basic_R_NAc"] <- "R_NAc"
colnames(fMRI_plain_mDNA)
rm(merge1, merge2)
write.csv(fMRI_plain_mDNA, "fMRI_plain_mDNA.csv")

## Merge IDs across STRADL and GS for race demos
ids <- merge(demos_gs, idmatch, by = "GS.id", all.x = FALSE, all.y = FALSE)
