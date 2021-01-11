getwd()
setwd('C:\\Users\\yashp\\OneDrive\\Desktop\\Extra Courses Repository\\R Programming for Data Science\\Section 6- Advanced Viz with GGPlot 2')
getwd()

mov <- read.csv("Section6-Homework-Data.csv")

head(mov)
tail(mov)
summary(mov)
str(mov)

library(ggplot2)

#filtering #1 data frames
filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")  

#filter #2
filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")

filt
filt2

mov2 <- mov[filt & filt2, ]
mov2

#preparing plot's data and aes layers

p <- ggplot(aes(x=Genre, y=Gross...US))
p

q <- p + geom_jitter(aes(size=Budget...mill., colour= Studio)) + geom_boxplot(alpha=0.7, outlier.color = NA)
q

q <- q+ xlab("Genre") + ylab("Gross%US") + ggtitle("Domestic Gross % by Genre")
q

q <- q+ theme(axis.title.x = element_text(colour = "Blue", size=10),
              axis.title.y = element_text(colour = "Blue", size=10),
              axis.text.x = element_text(size=10),
              axis.text.y = element_text(size=10),
              
              plot.title = element_text(size=20, family = "Courier"),
              legend.title = element_text(size=20),
              
              text = element_text(family = "Courier"),
              )

q

q$labels$size <- "Budget$M"
q





