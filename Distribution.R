library(tidyverse)
library(ggplot2)
library(ggeasy)
library(RColorBrewer)
a<- read.csv("SocialStatus.csv", TRUE)
b<- read.csv("Education.csv", TRUE)
c<- read.csv("DataSet.csv", TRUE)
d<- read.csv("Economic.csv", TRUE)
e<-read.csv("GenderWise.csv", TRUE)


#Gender-wise yearly suicides in India

eplot<- ggplot(data=e, aes(x=year,y=suicides,fill=gender)) +
        geom_bar(stat="identity", position = position_dodge())+
        labs(title = "Gender-wise suicides", x = "Year",y="No.of suicides")+
        geom_text(label = e$suicides ,vjust = -0.01, hjust = +0.5, colour = "black")+
        scale_fill_manual(values=c("#776B5D","#E48F45"))+
        theme_minimal()
eplot

#plot for Economic Status
dplot<-ggplot(data=d, aes(x=Status,y=Suicides,fill=Gender)) +
       geom_bar(stat="identity", position = position_dodge())+
       labs(title = "Economic-Status-wise suicides", x = "Economic Status",y="%Share of Suicides")+
       geom_text(label = d$Suicides ,vjust = -0.01, hjust = +0.5, colour = "black")+
       scale_fill_manual(values=c("#776B5D","#E48F45"))
dplot

#plot for social status
aplot<-ggplot(data=a, aes(x=Social_Status, y=a$Suicides,fill=Gender)) +
  geom_bar(stat="identity", position = position_dodge())+
  labs(title = "Social-Status-wise suicides", x = "Social Status",y="%Share of Suicides")+
  geom_text(label = a$Suicides ,angle = 45,label.size = 0.35, vjust = -0.01, hjust = +0.75, colour = "black")+
  scale_fill_manual(values=c("#776B5D","#E48F45"))
aplot

#plot for Educational Status
bplot<- ggplot(data=b, aes(x=b$Status,y=b$Suicides,fill=Gender)) +
  geom_bar(stat="identity", position = position_dodge())+
  labs(title = "Education-wise suicides", x = "Education",y="% Share of Suicides")+
  geom_text(label = b$Suicides ,vjust = -0.01, hjust = +0.5, colour = "black")+
  scale_fill_manual(values=c("#776B5D","#E48F45"))
bplot

#plot for Age-wise Suicides 
cplot<- ggplot(data=c, aes(x=c$Age, y=c$Suicides, fill=Gender)) +
  geom_bar(stat="identity", position = position_dodge())+
  labs(title = "Age-wise suicides", x = "Age-group",y="% Share of Suicides")+
  geom_text(label = c$Suicides, vjust = -0.01, hjust = +0.5, colour = "black")+
  scale_fill_manual(values=c("#776B5D","#E48F45"))
cplot

abc<- read.csv("Suicides.csv", TRUE)
liplot<- ggplot(abc, aes(x = abc$Year, y = abc$No..of.Suicides))+
         geom_line(data = abc, aes(x = abc$Year, y =abc$No..of.Suicides), colour = 'navy', size = 1)+
         geom_point(size = 1.5, colour = "skyblue")+
         labs(x = "Year", y = "No. of suicides", title = "Number of Suicides 2017-2021")+
         geom_text(label = abc$No..of.Suicides,vjust = +1.5, hjust = +0.5, colour = "black")
liplot
