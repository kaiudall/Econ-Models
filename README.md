# Econ-Models
This repository contains economic trade models that are simulated in GAMS. GAMS is a programming language that was designed for solving optimization problems that typically cannot be solved in algebraic closed form.
1. [Simulation of the Ricardian Model](https://github.com/kaiudall/Econ-Models/blob/master/ricardian.gms) 

The Ricardian model is a simple trade model, where production is only thought of in terms of the labor required to produce it. The simulation shown here has two nations and two goods. Each nation has a comparative advantage, and shows preference to each good according to a cobb-douglas utility function. Through several different models, we see how wages, GDP, social welfare, consumption of goods, and labor allocation get affected through price shocks and general changes in labor productivity. In the ricardian model, it is pretty easy to set up cases where both nations choose to specialize and will export excess of one good, and import their desired quantity of the other good.


2. [Simulation of the Specific Factors Model](https://github.com/kaiudall/Econ-Models/blob/master/Specific%20Factors.gms)

The Specific Factors Model is set up similarly to the Ricardian, with a slight alteration. In production of goods, labor and capital are both used to produce a good. Capital is industry specific, so it cannot be allocated to different industries. Through this simulation we see what happens to production of goods, GDP, rent, wages as total labor, factor specific capital, and market prices of goods change.

3. [Simulation of the Heckscher-Ohlin-Samuelson Model](https://github.com/kaiudall/Econ-Models/blob/master/HOS.gms)

The HOS model allows for complete freedom of labor and capital allocation. The simulation shows what happens to an economy as productivity, prices of goods, and access to labor and capital change.
