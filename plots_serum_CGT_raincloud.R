# Prepare data
plotdata <- data.frame(as.factor(CGT_serum$CRPStatus), CGT_serum$RiskAdjustment_WIN, CGT_serum$RiskAdjustment_LOSS)
names(plotdata)[names(plotdata) == "as.factor.CGT_serum.CRPStatus."] <- "serumCRP"
names(plotdata)[names(plotdata) == "CGT_serum.RiskAdjustment_WIN"] <- "RA_Win"
names(plotdata)[names(plotdata) == "CGT_serum.RiskAdjustment_LOSS"] <- "RA_Loss"
plotdata <- na.omit(plotdata)
head(plotdata)
# Load packages
library(ggplot2)
library(plyr)
source("https://gist.githubusercontent.com/benmarwick/2a1bb0133ff568cbe28d/raw/fb53bd97121f7f9ce947837ef1a4c65a73bffb3f/geom_flat_violin.R")

# Raincloud aesthetics
raincloud_theme = theme(
  text = element_text(size = 10),
  axis.title.x = element_text(size = 16),
  axis.title.y = element_text(size = 16),
  axis.text = element_text(size = 14),
  axis.text.x = element_text(angle = 45, vjust = 0.5),
  legend.title=element_text(size=16),
  legend.text=element_text(size=16),
  legend.position = "right",
  plot.title = element_text(lineheight=.8, face="bold", size = 16),
  panel.border = element_blank(),
  panel.grid.minor = element_blank(),
  panel.grid.major = element_blank(),
  axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'),
  axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))

# CGT-Win raincloud plot with serum CRP
CGTWin <- ggplot(data = plotdata, aes(x = serumCRP, y = RA_Win, fill = serumCRP)) +
  geom_flat_violin(position = position_nudge(x = .2, y = 0), alpha = 0.5, show.legend = FALSE, trim = FALSE) +
  geom_point(aes(y = RA_Win, color = serumCRP), position = position_jitter(width = .15), size = .5, alpha = 0.8, show.legend = FALSE) +
  geom_boxplot(width = .1, guides = FALSE, outlier.shape = NA, alpha = 0.5, show.legend = FALSE) +
  scale_color_brewer(palette = "Dark2") +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() +
  labs(x = "Serum CRP Status", y = "Risk Adjustment Score (CGT-Win)") +
  #ggtitle("Serum CRP and CGT-Win Risk Adjustment") + theme(plot.title = element_text(hjust = 0.5)) +
  #xlab("Serum CRP Status") + ylab("Risk Adjustment Score") +
  raincloud_theme
CGTWin

ggsave("Serum_CGT-Win Raincloud.jpg", width = 6, height = 7)

# CGT-Loss raincloud plot with serum CRP
CGTLoss <- ggplot(data = plotdata, aes(x = serumCRP, y = RA_Loss, fill = serumCRP)) +
  geom_flat_violin(position = position_nudge(x = .2, y = 0), alpha = 0.5, show.legend = FALSE, trim = FALSE) +
  geom_point(aes(y = RA_Win, color = serumCRP), position = position_jitter(width = .15), size = .5, alpha = 0.8, show.legend = FALSE) +
  geom_boxplot(width = .1, guides = FALSE, outlier.shape = NA, alpha = 0.5, show.legend = FALSE) +
  scale_color_brewer(palette = "Dark2") +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() +
  labs(x = "Serum CRP Status", y = "Risk Adjustment Score (CGT-Loss)") +
  #ggtitle("Serum CRP and CGT-Win Risk Adjustment") + theme(plot.title = element_text(hjust = 0.5)) +
  #xlab("Serum CRP Status") + ylab("Risk Adjustment Score") +
  raincloud_theme
CGTLoss

ggsave("Serum_CGT-Loss Raincloud.jpg", width = 6, height = 7)