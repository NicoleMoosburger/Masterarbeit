## Wöchentlichen Stand der Sonne berechnen 
## Koordinaten für Britz: 52° 53′ 0″ N, 13° 48′ 0″ E.  
# Funktion zur Berechnung des Sonnenstands ohne externe Pakete

# Bibliotheken laden


###test 5
# Installiere das Paket, falls es noch nicht installiert ist
#install.packages("suntools")

library(suntools)
# Beispiel: Koordinaten für Berlin
crds <- matrix(c(13.8000, 52.8833), nrow = 1)

#### Immer immer Motag 2019 10:20
crds <- matrix(c(13.8000, 52.8833), nrow = 1)
datetime1 <- as.POSIXct("2019-01-07 10:20:00", tz = "Europe/Berlin")
datetime2 <- as.POSIXct("2019-01-14 10:20:00", tz = "Europe/Berlin")
datetime3 <- as.POSIXct("2019-01-21 10:20:00", tz = "Europe/Berlin")
datetime4 <- as.POSIXct("2019-01-28 10:20:00", tz = "Europe/Berlin")
datetime5 <- as.POSIXct("2019-02-04 10:20:00", tz = "Europe/Berlin")
datetime6 <- as.POSIXct("2019-02-11 10:20:00", tz = "Europe/Berlin")
datetime7 <- as.POSIXct("2019-02-18 10:20:00", tz = "Europe/Berlin")
datetime8 <- as.POSIXct("2019-02-25 10:20:00", tz = "Europe/Berlin")
datetime9 <- as.POSIXct("2019-03-04 10:20:00", tz = "Europe/Berlin")
datetime10 <- as.POSIXct("2019-03-11 10:20:00", tz = "Europe/Berlin")
datetime11 <- as.POSIXct("2019-03-18 10:20:00", tz = "Europe/Berlin")
datetime12 <- as.POSIXct("2019-03-25 10:20:00", tz = "Europe/Berlin")
datetime13 <- as.POSIXct("2019-04-01 10:20:00", tz = "Europe/Berlin")
datetime14 <- as.POSIXct("2019-04-08 10:20:00", tz = "Europe/Berlin")
datetime15 <- as.POSIXct("2019-04-15 10:20:00", tz = "Europe/Berlin")
datetime16 <- as.POSIXct("2019-04-22 10:20:00", tz = "Europe/Berlin")
datetime17 <- as.POSIXct("2019-04-29 10:20:00", tz = "Europe/Berlin")
datetime18 <- as.POSIXct("2019-05-06 10:20:00", tz = "Europe/Berlin")
datetime19 <- as.POSIXct("2019-05-13 10:20:00", tz = "Europe/Berlin")
datetime20 <- as.POSIXct("2019-05-20 10:20:00", tz = "Europe/Berlin")
datetime21 <- as.POSIXct("2019-05-27 10:20:00", tz = "Europe/Berlin")
datetime22 <- as.POSIXct("2019-06-03 10:20:00", tz = "Europe/Berlin")
datetime23 <- as.POSIXct("2019-06-10 10:20:00", tz = "Europe/Berlin")
datetime24 <- as.POSIXct("2019-06-17 10:20:00", tz = "Europe/Berlin")
datetime25 <- as.POSIXct("2019-06-24 10:20:00", tz = "Europe/Berlin")
datetime26 <- as.POSIXct("2019-07-01 10:20:00", tz = "Europe/Berlin")
datetime27 <- as.POSIXct("2019-07-08 10:20:00", tz = "Europe/Berlin")
datetime28 <- as.POSIXct("2019-07-15 10:20:00", tz = "Europe/Berlin")
datetime29 <- as.POSIXct("2019-07-22 10:20:00", tz = "Europe/Berlin")
datetime30 <- as.POSIXct("2019-07-29 10:20:00", tz = "Europe/Berlin")
datetime31 <- as.POSIXct("2019-08-05 10:20:00", tz = "Europe/Berlin")
datetime32 <- as.POSIXct("2019-08-12 10:20:00", tz = "Europe/Berlin")
datetime33 <- as.POSIXct("2019-08-19 10:20:00", tz = "Europe/Berlin")
datetime34 <- as.POSIXct("2019-08-26 10:20:00", tz = "Europe/Berlin")
datetime35 <- as.POSIXct("2019-09-02 10:20:00", tz = "Europe/Berlin")
datetime36 <- as.POSIXct("2019-09-09 10:20:00", tz = "Europe/Berlin")
datetime37 <- as.POSIXct("2019-09-16 10:20:00", tz = "Europe/Berlin")
datetime38 <- as.POSIXct("2019-09-23 10:20:00", tz = "Europe/Berlin")
datetime39 <- as.POSIXct("2019-09-30 10:20:00", tz = "Europe/Berlin")
datetime40 <- as.POSIXct("2019-10-07 10:20:00", tz = "Europe/Berlin")
datetime41 <- as.POSIXct("2019-10-14 10:20:00", tz = "Europe/Berlin")
datetime42 <- as.POSIXct("2019-10-21 10:20:00", tz = "Europe/Berlin")
datetime43 <- as.POSIXct("2019-10-28 10:20:00", tz = "Europe/Berlin")
datetime44 <- as.POSIXct("2019-11-04 10:20:00", tz = "Europe/Berlin")
datetime45 <- as.POSIXct("2019-11-11 10:20:00", tz = "Europe/Berlin")
datetime46 <- as.POSIXct("2019-11-18 10:20:00", tz = "Europe/Berlin")
datetime47 <- as.POSIXct("2019-11-25 10:20:00", tz = "Europe/Berlin")
datetime48 <- as.POSIXct("2019-12-02 10:20:00", tz = "Europe/Berlin")
datetime49 <- as.POSIXct("2019-12-09 10:20:00", tz = "Europe/Berlin")
datetime50 <- as.POSIXct("2019-12-16 10:20:00", tz = "Europe/Berlin")
datetime51 <- as.POSIXct("2019-12-23 10:20:00", tz = "Europe/Berlin")
datetime52 <- as.POSIXct("2019-12-30 10:20:00", tz = "Europe/Berlin")

