# Gates-01: Frederic Michael Buberník

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

![Rovnice](https://user-images.githubusercontent.com/124887713/219119659-5d6a003b-0aac-4b2b-86c9-65ea61665cac.PNG)

  
2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of gates is
begin
  f_orig_o <= (not(b_i) and a_i) or (c_i and not(b_i or not(a_i)));
  f_nand_o <= not(not(not(b_i) and a_i) and not(c_i and (not(b_i) and a_i)));
  f_nor_o  <= (not(b_i or not(a_i))) or not(not(c_i) or (b_i or not(a_i)));
end architecture dataflow;
```

3. Complete table with logic functions' values:

   | **c** | **b** |**a** | **f_ORIG** | **f_(N)AND** | **f_(N)OR** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 | 1 | 1 | 1 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 0 | 0 | 0 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |

### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!
![logicke funkcie](https://user-images.githubusercontent.com/124887713/219120502-40ec1442-e1d3-4fd1-af98-aa8962273483.PNG)

V tomto prípade sme použili distribučný zákon. Ľavá strana je nand a pravá strana je nor.

2. Link to your public EDA Playground example:
https://www.edaplayground.com/x/ZQ8N
