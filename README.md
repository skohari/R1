# R1

## on Functions

### Lesson 1: What happens in Functions, stays in Functions
Functions are actions. Apply actions on objects. Hold the temporary object of a Function through `return()`. Don't take yourObjects inside function. Take function outputs to yourObjects.

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
`return()` is **the** exit point for a function. Multple `return()` statements can be used like decision tree, or a flow control, but only one will be used; either the relevant one or the first one (if all are relevant/read/executed).

#### Exercise 
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

## Loops as Process Control Structures

Main loops are `repeat()`, `for()`, and `while()`. These only control flow of code. The flow is in same environment as the start of the loop.
Loops have break mechanism, mainly `break` (break the loop completely) and `next` (go to the *next iteration* in the loop).


### repeat() loop
The `repeat{}` **loop** processes a block of code until the condition specified by the `break` statement (mandatory within the `repeat{}`), is met. The structure  is:

```{r}
repeat {
 commands
 if(condition) {
  break
 }
}
```

Let's try and example: For the first exercise, write a `repeat{}` loop that prints all the even numbers from `2 – 10`, via incrementing the variable, `i = 0`.

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
### for(i in x) loop 
write a `for(i in ...)` loop that uses `next` to print all values except `3` in the following variable: `i = 1:5`
```{r}
for(i in 1:5) {
  if(i == 3){
   next
  }
  print(i) 
}
```

### while() loop
Write a `while()` loop that prints the variable, `i`, (that is incremented from `1 - 5`), and uses break to exit the loop if `i` equals `3`.
```{r}
i = 1;
while(i <= 5){
  print(i)
  if(i == 3){
    break
  }
  i = i + 1
}

```
Write a `while()` loop that prints the variable, `i`, that is incremented from `1 – 7`, and uses the `next` statement, to skip the printing of the number `5`.
```{r}
i = 1
while (i <= 7) {
  i = i + 1;
  if(i == 5) {
    next
  }    
  print (i+10);
}
```

### Nested loops, 
Where the outer `for()` loop increments `a` 5 times, and the inner `for()` loop increments `b` 4 times. The `break` statement exits the inner `for()` loop after 2 incrementations. The nested loop prints the values of variables, `a` and `b`.
```{r}
for(a in 1:5) {
  for(b in 1:4){
    print (c(a,b, a*b));
    if(b == 2){
      break
    }
    b = b + 1  
  }
  a = a + 1  
}
```


Exercise 3
Create a function that given a data frame will print by screen the name of the column and the class of data it contains (e.g. Variable1 is Numeric).

```{r}
fn3 = function(dset){
 for (i in 1 : length(dset)) {
  print(paste(names(dset)[i], "is", class(dset[,i])))
 }
}

fn3(airquality)

#[1] "Ozone is integer"
#[1] "Solar.R is integer"
#[1] "Wind is numeric"
#[1] "Temp is integer"
#[1] "Month is integer"
#[1] "Day is integer"

```