# Berechne die Sonnenposition mit solarpos-Funktion
sun_position1 <- solarpos(crds, dateTime = datetime1)
sun_position2 <- solarpos(crds, dateTime = datetime2)
sun_position3 <- solarpos(crds, dateTime = datetime3)
sun_position4 <- solarpos(crds, dateTime = datetime4)
sun_position5 <- solarpos(crds, dateTime = datetime5)
sun_position6 <- solarpos(crds, dateTime = datetime6)
sun_position7 <- solarpos(crds, dateTime = datetime7)
sun_position8 <- solarpos(crds, dateTime = datetime8)
sun_position9 <- solarpos(crds, dateTime = datetime9)
sun_position10 <- solarpos(crds, dateTime = datetime10)
sun_position11 <- solarpos(crds, dateTime = datetime11)
sun_position12 <- solarpos(crds, dateTime = datetime12)
sun_position13 <- solarpos(crds, dateTime = datetime13)
sun_position14 <- solarpos(crds, dateTime = datetime14)
sun_position15 <- solarpos(crds, dateTime = datetime15)
sun_position16 <- solarpos(crds, dateTime = datetime16)
sun_position17 <- solarpos(crds, dateTime = datetime17)
sun_position18 <- solarpos(crds, dateTime = datetime18)
sun_position19 <- solarpos(crds, dateTime = datetime19)
sun_position20 <- solarpos(crds, dateTime = datetime20)
sun_position21 <- solarpos(crds, dateTime = datetime21)
sun_position22 <- solarpos(crds, dateTime = datetime22)
sun_position23 <- solarpos(crds, dateTime = datetime23)
sun_position24 <- solarpos(crds, dateTime = datetime24)
sun_position25 <- solarpos(crds, dateTime = datetime25)
sun_position26 <- solarpos(crds, dateTime = datetime26)
sun_position27 <- solarpos(crds, dateTime = datetime27)
sun_position28 <- solarpos(crds, dateTime = datetime28)
sun_position29 <- solarpos(crds, dateTime = datetime29)
sun_position30 <- solarpos(crds, dateTime = datetime30)
sun_position31 <- solarpos(crds, dateTime = datetime31)
sun_position32 <- solarpos(crds, dateTime = datetime32)
sun_position33 <- solarpos(crds, dateTime = datetime33)
sun_position34 <- solarpos(crds, dateTime = datetime34)
sun_position35 <- solarpos(crds, dateTime = datetime35)
sun_position36 <- solarpos(crds, dateTime = datetime36)
sun_position37 <- solarpos(crds, dateTime = datetime37)
sun_position38 <- solarpos(crds, dateTime = datetime38)
sun_position39 <- solarpos(crds, dateTime = datetime39)
sun_position40 <- solarpos(crds, dateTime = datetime40)
sun_position41 <- solarpos(crds, dateTime = datetime41)
sun_position42 <- solarpos(crds, dateTime = datetime42)
sun_position43 <- solarpos(crds, dateTime = datetime43)
sun_position44 <- solarpos(crds, dateTime = datetime44)
sun_position45 <- solarpos(crds, dateTime = datetime45)
sun_position46 <- solarpos(crds, dateTime = datetime46)
sun_position47 <- solarpos(crds, dateTime = datetime47)
sun_position48 <- solarpos(crds, dateTime = datetime48)
sun_position49 <- solarpos(crds, dateTime = datetime49)
sun_position50 <- solarpos(crds, dateTime = datetime50)
sun_position51 <- solarpos(crds, dateTime = datetime51)
sun_position52 <- solarpos(crds, dateTime = datetime52)

