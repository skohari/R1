
baseDf <- mtcars 		# DECLARATION POINT!
responseVariable <- 'mpg'; 	# DECLARATION POINT!

baseDf$responseVariable <- baseDf[,paste(responseVariable)] 
