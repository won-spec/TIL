library(ggplot2)


head(mpg)

df <- mpg

write.csv(df,file ="C:/python_DA/mpg.csv",
          quote =T,
          append=T)


