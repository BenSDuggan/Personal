# Spoons data analysis

library(ggplot2)

spoons <- read.csv("combined-results.tsv", sep="\t", stringsAsFactors=TRUE)
spoons$days <- as.Date(spoons$date, format="%m/%d/%Y") - as.Date("9/20/2019", format="%m/%d/%Y")
spoons <- spoons[order(spoons$days),]

people.num.kills <- table(spoons$assassin)

# Plot a histagram with number of kills per assassin
x <- people.num.kills[people.num.kills > 1]
x <- data.frame(assassin=names(x), kills=as.numeric(x))
ggplot(x, aes(x=reorder(assassin, -kills), y=kills)) + geom_bar(stat="identity") + labs(title="Number of Kills by Assassin (kills > 1)", x="Assassin Name", y= "Number of Kills") + theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Plot the number of kills per day
x <- table(spoons$date)
x <- data.frame(date=names(x), kills=as.numeric(x))
x <- spoons
x$date <- factor(spoons$date, order=T)
ggplot(x, aes(x=days)) + geom_histogram(stat="count") + labs(title="Number of kills per day", x="Assassin Name", y= "Number of Kills") + theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Kills vs days alive 

# Class vs number of kills

# Class vs days survived
