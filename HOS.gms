* Specific Factors Model

SET I Goods /1, 2/;
SET J Factors /K, L /;
ALIAS(J,JJ);

VARIABLES
Q(I)     Output
F(I,J)   Factor use
Y        GDP
;

EQUATIONS
PRODUCT(I)       Production functions
INCOME           Income definition
RESOURCE(J)      Resource constraints
;

PARAMETERS
ALPHA(I)         Productivity
BETA(I,J)        Share
P(I)             Prices
FBAR(J)          Endowments
FO(I,J)          Initial factor use
;

P(I)=1;
FO('1','L')=250;
FO('2','L')=750;
FO('1','K')=750;
FO('2','K')=250;
FBAR(J)=SUM(I$FO(I,J), FO(I,J));
BETA(I,J)=FO(I,J)/SUM(JJ, FO(I,JJ));
ALPHA(I)=SUM(J, FO(I,J))/PROD(J$FO(I,J), FO(I,J)**BETA(I,J));

Q.L(I)=SUM(J, FO(I,J));
F.L(I,J)=FO(I,J);
Y.L=SUM(J, FBAR(J));
Q.LO(I)=0;
F.LO(I,J)=0;
Y.LO=0;
F.FX(I,J)$(FO(I,J)=0)=0;

INCOME..Y=E=SUM(I, P(I)*Q(I));
PRODUCT(I)..Q(I)=E=ALPHA(I)*PROD(J$FO(I,J), F(I,J)**BETA(I,J));
RESOURCE(J)..SUM(I$FO(I,J), F(I,J))=E=FBAR(J);

MODEL SPF /ALL/;
SOLVE SPF USING NLP MAXIMIZING Y;


* Problem 1

P('1')=1.25;
P('2')=1;


MODEL P1INCREASE25 /ALL/;
SOLVE P1INCREASE25 USING NLP MAXIMIZING Y;

P('1')=1.5;

MODEL P1INCREASE50 /ALL/;
SOLVE P1INCREASE50 USING NLP MAXIMIZING Y;

P('1')=1.75;

MODEL P1INCREASE75 /ALL/;
SOLVE P1INCREASE75 USING NLP MAXIMIZING Y;

* As price one increases disproportionately compared to price two, we see that
* the quantity of good one produced is increasing, while production of good two
* is decreasing. When Price one is about 75% higher than price two, the economy
* specializes entirely in good one.

* When price 1 is 1.25, rent is 1.398, and wage is 0.894. Capital and labor got
* shifted to sector 1. k1=885, k2=115, L1=460, L2=540. This economy
* produces 1320 units of good 1 and 643 units of good 2.

* When price 1 is 1.5, rent is 1.837, and wage is 0.816. Capital and labor
* shifted to sector 1 even more. k1=960, k2=40, L1=720, L2=280. Since sector 2
* is labor intensive, it can still produce an optimal amount, with a very small
* amount of capital, and relatively large amount of labor. The labor to capital
* ratio is 7 in sector 2. The labor to capital ratio in sector 1 is 0.75.
* The economy produces 1565 units of good 1 and 306 units of good 2.

* When price 1 is 1.75, rent is 2.303, and wage is 0.768. The economy completely
* specializes in sector 1. The economy produces 1755 units of good 1.

* Were I to increase the price disproportionately in favor of good 2, we would
* see eventual specialization in good 2.


* Problem 2

P(I)=1;
FO('1','L')=200;
FO('2','L')=600;
FBAR(J)=SUM(I$FO(I,J), FO(I,J));

Q.L(I)=SUM(J, FO(I,J));
F.L(I,J)=FO(I,J);
Y.L=SUM(J, FBAR(J));
Q.LO(I)=0;
F.LO(I,J)=0;
Y.LO=0;
F.FX(I,J)$(FO(I,J)=0)=0;

MODEL LbarDECREASE200 /ALL/;
SOLVE LbarDECREASE200 USING NLP MAXIMIZING Y;

* Sector 1 produces 1100 units, sector 2 produces 700 units. Sector 1 requires
* 825 units of capital, and 275 units of labor. Sector 2 requires 175 units of
* capital, and 525 units of labor. The factor prices are both 1.
* Sector 2 is labor intensive, so a decrease in the total labor stock
* would affect sector 2 negatively.


FO('1','K')=600;
FO('2','K')=200;
FO('1','L')=250;
FO('2','L')=750;
FBAR(J)=SUM(I$FO(I,J), FO(I,J));

Q.L(I)=SUM(J, FO(I,J));
F.L(I,J)=FO(I,J);
Y.L=SUM(J, FBAR(J));
Q.LO(I)=0;
F.LO(I,J)=0;
Y.LO=0;
F.FX(I,J)$(FO(I,J)=0)=0;

MODEL KbarDECREASE200 /ALL/;
SOLVE KbarDECREASE200 USING NLP MAXIMIZING Y;

* When we decrease total capital stock by 200, we see that everything we said
* for the decrease of total labor stock by 200 is flipped. Not surprising,
* given that their production functions are symmetric.

FO('1','L')=250;
FO('2','L')=750;
FO('1','K')=750;
FO('2','K')=250;
FBAR(J)=SUM(I$FO(I,J), FO(I,J));
BETA(I,J)=FO(I,J)/SUM(JJ, FO(I,JJ));
ALPHA(I)=2*SUM(J, FO(I,J))/PROD(J$FO(I,J), FO(I,J)**BETA(I,J));

Q.L(I)=SUM(J, FO(I,J));
F.L(I,J)=FO(I,J);
Y.L=SUM(J, FBAR(J));
Q.LO(I)=0;
F.LO(I,J)=0;
Y.LO=0;
F.FX(I,J)$(FO(I,J)=0)=0;

MODEL PRODUCTIVITY2 /ALL/;
SOLVE PRODUCTIVITY2 USING NLP MAXIMIZING Y;
Display ALPHA;

* From a proportional increase in productivity of both sectors we see that
* wage and rent both doubled. Production of both goods also doubled.
* Allocation of capital and labor remained constant.

ALPHA('1')=3.51;
ALPHA('2')=1.755;
Q.L(I)=SUM(J, FO(I,J));
F.L(I,J)=FO(I,J);
Y.L=SUM(J, FBAR(J));
Q.LO(I)=0;
F.LO(I,J)=0;
Y.LO=0;
F.FX(I,J)$(FO(I,J)=0)=0;

MODEL PRODdisp /ALL/;
SOLVE PRODdisp USING NLP MAXIMIZING Y;
display ALPHA;

* JUST FOR CURIOSITY I CHECKED WHAT WOULD HAPPEN IF THERE WAS A DISPROPORTIONATE
* INCREASE IN PRODUCTIVITY IN SECTOR 1, WE SEE THAT THERE IS SPECIALIZATION
* IN SECTOR 1 IN THIS CASE.