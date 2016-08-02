
##ggwrap2
##ggwrap2
windowsFonts(CalibriL=windowsFont("Calibri Light"))

#### 
wkdf <- mtcars
dep_var <- 'mpg'
varlist1 <- c('disp', 'drat', 'hp' )

testplot <- function(aDf= aDf, a= xvar, b= yvar, color= a) {
	localenv <- environment()
	p <- ggplot(aDf,aes_string(x = a, y = b, color= color), environment= localenv);
	p <- p + geom_point() + geom_smooth(method= lm) ;
	p <- p + theme_bw() + theme(text= element_text(family= "CalibriL"));
	p <- p + labs(list(title= paste("Linear Regression: ", b , "on", a), 
				subtitle= "Subtitle", 
				x= a, y= b)
			);
  	return(p);
}
graphWrapFn <- function(aDf, dep_var, varlist, color=dep_var){
		for(i in 1:length(varlist)){
			print(testplot(aDf, varlist[i], dep_var, color)); # Graph is here
			
		}
}

graphWrapFn(wkdf, dep_var, varlist1);
# or
graphWrapFn(wkdf, dep_var, varlist1, 'gear');







