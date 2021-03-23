library(ggplot2)
library(RColorBrewer)

## Alcohol Units Yesterday plots with CGT and L-antIns, ACC (epsi), separate for serum CRP 0 and 1

## First, CGT plots

# Prepare data
plotdata <- data.frame(as.factor(CGT_serum$CRPStatus), CGT_serum$RiskAdjustment_WIN,
                       CGT_serum$RiskAdjustment_LOSS, CGT_serum$AlcoholYesterday)
head(plotdata)
names(plotdata)[names(plotdata) == "as.factor.CGT_serum.CRPStatus."] <- "serumCRP"
names(plotdata)[names(plotdata) == "CGT_serum.RiskAdjustment_WIN"] <- "RA_Win"
names(plotdata)[names(plotdata) == "CGT_serum.RiskAdjustment_LOSS"] <- "RA_Loss"
names(plotdata)[names(plotdata) == "CGT_serum.AlcoholYesterday"] <- "AlcYest"
head(plotdata)

# Plot data
CGTWin <- ggplot(data = plotdata, aes(x = AlcYest, y = RA_Win, fill = serumCRP)) +
  geom_point(aes(color = serumCRP), size = 0.5, position = position_jitter(width = 1), show.legend = FALSE) + 
  geom_smooth(method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Serum CRP Status", x = "Alcohol Units Yesterday", y = "Risk Adjustment Score (CGT-Win)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  #ggtitle("CGT-Win Performance and Recent Alcohol Use") + theme(plot.title = element_text(hjust = 0.5)) +
  #xlab("Alcohol Units Yesterday") + ylab("Risk Adjustment Score (CGT-Win)")
CGTWin

ggsave("Exp_AlcYest_CGTWin.jpg", width = 5, height = 5)

CGTLoss <- ggplot(data = plotdata, aes(x = AlcYest, y = RA_Loss, fill = serumCRP)) +
  geom_point(aes(color = serumCRP), size = 0.5, position = position_jitter(width = 1), show.legend = FALSE) + 
  geom_smooth(method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Serum CRP Status", x = "Alcohol Units Yesterday", y = "Risk Adjustment Score (CGT-Loss)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
CGTLoss

ggsave("Exp_AlcYest_CGTLoss.jpg", width = 5, height = 5)



## Now, fMRI plots

# Prepare data
plotdata <- data.frame(as.factor(fMRI_epsi_serum$CRPStatus), fMRI_epsi_serum$L_antInsIFG,
                       fMRI_epsi_serum$ACC, fMRI_epsi_serum$AlcoholYesterday)
head(plotdata)
names(plotdata)[names(plotdata) == "as.factor.fMRI_epsi_serum.CRPStatus."] <- "serumCRP"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.L_antInsIFG"] <- "antIns"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.ACC"] <- "ACC"
names(plotdata)[names(plotdata) == "fMRI_epsi_serum.AlcoholYesterday"] <- "AlcYest"
head(plotdata)

# Plot data
ACC <- ggplot(data = plotdata, aes(x = AlcYest, y = ACC, fill = serumCRP)) +
  geom_point(aes(color = serumCRP), size = 0.5, position = position_jitter(width = 1), show.legend = FALSE) + 
  geom_smooth(method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Serum CRP Status", x = "Alcohol Units Yesterday", y = "ACC Activation (Precision-Weighted)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
ACC

ggsave("Exp_AlcYest_ACC_epsi.jpg", width = 5, height = 5)

antIns <- ggplot(data = plotdata, aes(x = AlcYest, y = antIns, fill = serumCRP)) +
  geom_point(aes(color = serumCRP), size = 0.5, position = position_jitter(width = 1), show.legend = FALSE) + 
  geom_smooth(method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() + labs(fill = "Serum CRP Status", x = "Alcohol Units Yesterday", y = "L-antInsIFG Activation (Precision-Weighted)") +
  theme(legend.position = c(0.8, 0.85)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
antIns

ggsave("Exp_AlcYest_antIns_epsi.jpg", width = 5, height = 5)
