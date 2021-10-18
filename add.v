  module add
    (
      input wire a,           //输入的低位进位及两个加数cin、a、b
      input wire b,
      input wire cin,
      output wire sum,        //输出的和与进位
      output wire cout
    );
      wire 		s1,s2,s3;   //定义中间变量
    xor (s1,a,b);                 //调用基本异或门
    xor (sum,s1,cin);
    nand (s2,a,b);		//调用基本与非门
    nand (s3,s1,cin);
    nand  (cout,s2,s3); 
  endmodule
 