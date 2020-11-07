#Info

#https://rstudio-pubs-static.s3.amazonaws.com/470274_250703bdc9f14d4295e86fb1e3000f5b.html

#https://www.kaggle.com/uciml/breast-cancer-wisconsin-data

url.Inutil <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data'
data.Inutil <- read.csv(url.Inutil)


data <- read.csv(file.path("c:/Users/elmat/Desktop/LAB1Analisis", "data.csv"))

#Se elimina columna basura
data["X"] <- NULL

head(data)

"
Pasos.
1. Buscar significado de las variables
2. Identificar relacion
3. Analizar estadisticos de cada variable

"


"
Variables:
id: identificador del paciente
diagnosis: diagnosis de los tejidos mamarios, en donde (M) es maligno y (B) benigno

radius: 

Por cada variable se calcula:
Media/SE/Worst

"