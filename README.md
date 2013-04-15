Context: Reverse Engineers need to understand Executable and Linkable Format (ELF) files on Linux platforms and Portable Executable (PE) files on Windows platforms. This program, called “KarnEvil”,  has an integer array that is allocated in the .data section of the ELF file. This integer array contains four 4 byte values. The last value is zero, but the first three values have been scrambled. When unscrambled, they will be equivalent to a character array containing “MCA-1811CC66”.  The values were scrambled with an exclusive or operation, using three distinct key values. So, the values need to be XORed as 32 bit integer values.

The values hexadecimal representations of three important dates in U.S. history:
1)	Independence Day – 0x07041776
2)	Japan surrendering in WWII – 0x08141845
3)	Jackie Robinson breaking the color barrier in baseball – 0x041519947

They are given in the comment section of the ELF file. Right there in plain text. The contestant simply needs to find the values in the comment section and then perform the XOR operation on the three values in the integer array.

Solution: 
1.	Run gdb and perform the XOR operations
    a.	gdb KarnEvil
    b.	b main
        i.	“b” means set a break point, the break point is set in the main subroutine in this case.
    c.	r
        i.	“r” means run the program
    d.	p & intArray 
        i.	prints the address of intArray for verification. Addresses will be different, 0x8049780 is used here as an example.
    e.	set *((int *) 0x8049780) ^= 0x07041776
        i.	The first array element (zeroeth if we are zero based)
    f.	set *((int *) 0x8049784) ^= 0x08141945
        i.	Plus four bytes is the second array element
    g.	set *((int *) 0x8049788) ^= 0x04151947
        i.	Plus four bytes is the third array element
    h.	x/s 0x8049780
        i.	“x” means examine data, with a slash it means examine it as a string
        ii.	which will print the flag: “MCA-1811CC66”
