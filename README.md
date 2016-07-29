# R1

## on Functions

### Lesson 1: What happens in Functions, stays in Functions
Never write a function to change datasets. Functions are action. 
Apply actions on objects. Don't take yourObjects inside function. Take function outputs to yourObjects

```
#df1 = mtcars 
f1 = function(ds) {
 ds[,length(ds)+1] = ds[,length(ds)-3]
 return(ds)
}
df1 = f1(df1)
```
It's the `df1 = f1(df1)` that actually *affects* the object; the RHS there is an unnamed temporary object about to expire at the next call.

### return()
Statements *after* `return()` will not be returned. ~Wan.Wan~


