* Utility maximization problem

* Declaring the names of endogenous variables

VARIABLES
C1       Consumption of good 1
C2       Consumption of good 2
Q1       Production of good 1
Q2       Production of good 2
L1       Amount of labor in sector 1
L2       Amount of labor in sector 2
Y        Income
P1       Price of good 1
P2       Price of good 2
U        Utility index
w1       wage 1
w2       wage 2
;

* Declaring the names of equations

EQUATIONS
UTILITY  Utility Function
CONSUMPTION      Consumption Function
PRODUCTION       Production Function
AUTARKY1         Set C1 equal to Q1
AUTARKY2         Set C2 equal to Q2
OUTPUT1          Technology requirements for good 1
OUTPUT2          Technology requirements for good 2
LABOR    Labor constraint
price1   We set price 1 equal to a given value to solve for price 2
wage1    Wage function 1
wage2    Wage function 2
;

* Declaring the names of parameters and exogenous variables

PARAMETERS
ALPHA    Shift on the utility function
DELTA    Share parameter for good 1
A1       Unit Labor Demand 1
A2       Unit Labor Demand 2
LBAR     Fixed Labor
;

* Parameter assignments

ALPHA=1;
DELTA=0.75;
A1=5;
A2=10;
LBAR=200;


* Equation assignments

UTILITY..U=E=ALPHA*C1**DELTA*C2**(1-DELTA);
CONSUMPTION..Y=E=P1*C1+P2*C2;
PRODUCTION..Y=E=P1*Q1+P2*Q2;
AUTARKY1..C1=E=Q1;
AUTARKY2..C2=E=Q2;
OUTPUT1..Q1=E=1/A1*L1;
OUTPUT2..Q2=E=1/A2*L2;
LABOR..LBAR=E=L1+L2;
price1..p1=e=1;
wage1..w1=e=p1/a1;
wage2..w2=e=p2/a2;



* Variable assignments

C1.LO=0;
C2.LO=0;
U.LO=0;
C1.L=7500;
C2.L=1250;
U.L=10;



* Declare and assign model

MODEL autarky / ALL /;

* Request a solution

SOLVE autarky USING NLP MAXIMIZING U;

* Problem 2

parameter
P1T
P2T
;
Equations
consumption_trade        Consumption function with parameterized prices
production_trade         Production function with parameterized prices
wage_trade1              wage function with parameterized prices
wage_trade2              wage function with parameterized prices
;


* PROBLEM 1
P1T=1;
P2T=1;

consumption_trade..y=e=p1t*c1+p2t*c2;
production_trade..y=e=p1t*q1+p2t*q2;
wage_trade1..w1=e=p1t/a1;
wage_trade2..w2=e=p2t/a2;


Q1.LO=0;
Q2.LO=0;

MODEL trade / UTILITY, consumption_trade, production_trade,
OUTPUT1, OUTPUT2, LABOR, wage_trade1, wage_trade2 /;

SOLVE trade USING NLP MAXIMIZING U;

* In the model 'trade', we see that the nation specializes entirely in
* producing good 1. This makes sense because the unit labor demand for good 1
* is 5, where as the unit labor demand for good 2 is 10. With prices equal,
* and labor resources fixed, it makes sense that the optimal solution has the
* economy producing 40 units of good 1.


* Problem 2
p1t=2;
p2t=2;

model proportional_trade / utility, consumption_trade, production_trade,
output1, output2, labor, wage_trade1, wage_trade2 /;

solve proportional_trade using nlp maximizing u;

* Comparing trade to proportional trade, we can see that national income
* increased by a factor of 2, but consumption of both goods remained constant.
* We can also see that since, consumption remained constant, social welfare
* remained constant. Trade patterns also did not change.


* Problem 3

p1t=2;
p2t=1;

model export_price_increase / utility, consumption_trade, production_trade,
output1, output2, labor, wage_trade1, wage_trade2 /;

solve export_price_increase using nlp maximizing u;

* Comparing the export price increase model to the trade model, we can see that
* social welfare increased. The national income increased by a factor of 2, but
* since the price of good two did not change, the increased national income
* allowed this nation to increase its consumption of good 2 to 20, from 10.
* We also see that wages of sector 2 increased with the increased price.


* Problem 4

p1t=1;
p2t=1;
a1=1;
a2=2;

model tech_increase / utility, consumption_trade, production_trade,
output1, output2, labor, wage_trade1, wage_trade2 /;

solve tech_increase using nlp maximizing u;

* The nation still speciallizes in production of good 2. An improvement
* in technology in both sectors by a factor of 5 caused consumption  to
* increase by a factor of 5.

*Problem 5

a1=5;
a2=10;
lbar=400;

model stock_increase / utility, consumption_trade, production_trade,
output1, output2, labor, wage_trade1, wage_trade2 /;

solve stock_increase using nlp maximizing u;

* The economy still specializes and exports good 1, and imports good 2.
* Consumption of both goods increased by a factor of 2.

* Problem 6

a1=4;
a2=9;
lbar=200;

model bias_improvement1 / utility, consumption_trade, production_trade,
output1, output2, labor, wage_trade1, wage_trade2 /;

solve bias_improvement1 using nlp maximizing u;

* This did not change the pattern of trade

a1=4;
a2=3;

model bias_improvement2 / utility, consumption_trade, production_trade,
output1, output2, labor, wage_trade1, wage_trade2 /;

solve bias_improvement2 using nlp maximizing u;

* In order to change the pattern of trade, we need to gain comparative
* advantade in good two. By improving the unit labor demands in a way that
* good two is "cheaper" to produce we see that the economy chose to specialize
* in good two instead of good one. This is only the case if the improvement in
* technology is biased in the fact that comparative advantage changes from one
* good to another. A biased improvement can occur without changes in the
* pattern of trade.