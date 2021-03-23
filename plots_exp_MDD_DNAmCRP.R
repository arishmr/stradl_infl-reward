library(ggplot2)
library(RColorBrewer)

## DNAm CRP plots with CGT and L-antIns, R-amyg, hpc, L-antThal, L SN (epsi), separate for Lifetime MDD 0 and 1

## First, CGT plots

# Prepare data
plotdata <- data.frame(CGT_mDNA$DNAm_CRP_score, CGT_mDNA$RiskAdjustment_WIN,
                       CGT_mDNA$RiskAdjustment_LOSS, as.factor(CGT_mDNA$LifetimeMDD))
head(plotdata)
names(plotdata)[names(plotdata) == "CGT_mDNA.DNAm_CRP_score"] <- "DNAmCRP"
names(plotdata)[names(plotdata) == "CGT_mDNA.RiskAdjustment_WIN"] <- "RA_Win"
names(plotdata)[names(plotdata) == "CGT_mDNA.RiskAdjustment_LOSS"] <- "RA_Loss"
names(plotdata)[names(plotdata) == "as.factor.CGT_mDNA.LifetimeMDD."] <- "MDD"
plotdata <- na.omit(plotdata)
head(plotdata)

# Plot data
CGTWin <- ggplot(data = plotdata, aes(x = DNAmCRP, y = RA_Win)) +
  geom_point(aes(color = MDD), size = 0.5, show.legend = FALSE) + 
  geom_smooth(aes(fill = MDD), method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "DNAm CRP Score", y = "Risk Adjustment Score (CGT-Win)") +
  theme(legend.position = "top", legend.direction = "horizontal") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
CGTWin

ggsave("Exp_MDD_DNAm_CGTWin.jpg", width = 6, height = 6)


CGTLoss <- ggplot(data = plotdata, aes(x = DNAmCRP, y = RA_Loss)) +
  geom_point(aes(color = MDD), size = 0.5, show.legend = FALSE) + 
  geom_smooth(aes(fill = MDD), method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "DNAm CRP Score", y = "Risk Adjustment Score (CGT-Loss)") +
  theme(legend.position = "top", legend.direction = "horizontal") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
CGTLoss

ggsave("Exp_MDD_DNAm_CGTLoss.jpg", width = 6, height = 6)




## Next, fMRI plots

# Prepare data

plotdata <- data.frame(fMRI_epsi_mDNA$DNAm_CRP_score, fMRI_epsi_mDNA$R_amyg,
                       fMRI_epsi_mDNA$L_hpc, fMRI_epsi_mDNA$L_antInsIFG, as.factor(fMRI_epsi_mDNA$LifetimeMDD))
head(plotdata)
names(plotdata)[names(plotdata) == "fMRI_epsi_mDNA.DNAm_CRP_score"] <- "DNAmCRP"
names(plotdata)[names(plotdata) == "fMRI_epsi_mDNA.R_amyg"] <- "Ramyg"
names(plotdata)[names(plotdata) == "fMRI_epsi_mDNA.L_antInsIFG"] <- "LantIns"
names(plotdata)[names(plotdata) == "fMRI_epsi_mDNA.L_hpc"] <- "Lhpc"
names(plotdata)[names(plotdata) == "as.factor.fMRI_epsi_mDNA.LifetimeMDD."] <- "MDD"
plotdata <- na.omit(plotdata)
head(plotdata)

# Plot data

amyg <- ggplot(data = plotdata, aes(x = DNAmCRP, y = Ramyg, fill = MDD)) +
  geom_point(aes(color = MDD), size = 0.5, show.legend = FALSE) + 
  geom_smooth(aes(fill = MDD), method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "DNAm CRP Score", y = "R-amyg Activation (Precision-Weighted)") +
  theme(legend.position = "top", legend.direction = "horizontal") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-150, 150))
amyg

ggsave("Exp_MDD_DNAm_amyg_epsi.jpg", width = 6, height = 6)

antIns <- ggplot(data = plotdata, aes(x = DNAmCRP, y = LantIns, fill = MDD)) +
  geom_point(aes(color = MDD), size = 0.5, show.legend = FALSE) + 
  geom_smooth(aes(fill = MDD), method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "DNAm CRP Score", y = "L-antInsIFG Activation (Precision-Weighted)") +
  theme(legend.position = "top", legend.direction = "horizontal") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-150, 150))
antIns

ggsave("Exp_MDD_DNAm_antIns_epsi.jpg", width = 6, height = 6)


hpc <- ggplot(data = plotdata, aes(x = DNAmCRP, y = Lhpc, fill = MDD)) +
  geom_point(aes(color = MDD), size = 0.5, show.legend = FALSE) + 
  geom_smooth(aes(fill = MDD), method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Lifetime MDD", x = "DNAm CRP Score", y = "L-hpc Activation (Precision-Weighted)") +
  theme(legend.position = "top", legend.direction = "horizontal") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(-150, 150))
hpc

ggsave("Exp_MDD_DNAm_hpc_epsi.jpg", width = 6, height = 6)

