#################################################################
## Project: Entregable CPA - SpeedUp and Visualization         ##
## Script purpose: Visualization and analysis                  ##
## Date: Sat Nov 27 18:11:57 CET 2021                          ##
## Author: Dairon Andrés Benites Aldaz - (daibeal@upv.edu.es)  ##
#################################################################


# This file is part of CPA-Deliverable
# 
# CPA-Deliverable is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# CPA-Deliverable is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with CPA-Deliverable  If not, see <https://www.gnu.org/licenses/>.


## Library imports
library(ggrepel) #Add point labels
library(ggplot2) #Main package for graph
library(ggthemes) #Themes for formatting
library(grid) #Add grid line
library(cowplot) #Add annotation
library(extrafont)#Adding more font format
library(ggpubr) # Combining plots
## Section: Data Import
##################################################

df0 <- read.csv("/Users/daibeal/Downloads/Entrega/nuestraEntrega/time-logs/example-time-log0.csv",
               header = TRUE)
df1 <- read.csv("/Users/daibeal/Downloads/Entrega/nuestraEntrega/time-logs/example-time-log1.csv",
                header = TRUE)
df2 <- read.csv("/Users/daibeal/Downloads/Entrega/nuestraEntrega/time-logs/example-time-log2.csv",
                header = TRUE)


## Section: Data frame loading
##################################################
df0 <- within(df0, rm("X"))
df1 <- within(df1, rm("X"))
df2 <- within(df2, rm("X"))

# View(df0)

## Descriptive data
summary_0 <- summary(df0)
summary_1 <-summary(df1) 
summary_2 <- summary(df2) 
# Build graph- Restore0

# Time vs Number of Threads




graph_restore0 <- ggplot(df0, aes(x=N_Threads,y=Time)) +
  geom_line() + geom_point(color='purple') +
  ggtitle("restore0.c") + xlab("Number of Threads") +
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist()  +
  scale_y_continuous(breaks = round(seq(45, 60, by = 1),1), position = "left")
  

graph_restore1 <- ggplot(df1, aes(x=N_Threads,y=Time)) +
  geom_line() + geom_point(color='#8b0000') +
  ggtitle("restore1.c") + xlab("Number of Threads") + 
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist() + scale_y_continuous(position = "left") 

graph_restore2 <- ggplot(df2, aes(x=N_Threads,y=Time)) +
  geom_line() + geom_point(color='#00008b') +
  ggtitle("restore2.c") + xlab("Number of Threads") + 
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist() + scale_y_continuous(position = "left") 



#Show graph
figure <- ggarrange(graph_restore1, graph_restore2,
                    labels = c("A", "B"),
                    ncol = 2) 
figure

# Exercise 4
# 16 threads

#Restore 1
# static con tamaño de chunk por defecto
static_restore1 = 17.974302
static_1_restore1 = 28.464924
dynamic_restore1 = 199.364536
tiempos <- c(static_restore1,static_1_restore1, dynamic_restore1)
versiones <- c("Static chunk defecto", "Static chunk 1", "Dynamic")
sf_1 <- data.frame(tiempos, versiones)
summary(sf_1)

graph_restore1_4 <- ggplot(sf_1, aes(versiones, tiempos)) +
  geom_point(color = 'blue', size = 3)+
  ggtitle("restore1.c") +
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist() + xlab("Thread Planification") +
  ylab("Tiempo") 
graph_restore1_4

#Restore 2

static_restore2 = 5.7226924
static_1_restore2 = 8.768748
dynamic_restore2 = 8.4352
tiempos2 <- c(static_restore2,static_1_restore2, dynamic_restore2)
sf_2 <- data.frame(tiempos2, versiones)
summary(sf_2)

graph_restore2_4 <- ggplot(sf_2, aes(versiones, tiempos2)) +
  geom_point(color = 'red', size = 3) + 
  ggtitle("restore2.c") +
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist() + xlab("Thread Planification") +
  ylab("Tiempo") + labs(caption = "@daibeal - Polytechnic University of Valencia")
graph_restore2_4

#Show graph
figure2 <- ggarrange(graph_restore1_4, graph_restore2_4,
                    labels = c("A", "B"),
                    ncol = 2) 
figure2



