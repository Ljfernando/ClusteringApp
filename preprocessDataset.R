setwd("~/Desktop/USFSpring2018/Statistical_Learning/MyWork/CaseStudy3/")
music <- read.csv("top100.csv", stringsAsFactors = FALSE)
music2 <- music[, which(colnames(music) %in% c('energy', 'liveliness', 'tempo', 
                                               'speechiness', 'acousticness', 'instrumentalness',
                                               'duration', 'loudness', 'valence', 'danceability'))]
music2$speechiness <- as.numeric(music2$speechiness)
music2$instrumentalness <- as.numeric(music2$instrumentalness)
music2 <- na.omit(music2)



top100_clean <- cbind(music$name, music2)
top50_clean <- cbind(music$name[1:50], music2[1:50,])
write.csv(top100_clean, "top100_spotify.csv", row.names = FALSE)
write.csv(top50_clean, "top50_spotify.csv", row.names = FALSE)

## Credit card data
library(splitstackshape) #stratifiy
cc <- read.csv("Credit_Cards_All.csv")
cc_s <- stratified(na.omit(cc), group = 'TENURE', size = 10)
# Removing tenure var
cc_s <- cc_s[,-18]
write.csv(cc_s, 'Credit_Cards.csv', row.names = FALSE)
