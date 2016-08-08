santa <- data.frame(belief_n=c('no belief','no belief','no belief','no belief',
                               'belief','belief','belief','belief',
                               'belief','belief','no belief','no belief',
                               'belief','belief','no belief','no belief'),
                      sibling_n=c('older brother','older brother','older brother','older sister',
                                'no older sibling','no older sibling','no older sibling','older sister',
                                'older brother','older sister','older brother','older sister',
                                'no older sibling','older sister','older brother','no older sibling')
                      )

santa
table(santa)
mosaicplot(table(santa),col=c(2,3,4))
