library(ggplot2)
library(RColorBrewer)

## serum CRP plots with plain and precision-weighted fMRI activation, separate for MDD 0 and 1

## First, plain activation

# Prepare data
plotdata <- data.frame(as.factor(fMRI_plain_serum$CRPStatus), fMRI_plain_serum$R_hpc,
                       as.factor(fMRI_plain_serum$LifetimeMDD))
head(plotdata)
names(plotdata)[names(plotdata) == "as.factor.fMRI_plain_serum.CRPStatus."] <- "serumCRP"
names(plotdata)[names(plotdata) == "fMRI_plain_serum.R_hpc"] <- "R_hpc"
names(plotdata)[names(plotdata) == "as.factor.fMRI_plain_serum.LifetimeMDD."] <- "MDD"
plotdata <- na.omit(plotdata)
head(plotdata)

# Plot data
Rhpc <- ggplot(data = plotdata, aes(x = serumCRP, y = R_hpc, fill = MDD)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.5) +
  geom_point(aes(group = MDD), alpha = 0.5, size = 0.5, position = position_dodge(1), show.legend = FALSE) + 
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "Serum CRP Status", y = "R-hpc Activation (Plain)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-5.5, 8))
Rhpc

ggsave("Exp_MDD_serum_Rhpc_plain.jpg", width = 6, height = 6)



## Next, epsi activation

# Prepare data
plotdata <- data.frame(as.factor(fMRI_epsi_serum$CRPStatus), fMRI_epsi_serum$ACC, fMRI_epsi_serum$VTA,
                       fMRI_epsi_serum$L_antThal, as.factor(fMRI_epsi_serum$LifetimeMDD))
head(plotdata)
names(plotdata)[names(plotdata) == "as.factor.fMRI_epsi_serum.CRPStatus."] <- "serumCRP"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.ACC"] <- "ACC"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.VTA"] <- "VTA"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.L_antThal"] <- "antThal"
names(plotdata)[names(plotdata) == "as.factor.fMRI_epsi_serum.LifetimeMDD."] <- "MDD"
plotdata <- na.omit(plotdata)
head(plotdata)

# Plot data
ACC <- ggplot(data = plotdata, aes(x = serumCRP, y = ACC, fill = MDD)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.5) +
  geom_point(aes(group = MDD), alpha = 0.5, size = 0.5, position = position_dodge(1), show.legend = FALSE) + 
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "Serum CRP Status", y = "ACC Activation (Precision-Weighted)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-150, 180))
ACC

ggsave("Exp_MDD_serum_ACC_epsi.jpg", width = 6, height = 6)

VTA <- ggplot(data = plotdata, aes(x = serumCRP, y = VTA, fill = MDD)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.5) +
  geom_point(aes(group = MDD), alpha = 0.5, size = 0.5, position = position_dodge(1), show.legend = FALSE) + 
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "Serum CRP Status", y = "VTA Activation (Precision-Weighted)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-150, 180))
VTA

ggsave("Exp_MDD_serum_VTA_epsi.jpg", width = 6, height = 6)

antThal <- ggplot(data = plotdata, aes(x = serumCRP, y = antThal, fill = MDD)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.5) +
  geom_point(aes(group = MDD), alpha = 0.5, size = 0.5, position = position_dodge(1), show.legend = FALSE) + 
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "Serum CRP Status", y = "L-antThal Activation (Precision-Weighted)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-150, 180))
antThal

ggsave("Exp_MDD_serum_antThal_epsi.jpg", width = 6, height = 6)




## serum CRP plots with R-amygdala and L SN precision-weighted fMRI activation, separate for MDD 0 and 1

# Prepare data

plotdata <- data.frame(as.factor(fMRI_epsi_serum$CRPStatus), fMRI_epsi_serum$R_amyg, fMRI_epsi_serum$L_amyg,
                       fMRI_epsi_serum$L_SN, as.factor(fMRI_epsi_serum$LifetimeMDD))
head(plotdata)
names(plotdata)[names(plotdata) == "as.factor.fMRI_epsi_serum.CRPStatus."] <- "serumCRP"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.R_amyg"] <- "Ramyg"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.L_amyg"] <- "Lamyg"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.L_SN"] <- "SN"
names(plotdata)[names(plotdata) == "as.factor.fMRI_epsi_serum.LifetimeMDD."] <- "MDD"
plotdata <- na.omit(plotdata)
head(plotdata)

# Plot data

Ramyg <- ggplot(data = plotdata, aes(x = serumCRP, y = Ramyg, fill = MDD)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.5) +
  geom_point(aes(group = MDD), alpha = 0.5, size = 0.5, position = position_dodge(1), show.legend = FALSE) + 
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "Serum CRP Status", y = "R-amyg Activation (Precision-Weighted)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-150, 180))
Ramyg

ggsave("Exp_MDD_serum_Ramyg_epsi.jpg", width = 6, height = 6)

SN <- ggplot(data = plotdata, aes(x = serumCRP, y = SN, fill = MDD)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.5) +
  geom_point(aes(group = MDD), alpha = 0.5, size = 0.5, position = position_dodge(1), show.legend = FALSE) + 
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "Serum CRP Status", y = "L-SN Activation (Precision-Weighted)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-150, 180))
SN

ggsave("Exp_MDD_serum_SN_epsi.jpg", width = 6, height = 6)



