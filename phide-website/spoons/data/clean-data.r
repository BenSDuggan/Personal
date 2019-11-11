# Spoons data analysis

mur <- read.csv('murder_list.csv')
names(mur) <- c('date', 'victim')
vic <- read.csv('victims.csv')
names(vic) <- c('assassin', 'victim')
el <- read.csv('eliminated.csv')
names(el) <- c('date', 'eliminated')

setdiff(mur$victim, vic$victim)
setdiff(vic$victim, mur$victim)


vic$victim <- as.character(vic$victim)
vic[63,2] <- "Nastya Yakovlyeva"
mur$victim <- as.character(mur$victim)
mur[55,2] <- "Nastya Yakovlyeva"

comb <- merge(vic, mur, by="victim")

comb[,1] <- as.character(comb[,1])
comb[,2] <- as.character(comb[,2])
comb[,3] <- as.character(comb[,3])
comb[64,] <- c("Sitha Vallabhaneni", "Ben Kelly", "10/22/2019")

write.table(comb, file="combined-results.tsv", sep="\t", row.names = FALSE)

x <- read.csv("combined-results.tsv", sep="\t", stringsAsFactors=FALSE)
