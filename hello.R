#' Create charts to analyze data
#' @param
#' @return
#' @examples
#'
#'
#'
#' Load ggplot2
library(ggplot2)

#' Import Project Data file into R
Project_Data <- read_excel("Project Data.xlsx")
view(Project_Data)

#' Rename the data set to pd
pd <- Project_Data


#' Shorten the column names by renaming them
names(pd) <- c("city", "state", "pop", "med", "poverty", "age", "hsgrad", "bach")

#' Attach the data
attach(pd)

#' Plot setup
gg <- ggplot(pd,aes(x=med, y=age))
#' Create a scatterplot
ggplot(pd,aes(x=med, y=age)) + geom_point()

#' Add color to the scatter plot
ggplot(pd, aes(x=med, y=age, color=poverty)) + geom_point()

#' Add a smoothing curve
ggplot(pd, aes(x=med, y=age)) + geom_point() + geom_smooth()

#' Scatterplot with a straight line
ggplot(pd, aes(x=med, y=age)) + geom_point()
  + geom_smooth(se = FALSE, method = "lm")

#' Dynamic - point, size, shape, color, boundary thickness
gg + geom_point(aes(size= med, color=poverty, stroke=age))

#' Add Title
gg1 <- gg + geom_point(aes(color=age))
gg2 <- gg1 + labs(title="Birth Rate and Median Incomes",
                  x="Birth Rate/Perecent Under 5 Years", y="Median Income")
print(gg2)

#' Increase text size
gg3 <- gg2 + theme(plot.title=element_text(size=25),
                   axis.title.x=element_text(size=20),
                   axis.title.y=element_text(size=20),
                   axis.text.x=element_text(size=15),
                   axis.text.y=element_text(size=15))
print(gg3)

#' Create a line chart
gg + geom_line(aes(y=med), size=1, color="steelblue")

#' Geom layers
g3 + geom_smooth(aes(age=age))
p1 <- gg3 + geom_hline(yintercept=90000,
        size=2, linetype="dotted", color="blue")
p2 <- gg3 + geom_vline(xintercept=8, size=2, color="firebrick")
p3 <- gg3 + geom_segment(aes(x=8, y=9000, xend=4, yend=10000, size=2, lineend="round"))
p4 <- gg3 + geom_segment(aes(x=age, y=med, xend=age, yend=med-500, age=age), size=2)
    + coord_cartesian(xlim=c(3, 5))
gridExtra::grid.arrange(p1,p2,p3,p4, ncol=2)

#' Analyze the graphs that have been created to determine whether there is a correlation
#' between the median income and age under 5 years (used as birth rate).
#'
