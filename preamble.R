## Load datasets
CGT <- read.csv("CGT.csv")
serum <- read.csv("serumCRP.csv")
mDNA <- read.csv("DnamCRP.csv")
fMRI_epsi <- read.csv("fMRI1.csv")
fMRI_plain <- read.csv("fMRI2.csv")
alcohol <- read.csv("alcohol.csv")
demos <- read.csv("demos.csv")
demos_gs <- read.csv("demos_gs.csv")
idmatch <- read.csv("idmatch.csv")

## Fix column names for f.eid
names(CGT)[names(CGT) == "ï..f.eid"] <- "f.eid"
names(fMRI_epsi)[names(fMRI_epsi) == "ï..f.eid"] <- "f.eid"
names(fMRI_plain)[names(fMRI_plain) == "Admin_A_ID"] <- "f.eid"
names(alcohol)[names(alcohol) == "ï..ID"] <- "f.eid"
names(demos)[names(demos) == "ï..ID"] <- "f.eid"
names(demos_gs)[names(demos_gs) == "ï..id"] <- "GS.id"
names(idmatch)[names(idmatch) == "ï..st"] <- "f.eid"
names(idmatch)[names(idmatch) == "id"] <- "GS.id"


## Outline of main statistical analyses
# CGT:  win condition (reward, bet is doubled if win), loss condition (punishment, bet is lost if lose)
#       analysing risk adjustment separately for two conditions
#       (higher risk adjustment => better adjustment of bet according to probs)
#       (check what is the use of the average win and average loss variables)
# fMRI:
# key contrasts (reward-noreward, plain signal and
# precision-weighted prediction error signal) for different brain regions of interest