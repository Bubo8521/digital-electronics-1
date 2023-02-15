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
<img width="909" alt="Snímek obrazovky (21)" src="https://user-images.githubusercontent.com/124879589/218321623-2c2b99df-dee7-45d1-b2b4-3c90cf033b71.png">

Vybral jsem si první distribuční zákon. Levá strana je nand, pravá strana je nor

2. Link to your public EDA Playground example:
https://www.edaplayground.com/x/dzNb
