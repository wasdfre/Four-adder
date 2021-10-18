module segment (seg_data_1,seg_data_2,seg_led_1,seg_led_2);
 
	input [3:0] seg_data_1;						//数码管需要显示0~9十个数字，所以最少需要4位输入做译码					//小脚丫上第二个数码管
	input seg_data_2;
	output [8:0] seg_led_1;						//在小脚丫上控制一个数码管需要9个信号 MSB~LSB=DIG、DP、G、F、E、D、C、B、A
	output [8:0] seg_led_2;						//在小脚丫上第二个数码管的控制信号  MSB~LSB=DIG、DP、G、F、E、D、C、B、A
 
  reg [8:0] seg [9:0];                                 
   wire [4:0] sum ;
	assign sum=~{seg_data_2,seg_data_1};  //注意这里的取反，真实值是反的
        initial                                                         //在过程块中只能给reg型变量赋值，Verilog中有两种过程块always和initial
                                                                        //initial和always不同，其中语句只执行一次
	    begin
         seg[0] = 9'h3f;                                           //对存储器中第一个数赋值9'b00_0011_1111,相当于共阴极接地，DP点变低不亮，7段显示数字  0
	      seg[1] = 9'h06;                                           //7段显示数字  1
	      seg[2] = 9'h5b;                                           //7段显示数字  2
	      seg[3] = 9'h4f;                                           //7段显示数字  3
	      seg[4] = 9'h66;                                           //7段显示数字  4
	      seg[5] = 9'h6d;                                           //7段显示数字  5
	      seg[6] = 9'h7d;                                           //7段显示数字  6
	      seg[7] = 9'h07;                                           //7段显示数字  7
	      seg[8] = 9'h7f;                                           //7段显示数字  8
	      seg[9] = 9'h6f;                                           //7段显示数字  9
            end
 shuchishu
        assign seg_led_1 = seg[sum/10];                         //mod 10 
        assign seg_led_2 = seg[sum%10];
 
endmodule