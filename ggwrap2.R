
##ggwrap2
##ggwrap2

#### 
wkdf = mtcars
dep_var = 'mpg'
varlist1 = c('disp', 'drat', 'hp' )

testplot <- function(aDf, a, b) {
	localenv <- environment()
	p <- ggplot(aDf,aes_string(x = a, y = b, color = a),
		environment = localenv) 
		+ theme_bw()
  	return(p + geom_point() + geom_smooth(method = lm)  +
			labs(list(title = paste("Linear Regression: ", b , "on ", a), 
					subtitle = "Subtitle", 
					x = a, y = b
				)
			)
	)
}
graphWrapFn <- function(aDf, dep_var, varlist){
		for(i in 1:length(varlist)){
			print(testplot(aDf, varlist[i], dep_var))
		}
}

graphWrapFn(wkdf, dep_var, varlist1);



