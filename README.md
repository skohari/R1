# R1

## on Functions

### Lesson 1: What happens in Functions, stays in Functions
Never write a function to change datasets. Functions are action. 
Apply actions on objects. Don't take yourObjects inside function. Take function outputs to yourObjects

```
#df1 = mtcars 
fn1 = function(ds) {
 ds[,length(ds)+1] = ds[,length(ds)-3]
 return(ds)
}
df1 = fn1(df1)
```
It's the `df1 = fn1(df1)` that actually *affects* the object; the RHS there is an unnamed temporary object about to expire at the next call.

### return()
Statements *after* `return()` will not be returned. ~Wan.Wan~

#### Next - Work this out!
```
#df1 = mtcars
f1 = function(ds) {
 ds[,length(ds)+1] = ds[,length(ds)-3]
 ds[nrow(ds)-2, length(ds)] = NA
 ifelse(is.na(ds[,length(ds)]), 9, (ds[,length(ds)]))
 return(ds)
}
df1 = f1(df1)
df1

#nrow(df1)
```

