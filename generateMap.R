library(leaflet)
library(sf)

geom <- c('LINESTRING(-6.195249717 53.30817479, -6.197652 53.309500)',
          
          "LINESTRING(-6.28099219406116 53.3798812256215,-6.25426479728773 53.3766777137524)",
          "LINESTRING(-6.25046126611735 53.3757935814122,-6.2281830254828 53.3688122812491)",
          'LINESTRING(-6.2365421 53.36265769,-6.240986 53.3587650 , -6.246570 53.354774)',
          "LINESTRING(-6.2642748517383 53.3301741012171,-6.26485998600802 53.3326571026272)",
          "LINESTRING(-6.26469623192919 53.3299441663551,-6.27550020487107 53.3295149921325)",
          "LINESTRING(-6.2504073043629 53.375604273795,-6.25535397871696 53.3679896076341)",
          "LINESTRING(-6.25695197316816 53.3646118787598,-6.2612748572917 53.3597641214647)",
          "LINESTRING(-6.19884793189045 53.3595488676395,-6.21128815824083 53.360394533616)",
          "LINESTRING(-6.1645331928736 53.3741244502453,-6.14976359958787 53.3821313217105)",
          "LINESTRING(-6.24454976250165 53.3564561524619,-6.24736948471755 53.3580550238617)")
description <- c('RockRoad',
                 'Griffith Left',
                  'Griffith Right',
                 'NorthStrand', 
                 'Richmond Street', 
                 'Grove Road',
                 'Drumcondra 1',
                 'Drumcondra 2',
                 'Clontarf Pebble Beach Car Park',
                 'Clontarf James Larkin Rd',
                 'Charleville Mall')
colours <- c('red')


df <- data.frame(geom, description) # ordinary data frame
df <- st_as_sf(df, wkt = "geom") # convert to spatial data frame



leaflet(df) %>%
  addTiles() %>%
  addPolylines(stroke = T, 
               smoothFactor = 1,
               fillOpacity = 1,
               color =colours,
               label = ~paste0('description', ": ", formatC(description, big.mark = ","))) %>%
  addProviderTiles(providers$CartoDB.Positron)



c('53.30639113,	-6.21289843,53.30691662,	-6.213176606,	53.30632809,	-6.237045736',
  '53.30639113,	-6.21289843,53.30691662,	-6.213176606,	53.30632809,	-6.237045736 ',
  '53.30639113,	-6.21289843,53.30691662,	-6.213176606,	53.30632809,	-6.237045736 ',
  '53.30639113,	-6.21289843,53.30691662,	-6.213176606,	53.30632809,	-6.237045736 ') %>% 
  purrr::map(convertToLS) %>% unlist()
