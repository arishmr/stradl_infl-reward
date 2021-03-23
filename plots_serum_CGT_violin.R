# Prepare data
plotdata <- data.frame(as.factor(CGT_serum$CRPStatus), CGT_serum$RiskAdjustment_WIN, CGT_serum$RiskAdjustment_LOSS)
names(plotdata)[names(plotdata) == "as.factor.CGT_serum.CRPStatus."] <- "serumCRP"
names(plotdata)[names(plotdata) == "CGT_serum.RiskAdjustment_WIN"] <- "RA_Win"
names(plotdata)[names(plotdata) == "CGT_serum.RiskAdjustment_LOSS"] <- "RA_Loss"
plotdata <- na.omit(plotdata)
head(plotdata)
# Load packages
library(ggplot2)


# CGT-Win/Serum-CRP violin plot

serumWIN <- ggplot(plotdata, aes(x = serumCRP, y = RA_Win, fill = serumCRP)) + 
  geom_violin(trim = FALSE, show.legend = FALSE, alpha = 0.8) + 
  geom_boxplot(width = 0.2, show.legend = FALSE) + 
  scale_fill_brewer(palette = "Paired") +
  ggtitle("Serum CRP and CGT-Win Risk Adjustment") + theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(face = "bold")) + 
  xlab("Serum CRP Status") + ylab("Risk Adjustment Score") +
  theme(text = element_text(size = 15))
serumWIN

ggsave("Serum_CGT-Win Violin.jpg", width = 6, height = 7)


# CGT-Loss/Serum-CRP violin plot

serumLOSS <- ggplot(plotdata, aes(x = serumCRP, y = RA_Loss, fill = serumCRP)) + 
  geom_violin(trim = FALSE, show.legend = FALSE, alpha = 0.8) + 
  geom_boxplot(width = 0.2, show.legend = FALSE) + 
  scale_fill_brewer(palette = "Paired") +
  ggtitle("Serum CRP and CGT-Loss Risk Adjustment") + theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(face = "bold")) + 
  xlab("Serum CRP Status") + ylab("Risk Adjustment Score") +
  theme(text = element_text(size = 15))
serumLOSS

ggsave("Serum_CGT-Loss Violin.jpg", width = 6, height = 7)


