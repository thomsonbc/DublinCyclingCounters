#Converts Google Maps coords to a format compatible with leaflet.
#Will accept a string of any length of coordinates
#Each coordinate must be delineated with a comma

convertToLS <- function(coords) {
  
  prefix <- 'LINESTRING('
  
  x <- purrr::reduce2(c(' ', '\t','\n'), c('', '',''),  .init = coords, stringr::str_replace_all)
  
  all_coords <- stringr::str_split(x, pattern = ',', simplify = T)[1, ]
  
  long <- seq(2, length(all_coords), 2)
  
  lat <- seq(1, length(all_coords), 2)
  
  coord_string <- character(length(all_coords))
  
  
  
  for (coord in seq_along(long)) {
    coord_string[lat[coord]] <- all_coords[long[coord]]
    coord_string[long[coord]] <- paste0(all_coords[lat[coord]], ',')
    
    if (coord == length(seq_along(long))) {
      coord_string[long[coord]] <- all_coords[lat[coord]]
    }
    
  }
  
  formatted_coords <- paste(coord_string, collapse = ' ')
  
  return(paste(prefix, formatted_coords, ')'))
}

