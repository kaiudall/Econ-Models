set I Goods /1,2/;

Variables
Q(I)     Production of good i
L(I)     Amount of Labor in industry i
Y        GDP
W(I)     Wage for industry i
R(I)     Rent for industry i
;

Parameters
Lbar             Amount of Resources
K(I)             Capital type i
Beta(I)          Production Shares
Alpha(I)         Scale parameter for GDP
P(I)             Prices
;


Equations
Production(I)            Production function for good i
Labor                    Labor Allocation
Income                   GDP function
Wage(I)                  Wage function
Rent(I)                  Rent Function;

Y.L=800;
Lbar = 800;
K('1') = 200;
K('2') = 600;
Beta('1') = 0.25;
Beta('2') = 0.75;
Alpha(I) = 800/455.9013;
P(I) = 1;
L.L(I) = 200;
Q.L(I) = 800;


Wage(I)..W(I)=E=P(I)*Alpha(I)*((1-Beta(I))*K(I)**Beta(I))*L(I)**(-1*Beta(I));
Rent(I)..R(I)=E=P(I)*Alpha(I)*Beta(I)*(K(I)**(Beta(I)-1))*L(I)**(1-Beta(I));
Production(I)..Q(I)=E=Alpha(I)*L(I)**(1-Beta(I))*K(I)**Beta(I);
Labor..Lbar=E=sum(I, L(I));
Income..Y=E=Sum(I, P(I)*Q(I));

model Specific /All/;
Solve Specific using NLP maximizing Y;

* Initially Production is 800 in both sectors, labor is 600 in sector 1,
* 200 in sector 2. Rent and Wage are both equal to 1.

* Problem 1

* Disproportionate increase in prices of goods
P('1')=2;
P('2')=1.5;

model price1Inc /All/;
solve price1Inc using NLP maximizing Y;


* The price1Inc model shows that Labor was reallocated, with an increase of
* about 80 in sector 2 (decrease of 80 in sector 1). This change in Labor
* allocation, changed the amount of each good that was produced. There was an
* increase in production of sector 2, (decrease in sector 1.)

* Wages are 1.953 for both sectors. Rent is 2.147 in sector 1, 1.374 in
* sector 2. This makes sense becuase an increase in prices of goods would
* increase the value of each good, and make the capital and labor more
* valuable.

P('1')=1.5;
P('2')=2;

model price2Inc /All/;
solve price2Inc Using NLP maximizing Y;



* This disproportionate price increase increased GDP and changed where Labor
* was allocated. The change in Labor allocation caused a change in production
* of the two goods. The economomy now produces more of good 2 than good 1.
* There was no change in technology, so this must have been caused by the
* increased labor in sector 2.

* Wages are 1.555 in both sectors.
* Rent is 1.348 in sector 1, and 2.175 in sector 2.

* Problem 2

P(I)=1;
K('1')=100;
K('2')=600;

* Disproportionate decrease in availability to capital in sector 1


model k1Decrease /ALL/;
solve k1Decrease using NLP maximizing Y;

* The first obvious change is the fact that GDP decreased, and the production of
* good 1 decreased.
* Labor decreased in sector 1, but only by about 45 units. The technology
* function for sector 1 shows that it takes a lot more labor to produce good 1
* than capital. This would make sense, as production of good 1 only decreased by
* about 20%, even though the available capital decreased by 50%.
* Since sector 1 did lose significant capital, it would not be efficient to
* keep the same amount of labor. In order to satisfy the full employment
* constraint, labor moves to sector 2 and boosts the amount that can be
* produced there.

* Wages in both sectors decreased to 0.858. This means that each unit of labor
* is less efficient relative to the initial model.
* Rent in both sectors increased, but more so in sector 1. R1 = 1.585, R2=1.053


* Decrease in capital in sector 2
K('1')=200;
K('2')=300;

model k2decrease /ALL/;
solve k2decrease using NLP maximizing Y;

* Labor in sector 1 increased by about 95 units. This caused production
* of good 1 to increase to 893, and production of good 2 to decrease to
* 404. Capital in sector 2 decreased by half, labor decreased by 95, and this
* resulted in a change in production to nearly half of its original potential.

* Wages in both sectors = 0.964
* Rent in sector 1 increased to 1.117, sector 2 increased slightly to 1.012


* Decrease in capital in both sectors by a proportionate amount

K('1')=100;
K('2')=300;

model kdecrease /ALL/;
solve kdecrease using NLP maximizing Y;

* In this model, where capital in both sectors decreased,
* we once again see that because of how capital intensive sector 2 is,
* the production of good two decreased much more than the production of good 1
* decreased. Q1 = 730, Q2 = 427. L1 = 670, L2 = 130.  Labor shifted to sector 1
* by about 70 units.

* Wages in both sectors decreased to 0.818.
* Rent in sector 1 increased to 1.826, Rent in sector 2 increased to 1.069.


* Problem 3

* Total Labor decreases

K('1')=200;
K('2')=600;
Lbar=400;

model laborDecrease /ALL/;
solve laborDecrease using NLP maximizing Y;

* Total Labor decreased by 50%.
* In the last section where we were comparing changes in capital, we saw that
* sector two was always effected more. In this section we see the opposite.
* Sector 1 is Labor intensive, as seen by its technology function. So a large
* decrease in the availability of labor will heavily decrease the production of
* good 1.
* Q1 = 415, Q2 = 743
* L1 = 250, L2 = 150
* W1 = 1.244 = W2
* R1 = 0.519, R2 = 0.93
* Rent decreased by almost half in sector 1, because the capital is only
* efficient with a large amount of labor.











