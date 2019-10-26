## Nand2Tetris_multpliy_16-bits
It is a chip that can achieve multpliy 16 bits in hdl based on N2T.

It will check whether there has any overflow in multiply.
If there is an overflow, then the output bit "of" will be 1, otherwise, "of" is 0.

I will show you this chip's gate diagram and my idea about how to design this chip as well : )

However,

**DO NOT PLAGIARIZE IT IN YOUR COURSEWORK / HOMEWORK!**

### Here is my idea:

0. First make sure both inputs are positive, if not, turn them into positive numbers by negandposconversion
chip. Then send them into positivemult chip.

1. In positivemult chip, each bit of the multi-digit a is multiplied by a multi-digit b (to achieve this, I use
multonebit chip), and each time the multiplied product is shifted to the left by one bit and added to the
previous product (to achieve this, I use shift chip). Then add two products together by Add16check chip.

2. Here are the overflow situations in positivemult. There may happen overflow when we shift and add
products. In positive number, if the one which moved out to the left is 1, there has an overflow. For addition,
if the final FullAdder’s carry (which is ignored in Add16) is 1, there has an overflow. Moreover, as it’s a
positive multiply, if the final multiplies product’s sign bit is 1, there has an overflow. All these will be tested
in chip.

3. After positivemult, we need to identify the sign of output. If a and b are the same signs, the output should
be positive, else, the output is negative. If the output is negative, the product will be turned into its opposite
number by negandposconversion chip.

4. It should be noted here that in order to check the overflow, we convert the negative number into a
positive number for multiplication, and finally check the sign bit to determine the positive or negative of
the output. However, the range of positive and negative values is different that only –(2^15-1)~(2^15-1)
can be detected, so we need to detect -2^15 separately.

5. To check negative bound, I use the boundcheck chip and Mux. If the identifysign show it is a negative
product and the product is equal to -2^15, there won’t occur an overflow. Then use Mux to select the
final output of of.

6. To achieve mult16 and check overflow, I use these sub chips: positivemult, Ng, negandposconversion,
identifysign, shift, Mux16, boundcheck, Add16check, multonebit, checkfinalbit, and some basic chip (And,
Or, Xor...). The more detail will be showed in hdl files.

### Here is the diagram:
![diagram](https://github.com/Can-ZHOU/Nand2Tetris_multpliy_16-bits/blob/master/gate%20diagram.png)
