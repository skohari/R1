
##ggwrap2

testplot <- function(aDf, a, b){
	localenv <- environment()
	p <- ggplot(aDf, 
      	aes_string(color = a, x = a, y = b),
		environment = localenv		
	)
  	p + geom_point() + geom_smooth(method = lm) + theme_bw()
}

dep_var = 'mpg'
var1 = c('disp', 'wt')

for(i in 1:length(var1)){
	print(testplot(mtcars, var1[i], dep_var))
}

####
