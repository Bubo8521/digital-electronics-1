# Lab 4: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME

## Pre-Lab preparation

The Nexys A7 board provides two four-digit common anode seven-segment LED displays (configured to behave like a single eight-digit display).

1. See [schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of 7-segment displays, ie to which FPGA pins are connected and how.

2. Complete the decoder truth table for **common anode** 7-segment display.

   | **Symbol** | **Inputs** | **a** | **b** | **c** | **d** | **e** | **f** | **g** |
   | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
   | 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
   | 2 |      |   |   |   |   |   |   |   |
   | 3 |      |   |   |   |   |   |   |   |
   | 4 |      |   |   |   |   |   |   |   |
   | 5 |      |   |   |   |   |   |   |   |
   | 6 |      |   |   |   |   |   |   |   |
   | 7 |      |   |   |   |   |   |   |   |
   | 8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
   | 9 |      |   |   |   |   |   |   |   |
   | A |      |   |   |   |   |   |   |   |
   | b |      |   |   |   |   |   |   |   |
   | C |      |   |   |   |   |   |   |   |
   | d |      |   |   |   |   |   |   |   |
   | E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
   | F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |

   > ![7-Segment-Display-Number-Formation-Segment-Contol](https://user-images.githubusercontent.com/124887713/222206616-62f5e470-242f-4046-8fbb-302e05eaf27c.png)
   >
   > The image above was used from website: [How Seven Segment Display Works & Interface it with Arduino](https://lastminuteengineers.com/seven-segment-arduino-tutorial/).
   >

<a name="part1"></a>

### LED(7:4) indicators

1. Complete the truth table for LEDs(7:4) according to comments in source code.

   | **Hex** | **Inputs** | **LED4** | **LED5** | **LED6** | **LED7** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0000 |  |  |  |  |
   | 1 | 0001 |  |  |  |  |
   | 2 |      |  |  |  |  |
   | 3 |      |  |  |  |  |
   | 4 |      |  |  |  |  |
   | 5 |      |  |  |  |  |
   | 6 |      |  |  |  |  |
   | 7 |      |  |  |  |  |
   | 8 | 1000 |  |  |  |  |
   | 9 |      |  |  |  |  |
   | A |      |  |  |  |  |
   | b |      |  |  |  |  |
   | C |      |  |  |  |  |
   | d |      |  |  |  |  |
   | E | 1110 |  |  |  |  |
   | F | 1111 |  |  |  |  |

2. Listing of LEDs(7:4) part of VHDL architecture from source file `top.vhd`. Try to write logic functions as simple as possible. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   ```vhdl
   --------------------------------------------------------------------
   -- Experiments on your own: LED(7:4) indicators

   -- Turn LED(4) on if input value is equal to 0, ie "0000"
   -- LED(4) <= WRITE YOUR CODE HERE

   -- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
   -- LED(5) <= WRITE YOUR CODE HERE

   -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
   -- LED(6) <= WRITE YOUR CODE HERE

   -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
   -- LED(7) <= WRITE YOUR CODE HERE
   ```

3. Screenshot with simulated time waveforms for LED(7:4). Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure]()