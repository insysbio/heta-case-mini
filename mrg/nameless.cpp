$PROB
# Model: `nameless`
  - Title: nameless
  - Notes: Generated automatically from platform with Heta compiler
  - Source: Heta compiler

# Demo
```{r,echo=TRUE}
  ev(amt=10) %>% mrgsim %>% plot
```

$SET end=120, delta=0.1, hmax=0.01, hmin=0, rtol=1e-3, atol=1e-6

$PARAM @annotated
// @Const 
k1 : 0.12 : 

$CMT @annotated
// @Species ''
A_amt_ : as amount
// @Species ''
B_amt_ : as amount

$GLOBAL
#define A (A_amt_ / comp1)
#define B (B_amt_ / comp1)

$PREAMBLE
//double B = 0.0;
//double A = 10.0;
double comp1 = 1.0;

$MAIN
B_amt__0 = (0.0) * comp1;
A_amt__0 = (10.0) * comp1;



$ODE
// @Reaction ''
double r1 = k1 * A * comp1;

dxdt_A_amt_ = (-1)*r1;
dxdt_B_amt_ = (2)*r1;

$CAPTURE @annotated
comp1 :  
A :  
B :  
r1 :  
