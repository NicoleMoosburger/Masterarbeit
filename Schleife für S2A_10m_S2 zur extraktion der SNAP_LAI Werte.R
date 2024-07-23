#### Schleife für S2A_10m_S2 zur extraktion der SNAP_LAI Werte 

# Hauptordner und Zielordner für CSV-Dateien
main_folder <- "D:/CommandLine_SNAP/S2A_10m_S2"
csv_output_folder <- "D:/CommandLine_SNAP/LAI_Werte_csv/10m_S2/"

# Liste der Unterordner im Hauptordner
sub_folders <- list.dirs(main_folder, recursive = FALSE)

# Schleife über die Unterordner
for (sub_folder in sub_folders) {
  # Liste der .img-Dateien im Unterordner
  img_file <- list.files(sub_folder, pattern = "lai\\.img$", full.names = TRUE)
  
  # Überprüfen, ob eine .img-Datei gefunden wurde
  if (length(img_file) > 0) {
    # Extrahieren des Datums aus dem Dateipfad
    date_str <- substring(basename(sub_folder), 12, 19)
    date_formatted <- format(as.Date(date_str, "%Y%m%d"), "%d.%m.%Y")
    
    # Laden der .img-Daten
    LAI_raster <- raster(img_file)
    
    # Pfad zur Shapefile der Zentroide der 10m Pixel
    Zentroide10m <- "D:/CommandLine_SNAP/Georeferenzierung/Zentroide_10m_Pixelgritt.shp"
    
    # Laden der Shapefile
    Zentroide10m_shp <- readOGR(Zentroide10m)
    
    # Prüfen, ob die Koordinatensysteme übereinstimmen
    if (!identical(proj4string(LAI_raster), proj4string(Zentroide10m_shp))) {
      # Transformieren der Shapefile in das Koordinatensystem der Rasterdatei
      Zentroide10m_shp <- spTransform(Zentroide10m_shp, crs(LAI_raster))
      print("Shapefile wurde transformiert.")
    } else {
      print("Shapefile und Rasterdaten haben das gleiche Koordinatensystem.")
    }
    
    # Extrahieren der LAI-Werte für jeden Pixelpunkt in Zentroide10m_shp
    Zentroide10m_shp$lai_value <- extract(LAI_raster, Zentroide10m_shp)
    
    # LAI-Werte als CSV speichern
    csv_filename_10m <- paste0(csv_output_folder, "Zentroide10m_", date_formatted, ".csv")
    write.csv(Zentroide10m_shp@data, file = csv_filename_10m, row.names = FALSE)
  } else {
    # Wenn keine "lai.img"-Datei gefunden wird, eine Meldung ausgeben
    cat("Keine lai.img-Datei im Ordner:", sub_folder, "\n")
  }
}
