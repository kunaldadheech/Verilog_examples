Barrel shifters are the purely combinatiolnal circuits which are made of multiplexers instead of flipflops. They can shift specefic number of bits in one clk cycle.
hence are used for fast operations in ALUs. An N-bit Barrel Shifter can shift data left or right by N-1 bits. The number of (2x1) multiplexers required is nlog2(n), for a n bit word.

#I have created a 4 bit left/right shift barrel shifter which i intend to upgrade in near future to make it mode configurable.
