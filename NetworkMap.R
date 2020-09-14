# R Script for presenting NZ electricity networks using data provided by the Electricity Authority of New Zealand.
# Shape files location: https://www.emi.ea.govt.nz/Wholesale/Datasets/MappingsAndGeospatial/NetworkRegionShapefiles

library(leaflet)
library(geojsonio)
setwd("~/")
regions <- geojson_read(as.location("~/NZX/EMI/Geographic/WGS84_GeoJSON_NRR.json"),what="sp") 

library(broom)
library(mapproj)
 
regions_fortified <- tidy(regions, region = "ID")

ggplot() +
  geom_polygon(data = regions_fortified, 
               aes(x= long, 
                   y= lat, 
                   group = group, 
                   fill = group
                  )
               ) +
  theme_void() +
  coord_map() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        legend.position = "none") +
  labs(title = "NZ Electricity Network Locations",
       caption = "Data source: Electricity Authority of NZ EMI website")
