library(raster)
library(rgdal)
library(sp)
library(ggplot2)
library(stars)

#### Pfad zur .img-Datei
img_file <- "D:/CommandLine_SNAP/S2A_10m_S2/S2A_MSIL2A_20200816T101031_N0500_R022_T33UVU_20230422T120802.data/lai.img"
# Laden der .img-Daten
LAI_raster <- raster(img_file)

#### Datum extrahieren für Beschriftung der Plots --> img_file ist das LAI.img
# Extrahieren des Datums mit einem regulären Ausdruck
date_pattern <- "(\\d{8})T"
date_match <- regmatches(img_file, regexpr(date_pattern, img_file))
# Entfernen des "T" am Ende des extrahierten Datums
date_extracted <- gsub("T", "", date_match)
# Konvertieren in das Format dd.mm.yyyy
date_formatted <- format(as.Date(date_extracted, "%Y%m%d"), "%d.%m.%Y")
# Ausgabe des formatierten Datums
print(date_formatted)

####Zentroide der 10 und 20m Pixel einfügen 
Zentroide10m <- "D:/CommandLine_SNAP/Georeferenzierung/Zentroide_10m_Pixelgritt.shp"
Zentroide20m <- "D:/CommandLine_SNAP/Georeferenzierung/Zentroide_20m_Pixelgritt.shp"
# Laden der Shapefile
Zentroide10m_shp <- readOGR(Zentroide10m)
Zentroide20m_shp <- readOGR(Zentroide20m)


####Prüfen ob gleichen Koordinatensystem
# Überprüfen, ob die Koordinatensysteme übereinstimmen
if (!identical(proj4string(LAI_raster), proj4string(Zentroide10m_shp))) {
  # Transformieren der Shapefile in das Koordinatensystem der Rasterdatei
  Zentroide10m_shp <- spTransform(Zentroide10m_shp, crs(LAI_raster))
  print("Shapefile wurde transformiert.")
} else {
  print("Shapefile und Rasterdaten haben das gleiche Koordinatensystem.")
}
# Überprüfen, ob die Koordinatensysteme übereinstimmen
if (!identical(proj4string(LAI_raster), proj4string(Zentroide20m_shp))) {
  # Transformieren der Shapefile in das Koordinatensystem der Rasterdatei
  Zentroide20m_shp <- spTransform(Zentroide20m_shp, crs(LAI_raster))
  print("Shapefile wurde transformiert.")
} else {
  print("Shapefile und Rasterdaten haben das gleiche Koordinatensystem.")
}

####Pixelnr20m muss auch Numerisch werden!    --> wird zur Sicherheit auch für 10m Pixelgritt durchgeführt 
# Konvertieren der Pixelnr20m-Spalte in numerische Werte
Zentroide10m_shp@data[["Pixelnr."]] <- as.numeric(Zentroide10m_shp@data[["Pixelnr."]])
Zentroide20m_shp@data[["Pixelnr20m"]] <- as.numeric(Zentroide20m_shp@data[["Pixelnr20m"]])
# Überprüfen Sie, ob die Konvertierung erfolgreich war
#print(Zentroide20m_shp@data[["Pixelnr20m"]])



# Extrahieren der LAI-Werte für jeden Pixelpunkt in Zentroide10m_shp und  Zentroide20m_shp 
Zentroide10m_shp$lai_value <- extract(LAI_raster, Zentroide10m_shp)
Zentroide20m_shp$lai_value <- extract(LAI_raster, Zentroide20m_shp)  #-> ich glaube das ist wieder falsch. ich benötige das glaube ich nicht, da es ja nur um die 10x10m geht! 

# Print LAI-Werte je Pixel 
#print(Zentroide10m_shp@data)
#print(Zentroide20m_shp@data)


# Pixelzentroide Plotten 
# Umwandeln der Shapefile in ein data.frame
Zentroide10m_df <- as.data.frame(Zentroide10m_shp)
Zentroide20m_df <- as.data.frame(Zentroide20m_shp)

# Ausschneiden des Teils des Rasterbildes, der vom Shapefile abgedeckt wird
LAI_crop_10m <- crop(LAI_raster, extent(Zentroide10m_shp))
LAI_crop_20m <- crop(LAI_raster, extent(Zentroide20m_shp))

# Plotten des Rasterausschnitts
#plot(LAI_crop_10m)
#plot(LAI_crop_20m)

