#################################################################
## Project: Entregable CPA - SpeedUp and Visualization         ##
## Script purpose: Visualization and analysis                  ##
## Date: Fri Nov 26 23:27:40 CET 2021                          ##
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

df0 <- read.csv("/Users/daibeal/Downloads/Entrega/nuestraEntrega/Source Code/r-source/example-time-log0.csv",
               header = TRUE)
df1 <- read.csv("/Users/daibeal/Downloads/Entrega/nuestraEntrega/Source Code/r-source/example-time-log1.csv",
                header = TRUE)
df2 <- read.csv("/Users/daibeal/Downloads/Entrega/nuestraEntrega/Source Code/r-source/example-time-log2.csv",
                header = TRUE)
df3 <- read.csv("/Users/daibeal/Downloads/Entrega/nuestraEntrega/Source Code/r-source/example-time-log3.csv",
                header = TRUE)

## Section: Data frame loading
##################################################
df0 <- within(df0, rm("X"))
df1 <- within(df1, rm("X"))
df2 <- within(df2, rm("X"))
df3 <- within(df3, rm("X"))

# View(df0)

## Descriptive data
summary_0 <- summary(df0)
summary_1 <-summary(df1) 
summary_2 <- summary(df2) 
summary_3 <- summary(df3) 
# Build graph- Restore0

# Time vs Number of Threads



graph_restore0 <- ggplot(df0, aes(x=N_Threads,y=Time)) +
  geom_line() + geom_point(color='purple') +
  ggtitle("restore0.c") + xlab("Number of Threads") + 
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist() + scale_y_continuous(position = "left") +  
  scale_y_continuous(breaks = round(seq(min(df1$Time), max(df1$Time), by = 1),1))

graph_restore1 <- ggplot(df1, aes(x=N_Threads,y=Time)) +
  geom_line() + geom_point(color='#8b0000') +
  ggtitle("restore1.c") + xlab("Number of Threads") + 
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist() + scale_y_continuous(position = "left") +  
  scale_y_continuous(breaks = round(seq(min(df1$Time), max(df1$Time), by = 1),1))

graph_restore2 <- ggplot(df2, aes(x=N_Threads,y=Time)) +
  geom_line() + geom_point(color='#00008b') +
  ggtitle("restore2.c") + xlab("Number of Threads") + 
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist() + scale_y_continuous(position = "left") +  
  scale_y_continuous(breaks = round(seq(min(df2$Time), max(df2$Time), by = 1),1))

graph_restore3 <- ggplot(df3, aes(x=N_Threads,y=Time)) +
  geom_line() + geom_point(color='#006400') +
  ggtitle("restore3.c") + xlab("Number of Threads") + 
  theme_economist_white(base_family="ITC Officina Sans") +
  scale_colour_economist() + scale_y_continuous(position = "left") +  
  scale_y_continuous(breaks = round(seq(min(df3$Time), max(df3$Time), by = 1),1))+ labs(caption = "Dairon Benites - Polytechnic University of Valencia")


#Show graph
figure <- ggarrange(graph_restore0, graph_restore1, graph_restore2,graph_restore3,
                    labels = c("A", "B", "C", "D"),
                    ncol = 2, nrow = 2) 
figure

# Speedup vs Number of Threads

