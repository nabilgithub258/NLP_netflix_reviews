library(corrgram)
library(corrplot)
library(caTools)
library(Amelia)
library(ggplot2)
library(dplyr)
library(rpart)
library(rpart.plot)
library(randomForest)
library(ISLR)
library(e1071)
library(cluster)
library(tm)
library(twitteR)
library(wordcloud)
library(RColorBrewer)

#### getting the data into text

netflix <- read.csv('netflix_reviews.csv')

#### text mining

docs <- Corpus(VectorSource(netflix))

#### using TermDocumentMatrix to do manipulation

doc.matrix <- TermDocumentMatrix(docs,control=list(removePunctuation = TRUE,
                                                   stopwords=c('the','The','and','build','but'),
                                                   removeNumbers = TRUE,
                                                   tolower = TRUE))


#### make it a matrix

doc.matrix <- as.matrix(doc.matrix)

#### word count

word.freq <- sort(rowSums(doc.matrix),decreasing = TRUE)

df <- data.frame(word=names(word.freq),freq = word.freq)

#### wordcloud NLP

wordcloud(df$word,df$freq,random.order = F, colors = brewer.pal(11, 'RdYlBu'))


