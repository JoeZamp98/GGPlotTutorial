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


                                                      