# Plotten der 10m Zentroide mit Nummerierung auf dem Rasterausschnitt
#points(Zentroide10m_shp$coords.x1, Zentroide10m_shp$coords.x2, col = "blue", pch = 1)
#text(Zentroide10m_shp$coords.x1, Zentroide10m_shp$coords.x2, labels = Zentroide10m_shp$Pixelnr., pos = 3)

# Plotten der 20m Zentroide mit Nummerierung auf dem Rasterausschnitt
#points(Zentroide20m_shp$coords.x1, Zentroide20m_shp$coords.x2, col = "blue", pch = 1)
#text(Zentroide20m_shp$coords.x1, Zentroide20m_shp$coords.x2, labels = Zentroide20m_shp$Pixelnr20m, pos = 3)


# Pixelgritt einfügen um zu kontrollieren, ob die Zentroide richtig gesetzt sind.
Pixelgritt_10m_shp <- st_read("D:/CommandLine_SNAP/Georeferenzierung/Pixelgritt_10m.shp")
Pixelgritt_20m_shp <- st_read("D:/CommandLine_SNAP/Georeferenzierung/Pixelgritt_20m.shp")
#plot(Pixelgritt_10m_shp, add = TRUE)
#plot(Pixelgritt_20m_shp, add = TRUE)


#Img auf Pixelgritt zuschneiden 
LAI_crop <- crop(LAI_raster, extent(Pixelgritt_20m_shp))


# Überprüfen, ob die Koordinatensysteme übereinstimmen
if (!identical(st_crs(LAI_raster), st_crs(Pixelgritt_20m_shp))) {
  # Transformieren der Shapefile in das Koordinatensystem der Rasterdatei
  Pixelgritt_20m_shp <- st_transform(Pixelgritt_20m_shp, st_crs(LAI_raster))
  print("Shapefile wurde transformiert.")
} else {
  print("Shapefile und Rasterdaten haben das gleiche Koordinatensystem.")
}


# Anzeigen der Koordinatensysteme
#crs(LAI_raster)
#crs(Zentroide20m_shp)
#crs(Pixelgritt_20m_shp)

#res(LAI_raster)
#res(LAI_crop_20m)
#res(Pixelgritt_20m_shp)

##########################################################################################################################
# jetzt LAI_crop, das Pixelgritt und die Punkte der Zentroide in einem Plott!!!!  

# Konvertieren des RasterLayers in ein DataFrame
raster_df <- as.data.frame(LAI_crop, xy = TRUE)
colnames(raster_df) <- c("x", "y", "value")

# Sicherstellen, dass beide Shapefiles sf-Objekte sind
Zentroide10m_sf <- st_as_sf(Zentroide10m_shp)
Pixelgritt_10m_sf <- st_as_sf(Pixelgritt_10m_shp)

Zentroide20m_sf <- st_as_sf(Zentroide20m_shp)
Pixelgritt_20m_sf <- st_as_sf(Pixelgritt_20m_shp)

#10m Pixelgritt
ggplot() +
  # Plotten des LAI-Rasters
  geom_raster(data = raster_df, aes(x = x, y = y, fill = value)) +
  scale_fill_viridis_c() + # optional, falls Sie eine Farbskala für das Raster verwenden möchten
  # Plotten der 10m Zentroide
  #geom_sf(data = Zentroide10m_sf, color = "grey", size = 2) +
  geom_sf_text(data = Zentroide10m_sf, aes(label = Pixelnr.), color = "blue", size = 3) +
  # Plotten des georeferenzierten 10m Rastergrids
  geom_sf(data = Pixelgritt_10m_sf, fill = NA, color = "red") +
  ggtitle(paste("Pixelgritt 10m und LAI Raster vom", date_formatted)) +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_minimal()

#20m Pixelgritt
ggplot() +
  # Plotten des LAI-Rasters
  geom_raster(data = raster_df, aes(x = x, y = y, fill = value)) +
  scale_fill_viridis_c() + # optional, falls Sie eine Farbskala für das Raster verwenden möchten
  # Plotten der 20m Zentroide
  #geom_sf(data = Zentroide20m_sf, color = "grey", size = 2) +
  geom_sf_text(data = Zentroide20m_sf, aes(label = Pixelnr20m), color = "blue", size = 3) +
  # Plotten des georeferenzierten 10m Rastergrids
  geom_sf(data = Pixelgritt_20m_sf, fill = NA, color = "red") +
  ggtitle(paste("Pixelgritt 20m und LAI Raster vom", date_formatted)) +
  xlab("Longitude") +
  ylab("Latitude") +
  theme_minimal()
###########################################################################################################################







