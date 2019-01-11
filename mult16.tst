load mult16.hdl,
output-file mult16.out,
compare-to mult16.cmp,
output-list a%B1.16.1 b%B1.16.1 out%B1.16.1 of%B1.1.1;
 
set a %B0000000000000000,//0
set b %B0000000000000000,//0
eval,			//0
output;
 
set a %B0000000000000001,//1
set b %B0000000000000001,//1
eval,			//1
output;
 
set a %B0000000000000010,//2
set b %B0000000000000010,//2
eval,			//4
output;
 
set a %B0000000010110101,//181
set b %B0000000010110101,//181
eval,			//32761
output;

set a %B0000001000000000,//512
set b %B0000001000000000,//512
eval,			//overflow
output;

set a %B0000001000011111,//543
set b %B0000000001111011,//123
eval,			//overflow
output;

set a %B0100000000000000,//16384
set b %B0000000000000010,//2
eval,			//overflow
output;

set a %B1111111111111110,//-2
set b %B1111111111101100,//-20
eval,			//40
output;

set a %B1111111110011101,//-99
set b %B1111111110011101,//-99
eval,			//9801
output;

set a %B1111111000000000,//-512
set b %B1111111000000000,//-512
eval,			//overflow
output;

set a %B0000000000000011,//3
set b %B1111111111101100,//-20
eval,			//-60
output;

set a %B1111111111101100,//-20
set b %B0000000000000011,//3
eval,			//-60
output;

set a %B0100000000000000,//16384
set b %B1111111111111110,//-2
eval,			//-32768
output;

set a %B0000000010110111,//183
set b %B1111111101001001,//-183
eval,			//overflow
output;



 
