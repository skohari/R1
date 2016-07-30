# R1

## on Functions

### Lesson 1: What happens in Functions, stays in Functions
Never write a function to change datasets. Functions are action. 
Apply actions on objects. Don't take yourObjects inside function. Take function outputs to yourObjects

```{r}
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
Replaces `NA` value created, and through an `ifelse()` with a `12`, else they're `*100` 
```{r}
#df1 = mtcars
f1 = function(ds) {
 ds[,length(ds)+1] = ds[,length(ds)-3]
 ds[nrow(ds)-2, length(ds)] = NA
 ds[,length(ds)] = ifelse(is.na(ds[,length(ds)]),12, (ds[,length(ds)])*100)
 return(ds)
}
df2 = f1(df1) ; df2

#nrow(df2)
```
### repeat-break: It's a do-loop
The `repeat{}` **loop** processes a block of code until the condition specified by the `break` statement (mandatory within the `repeat{}`), is met. The structure  is:

```{r}
repeat {
 commands
 if(condition) {
  break
 }
}
```

Let's try and example: For the first exercise, write a repeat{} loop that prints all the even numbers from 2 – 10, via incrementing the variable, “i = 0“.

```{r}
msg = "Hello"
i = 1;
repeat {
  i = i + 1
  if(i %% 2 == 0) {
    print(msg);
    print(i)
  }
  if(i == 10) {
    break
  }
}
```


