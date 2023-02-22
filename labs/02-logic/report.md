# Logic-02: Frederic Michael Buberník

## Pre-Lab preparation

1.The truth table for 2-bit Identity comparator (B equals A), and two Magnitude comparators (B is greater than A, B is less than A).

 | **Dec.equivalent** | **B[1:0]** | **A[1:0]** | **B>A** | **B=A** | **B<A** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 00 | 00 | 0 | 1 | 0 |
   | 1 | 00 | 01 | 0 | 0 | 1 |
   | 2 | 00 | 10 | 0 | 0 | 1 |
   | 3 | 00 | 11 | 0 | 0 | 1 |
   | 4 | 01 | 00 | 1 | 0 | 0 |
   | 5 | 01 | 01 | 0 | 1 | 0 |
   | 6 | 01 | 10 | 0 | 0 | 1 |
   | 7 | 01 | 11 | 0 | 0 | 1 |
   | 8 | 10 | 00 | 1 | 0 | 0 |
   | 9 | 10 | 01 | 1 | 0 | 0 |
   | 10 | 10 | 10 | 0 | 1 | 0 |
   | 11 | 10 | 10 | 0 | 0 | 1 |
   | 12 | 11 | 00 | 1 | 0 | 0 |
   | 13 | 11 | 01 | 1 | 0 | 0 |
   | 14 | 11 | 10 | 1 | 0 | 0 |
   | 15 | 11 | 11 | 0 | 1 | 0 |
   
## 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

   ![KM1](https://user-images.githubusercontent.com/124887713/220679128-af8bd1e2-3070-414b-a4ff-8d671b37876e.PNG)

   Less than:

   ![KM2](https://user-images.githubusercontent.com/124887713/220679146-27d76bbe-6433-4795-8c8b-089a6617f54e.PNG)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Rovnica1](https://user-images.githubusercontent.com/124887713/220679179-60745fdd-9bdd-4f8c-ab14-ae08778c7897.PNG)
   
   ![Rovnica2](https://user-images.githubusercontent.com/124887713/220679203-789386d6-4848-4d78-b8ae-999ae7be8111.PNG)

3.Link to your public EDA Playground example: 
https://www.edaplayground.com/x/JTfg

## 4-bit comparator

2.Link to your public EDA Playground example:
https://www.edaplayground.com/x/mrGR