# Ausgabe des Ergebnisses
print(sun_position1)
print(sun_position2)
print(sun_position3)
print(sun_position4)
print(sun_position5)
print(sun_position6)
print(sun_position7)
print(sun_position8)
print(sun_position9)
print(sun_position10)
print(sun_position11)
print(sun_position12)
print(sun_position13)
print(sun_position14)
print(sun_position15)
print(sun_position16)
print(sun_position17)
print(sun_position18)
print(sun_position19)
print(sun_position20)
print(sun_position21)
print(sun_position22)
print(sun_position23)
print(sun_position24)
print(sun_position25)
print(sun_position26)
print(sun_position27)
print(sun_position28)
print(sun_position29)
print(sun_position30)
print(sun_position31)
print(sun_position32)
print(sun_position33)
print(sun_position34)
print(sun_position35)
print(sun_position36)
print(sun_position37)
print(sun_position38)
print(sun_position39)
print(sun_position40)
print(sun_position41)
print(sun_position42)
print(sun_position43)
print(sun_position44)
print(sun_position45)
print(sun_position46)
print(sun_position47)
print(sun_position48)
print(sun_position49)
print(sun_position50)
print(sun_position51)
print(sun_position52)

############################################### Erstellung der Hillshade-PNG 

# Lade erforderliche Bibliotheken
library(raster)
library(sp)
library(rgdal)
library(terra)
library(sf)
library(dplyr)
library(ggplot2)
library(scales)

setwd("D:/CommandLine_SNAP/Schattenmaske_II_durchlauf")

# Lade das DEM (zum Beispiel aus einer GeoTIFF-Datei)
dem <- raster("geglättetes_DEM.tif")
# Berechnung der Steigung (slope) und der Ausrichtung (aspect)
slope <- terrain(dem, opt='slope', unit='radians')
aspect <- terrain(dem, opt='aspect', unit='radians')

