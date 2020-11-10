
library(tidyverse)
library(ggplot2)
library(GGally)
library(psych)
library(corrplot)
#PDF
#https://www.researchgate.net/publication/311950799_Analysis_of_the_Wisconsin_Breast_Cancer_Dataset_and_Machine_Learning_for_Breast_Cancer_Detection/link/5864757e08ae329d6203aa82/download


url_datos <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data'

datos.duros <- read.csv(url_datos)
data <- data.frame(datos.duros)

colnames(data) <- c("id",
                    "clump.thickness",
                    "unif.cell.size",
                    "unif.cell.shape",
                    "marginal.adhesion",
                    "epith.cell.size",
                    "bare.nuclei",
                    "bland.chromatin",
                    "normal.nucleoli",
                    "mitoses",
                    "class")




bool.values <- data$bare.nuclei=='?'
data <- data[!bool.values,]

#Para confirmar que se eliminaron los ?
sum(data$bare.nuclei=='?')


dd <- data

#En el caso de que se quiera cambiar los 4 y 2, por M y B
dd$class <- replace(dd$class,dd$class==2,'Benigno')
dd$class <- replace(dd$class,dd$class==4,'Maligno')

#Se aplica factor
dd[["class"]] <- factor(dd[["class"]])
data[["bare.nuclei"]] <- factor(data[["bare.nuclei"]])


#Se pasa a numerico los valores de bare nuclei.
data$bare.nuclei <- as.numeric(data$bare.nuclei)


#Se elimina la columna ID
#dd$id <- NULL
data$id <- NULL


#VISTA GENERAL
ggpairs(data, aes(colour=class, alpha=0.4))


#GRAFICO DE CORRELACION
corrplot.mixed(cor(data),
               lower = "number", 
               upper = "circle",
               tl.col = "black")


#GRAFICO DE CAJAS

library(ggpubr)
library(cowplot)

boxplot.width =  ggboxplot(data = data, x = "class", y = "width", color = "class") + border()


#Grafico de cajas para clump.thickness

boxplot.width =  ggboxplot(data = dd, x = "class", y = "clump.thickness", color = "class") + border()

ydens = axis_canvas(boxplot.width, axis = "y", coord_flip = TRUE) + geom_density(data = dd, aes(x = clump.thickness, fill = class), alpha = 0.7, size = 0.2) + coord_flip()

boxplot.width = insert_yaxis_grob(boxplot.width, ydens, grid::unit(.2, "null"), position = "right")

ggdraw(boxplot.width)



