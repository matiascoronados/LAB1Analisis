
library(tidyverse)


#PDF
#https://www.researchgate.net/publication/311950799_Analysis_of_the_Wisconsin_Breast_Cancer_Dataset_and_Machine_Learning_for_Breast_Cancer_Detection/link/5864757e08ae329d6203aa82/download


url_datos <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data'

"

     Group 1: 367 instances (January 1989)
     Group 2:  70 instances (October 1989)
     Group 3:  31 instances (February 1990)
     Group 4:  17 instances (April 1990)
     Group 5:  48 instances (August 1990)
     Group 6:  49 instances (Updated January 1991)
     Group 7:  31 instances (June 1991)
     Group 8:  86 instances (November 1991)
     -----------------------------------------
     Total:   699 points (as of the donated datbase on 15 July 1992)
  

"

data <- read.csv(url_datos)

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

"
falta eliminar los ?
"



"
Atributos:


   #  Attribute                     Domain
   -- -----------------------------------------
   1. Sample code number            identificador del paciente
   2. Clump Thickness               1 - 10
   3. Uniformity of Cell Size       1 - 10
   4. Uniformity of Cell Shape      1 - 10
   5. Marginal Adhesion             1 - 10
   6. Single Epithelial Cell Size   1 - 10
   7. Bare Nuclei                   1 - 10
   8. Bland Chromatin               1 - 10
   9. Normal Nucleoli               1 - 10
  10. Mitoses                       1 - 10
  11. Class:                        diagnosis de los tejidos mamarios, en donde (4) es maligno y (2) benigno.


Cada parametro esta medido con una escala que varia del 1 al 10, siendo 1 el mas cercano a benigno, y 10 a maligno

Del data-set original, se identificaron 9 variables que diferian signficiativamente en el resultao de los diagnosticos de los ejidos mamarios.

Los datos son consideraciones noise-free (?)

"


sum(is.na(data))
