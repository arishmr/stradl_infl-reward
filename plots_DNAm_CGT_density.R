# Prepare data
plotdata <- data.frame(CGT_mDNA$DNAm_CRP_score, CGT_mDNA$RiskAdjustment_WIN, CGT_mDNA$RiskAdjustment_LOSS)
names(plotdata)[names(plotdata) == "CGT_mDNA.DNAm_CRP_score"] <- "DNAmCRP"
names(plotdata)[names(plotdata) == "CGT_mDNA.RiskAdjustment_WIN"] <- "RA_Win"
names(plotdata)[names(plotdata) == "CGT_mDNA.RiskAdjustment_LOSS"] <- "RA_Loss"
plotdata <- na.omit(plotdata)
head(plotdata)
# Load packages
library(ggplot2)


# CGT-Win/DNAm-CRP Density plot

DNAmWIN <- ggplot(plotdata, aes(x = DNAmCRP, y = RA_Win)) + 
  geom_density2d() + 
  geom_point(size = 0.5, show.legend = FALSE) + 
  geom_smooth(method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Paired") +
  #ggtitle("DNAm CRP and CGT-Win Risk Adjustment") + theme(plot.title = element_text(hjust = 0.5)) +
  #theme(plot.title = element_text(face = "bold")) + 
  xlab("DNAm CRP Score") + ylab("Risk Adjustment Score (CGT-Win)") +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
DNAmWIN

ggsave("DNAm_CGT-Win Density.jpg", width = 7, height = 7)


# CGT-Loss/DNAm-CRP Density plot

DNAmLOSS <- ggplot(plotdata, aes(x = DNAmCRP, y = RA_Loss)) + 
  geom_density2d() + 
  geom_point(size = 0.5, show.legend = FALSE) + 
  geom_smooth(method = "lm", formula = y ~ x) +
  scale_fill_brewer(palette = "Paired") +
  #ggtitle("DNAm CRP and CGT-Loss Risk Adjustment") + theme(plot.title = element_text(hjust = 0.5)) +
  #theme(plot.title = element_text(face = "bold")) + 
  xlab("DNAm CRP Score") + ylab("Risk Adjustment Score (CGT-Loss)") +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
DNAmLOSS

ggsave("DNAm_CGT-Loss Density.jpg", width = 7, height = 7)


