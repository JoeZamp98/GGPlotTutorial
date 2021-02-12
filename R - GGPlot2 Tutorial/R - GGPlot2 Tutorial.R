#SETUP

options(scipen=999) #Turns off scientific notation

require(ggplot2)
data("midwest", package="ggplot2")

#Iniital GG Plot

ggplot(midwest,aes(x=area, y=poptotal)) #Just generates a frame for a graph because we didn't
                                        #specify if we wanted a line or scatter plot

#SIMPLE SCATTER PLOT

ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + labs(title="County Population vs. Area")

#Adding a Smoothing Layer

ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + labs(title="County Population vs. Area") + geom_smooth(method='lm')

#Adjusting the X and Y axes ------

g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + labs(title="County Population vs. Area") + geom_smooth(method='lm')

#Delete the points outside your desired limits

g + xlim(c(0,0.1)) + ylim(c(0,1000000))

#Also can change the Axes by sooming in

g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + labs(title="County Population vs. Area (Zoomed)") + geom_smooth(method='lm')

g1 <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0,750000))
plot(g1)

#LABELLING THE CHART

# Title and axis labels ------

g1 + labs(title = "County Population vs. Area (Zoomed)", subtitle = "For Midwestern Counties") + xlab('Area') + ylab("Population")

##ADJUSTING COLOR AND SIZE OF DATAPOINTS

ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(col='steelblue', size=3) + geom_smooth(method='lm', col='firebrick') + coord_cartesian(xlim=c(0,0.1), ylim=c(0,1000000)) + labs(title = "County Population vs. Area (Zoomed)", subtitle = "For Midwestern Counties") + xlab('Area') + ylab("Population")

##COLORIZING BASED ON ANOTHER VARIABLE

g2 <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(aes(col=state), size=2) + geom_smooth(method='lm', col='navy') + coord_cartesian(xlim=c(0,0.1), ylim=c(0,1000000)) + labs(title= "County Population vs. Area", subtitle = "Colorized by State") + xlab('County Area (mi^2)') + ylab('County Population')
plot(g2)

#Set Color Palette

install.packages('RColorBrewer')
require(RColorBrewer)

install.packages('viridis')
require(viridis)

v_color_scale <- viridis(5) 

library(RColorBrewer)
head(brewer.pal.info, 10)

g2 + scale_color_viridis(discrete=TRUE, option='D')

## CHANGING X-Axis Ticks, Texts and Location

g3 <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(aes(col=state), size=3) + geom_smooth(method='lm', col='navy') + coord_cartesian(xlim=c(0,0.1), ylim=c(0,1000000)) + labs(title="County Population vs. Area", subtitle = "Colorized by State") + xlab('County Area (mi^2)') + ylab('County Population')

#Change the Breaks

g3 + scale_x_continuous(breaks=seq(0,0.1,0.01)) 

#Write Custom Text for Axis Labels (Formatting Original Value)

g3 + scale_x_continuous(breaks=seq(0,0.1,0.01), labels=sprintf("%1.2f%%", seq(0,0.1,0.01))) + 
  
scale_y_continuous(breaks=seq(0, 1000000, 100000), labels=function(x){paste0(x/1000,'K')})

plot(g3)

#CUSTOMIZING BASED ON A PRE-BUILT THEME


