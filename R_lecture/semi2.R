install.packages("devtools") 
library(devtools)


install_github("dkahle/ggmap")
library(ggmap)

#내 구글맵 API 키 :AIzaSyDrTy9sIMPOvXZLffYeW5JlMHuv--XYD_I

googleAPIkey = "AIzaSyDrTy9sIMPOvXZLffYeW5JlMHuv--XYD_I"

register_google(key = googleAPIkey)

gg_seoul <- get_googlemap("seoul",
                          maptype = "roadmap")
ggmap(gg_seoul)

library(dplyr)
library(ggplot2)

#####################################################################
df1 <- read.csv(file = "C:/R_lecture/lonlat.csv",
                encoding = "UTF-8",
                header = T)
head(df1)

geo_code = geocode(enc2utf8("마포구")) #한글이면 유니코드로 변환
geo_code
geo_code <- as.data.frame(geo_code)
geo_data = as.numeric(geo_code)#숫자로 변환
geo_data

get_googlemap(center = geo_data,
              maptype = "roadmap",
              zoom = 14) %>%
    ggmap() +
    geom_point(data = df1,
               aes(x=lon,
                   y=lat),
               size=1,
               color = "red") -> map
ggmap(map)
ggplotly(map)