# Liste der Hillshade-Daten mit Winkeln und Richtungen  10:00Uhr 
hillshade_data <- list(
  hillshade_20190107_1000 = c(9.631297, 149.5435),
  hillshade_20190114_1000 = c(10.40672, 148.5602),
  hillshade_20190121_1000 = c(11.52785, 147.5632),
  hillshade_20190128_1000 = c(12.97530, 146.5800),
  hillshade_20190204_1000 = c(14.72258, 145.6327),
  hillshade_20190211_1000 = c(16.73713, 144.7364),
  hillshade_20190218_1000 = c(18.98153, 143.8983),
  hillshade_20190225_1000 = c(21.41487, 143.1182),
  hillshade_20190304_1000 = c(23.99396, 142.3892),
  hillshade_20190311_1000 = c(26.67441, 141.6984),
  hillshade_20190318_1000 = c(29.41147, 141.0283),
  hillshade_20190325_1000 = c(32.16069, 140.3587),
  hillshade_20190401_1000 = c(28.12723, 123.9892),
  hillshade_20190408_1000 = c(30.67632, 122.9378),
  hillshade_20190415_1000 = c(33.10543, 121.8367),
  hillshade_20190422_1000 = c(35.37355, 120.6789),
  hillshade_20190429_1000 = c(37.44261, 119.4654),
  hillshade_20190506_1000 = c(39.27861, 118.2074),
  hillshade_20190513_1000 = c(40.85283, 116.9278),
  hillshade_20190520_1000 = c(42.14320, 115.6620),
  hillshade_20190527_1000 = c(43.13537, 114.4565),
  hillshade_20190603_1000 = c(43.82339, 113.3658),
  hillshade_20190610_1000 = c(44.20965, 112.4473),
  hillshade_20190617_1000 = c(44.30412, 111.7557),
  hillshade_20190624_1000 = c(44.12290, 111.3371),
  hillshade_20190701_1000 = c(43.68633, 111.2254),
  hillshade_20190708_1000 = c(43.01702, 111.4396),
  hillshade_20190715_1000 = c(42.13797, 111.9838),
  hillshade_20190722_1000 = c(41.07110, 112.8478),
  hillshade_20190729_1000 = c(39.83622, 114.0095),
  hillshade_20190805_1000 = c(38.45054, 115.4371),
  hillshade_20190812_1000 = c(36.92872, 117.0915),
  hillshade_20190819_1000 = c(35.28332, 118.9287),
  hillshade_20190826_1000 = c(33.52558, 120.9020),
  hillshade_20190902_1000 = c(31.66630, 122.9640),
  hillshade_20190909_1000 = c(29.71672, 125.0676),
  hillshade_20190916_1000 = c(27.68931, 127.1673),
  hillshade_20190923_1000 = c(25.59843, 129.2198),
  hillshade_20190930_1000 = c(23.46074, 131.1843),
  hillshade_20191007_1000 = c(21.29568, 133.0230),
  hillshade_20191014_1000 = c(19.12571, 134.7010),
  hillshade_20191021_1000 = c(16.97657, 136.1873),
  hillshade_20191028_1000 = c(20.08937, 151.7652),
  hillshade_20191104_1000 = c(17.95368, 152.5233),
  hillshade_20191111_1000 = c(15.96590, 153.0396),
  hillshade_20191118_1000 = c(14.16443, 153.3134),
  hillshade_20191125_1000 = c(12.58733, 153.3508),
  hillshade_20191202_1000 = c(11.27075, 153.1646),
  hillshade_20191209_1000 = c(10.24731, 152.7740),
  hillshade_20191216_1000 = c(9.544372, 152.2035),
  hillshade_20191223_1000 = c(9.182817, 151.4819),
  hillshade_20191230_1000 = c(9.176179, 150.6411)
)

# Erstelle und speichere die Plots
for (datum in names(hillshade_data)) {
  angle <- hillshade_data[[datum]][1]
  direction <- hillshade_data[[datum]][2]
  hillshade <- hillShade(slope, aspect, angle = angle, direction = direction, normalize = TRUE)
  # Anpassung der Margins
  par(mar=c(4, 4, 2, 2) + 0.1)
  # Speichere den Plot in einer PNG-Datei
  png(paste0(datum, ".png"))
  plot(hillshade, main=paste("Hillshade", datum, "mit Werten von 0-60"), zlim=c(0, 60), col=gray.colors(1), breaks=c(0, 60, max(hillshade[], na.rm=TRUE)))
  dev.off()
}


##### Für den Zeitpunkt 10:20

