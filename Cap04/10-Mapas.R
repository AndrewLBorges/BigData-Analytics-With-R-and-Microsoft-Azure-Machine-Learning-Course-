setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap04")
getwd()

install.packages(c("ggplot2", "maps", "mapdata"))

library(ggplot2)
library(maps)
library(mapdata)

?map_data
mapa <- map_data("world")

dim(mapa)
View(mapa)

# Generating a map
ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3)

ggplot() +
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = NA, color = "blue") +
  coord_fixed(1.3)

gg1 <- ggplot() +
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = "seagreen1", color = "blue") +
  coord_fixed(1.3)
gg1

# Marking points on the map
# We can use a shapefile
labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512),
  names = c("Ponto1", "Ponto2"),
  stringsAsFactors = FALSE
)

# Points on the map
gg1 +
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 2) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 2)

# Dividing by country
ggplot(data = mapa) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") +
  coord_fixed(1.3) +
  guides(fill = FALSE)

# RMaps
# rmaps.github.io
install.packages("rjson")
install.packages("leaflet")
require(devtools)
install_github('ramnathv/RCharts@dev')
install_github('ramnathv/rMaps')

library(rjson)
library(rMaps)
library(leaflet)

crosslet(
  x = "country",
  y = c("web_index", "universal_access", "impact_empowerment", "freedom_openness"),
  data = web_index
)

ichoropleth(Crime ~ State, data = subset(violent_crime, Year = 2010))
ichoropleth(Crime ~ State, data = violent_crime, animate = "Year")
ichoropleth(Crime ~ State, data = violent_crime, animate = "Year", play = TRUE)

map <- Leaflet$new()
map$setView(c(51.505, -0.09), zoom = 13)
map$tileLayer(provider = 'Stamen.Watercolor')
map$marker(
  c(51.5, -0.09),
  bindPopup = 'Hi. I am a popup'
)
map