# Liste der Hillshade-Daten mit Winkeln und Richtungen
hillshade_data <- list(
  hillshade_20190107_1020 = c(11.04795, 154.0105),
  hillshade_20190114_1020 = c(11.86982, 153.0610),
  hillshade_20190121_1020 = c(13.03752, 152.1137),
  hillshade_20190128_1020 = c(14.53014, 151.1953),
  hillshade_20190204_1020 = c(16.32006, 150.3267),
  hillshade_20190211_1020 = c(18.37403, 149.5220),
  hillshade_20190218_1020 = c(20.65439, 148.7876),
  hillshade_20190225_1020 = c(23.12033, 148.1225),
  hillshade_20190304_1020 = c(25.72909, 147.5187),
  hillshade_20190311_1020 = c(28.43692, 146.9625),
  hillshade_20190318_1020 = c(31.19991, 146.4355),
  hillshade_20190325_1020 = c(33.97455, 145.9158),
  hillshade_20190401_1020 = c(30.55524, 128.9825),
  hillshade_20190408_1020 = c(33.13576, 128.0129),
  hillshade_20190415_1020 = c(35.59694, 126.9869),
  hillshade_20190422_1020 = c(37.89790, 125.8950),
  hillshade_20190429_1020 = c(40.00043, 124.7357),
  hillshade_20190506_1020 = c(41.87009, 123.5175),
  hillshade_20190513_1020 = c(43.47745, 122.2620),
  hillshade_20190520_1020 = c(44.79946, 121.0042),
  hillshade_20190527_1020 = c(45.82067, 119.7922),
  hillshade_20190603_1020 = c(46.53399, 118.6831),
  hillshade_20190610_1020 = c(46.94081, 117.7385),
  hillshade_20190617_1020 = c(47.05027, 117.0175),
  hillshade_20190624_1020 = c(46.87781, 116.5705),
  hillshade_20190701_1020 = c(46.44336, 116.4346),
  hillshade_20190708_1020 = c(45.76918, 116.6308),
  hillshade_20190715_1020 = c(44.87802, 117.1635),
  hillshade_20190722_1020 = c(43.79158, 118.0217),
  hillshade_20190729_1020 = c(42.52952, 119.1812),
  hillshade_20190805_1020 = c(41.10901, 120.6076),
  hillshade_20190812_1020 = c(39.54485, 122.2592),
  hillshade_20190819_1020 = c(37.84998, 124.0892),
  hillshade_20190826_1020 = c(36.03628, 126.0489),
  hillshade_20190902_1020 = c(34.11548, 128.0889),
  hillshade_20190909_1020 = c(32.10004, 130.1610),
  hillshade_20190916_1020 = c(30.00387, 132.2195),
  hillshade_20190923_1020 = c(27.84296, 134.2211),
  hillshade_20190930_1020 = c(25.63573, 136.1258),
  hillshade_20191007_1020 = c(23.40342, 137.8969),
  hillshade_20191014_1020 = c(21.17030, 139.5011),
  hillshade_20191021_1020 = c(18.96379, 140.9093),
  hillshade_20191028_1020 = c(21.39181, 156.7818),
  hillshade_20191104_1020 = c(19.22238, 157.4293),
  hillshade_20191111_1020 = c(17.21196, 157.8430),
  hillshade_20191118_1020 = c(15.39904, 158.0240),
  hillshade_20191125_1020 = c(13.82137, 157.9801),
  hillshade_20191202_1020 = c(12.51449, 157.7261),
  hillshade_20191209_1020 = c(11.51009, 157.2826),
  hillshade_20191216_1020 = c(10.83447, 156.6751),
  hillshade_20191223_1020 = c(10.50729, 155.9333),
  hillshade_20191230_1020 = c(10.54067, 155.0896)
)

# Erstelle und speichere die Plots
for (datum in names(hillshade_data)) {
  angle <- hillshade_data[[datum]][1]
  direction <- hillshade_data[[datum]][2]
  hillshade <- hillShade(slope, aspect, angle = angle, direction = direction, normalize = TRUE)
  
  # Anpassung der Margins
  par(mar=c(4, 4, 2, 2) + 0.1)
  
  # Speichere den Plot in einer PNG-Datei
  png(paste0(datum, ".png"))
  plot(hillshade, main=paste("Hillshade", datum, "mit Werten von 0-60"), zlim=c(0, 60), col=gray.colors(1), breaks=c(0, 60, max(hillshade[], na.rm=TRUE)))
  dev.off()
}








