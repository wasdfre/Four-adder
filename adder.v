//该过程需要注意的是按键与拨码输入值的不同
	module adder(num1,num2,sum,seg_led_1,seg_led_2,cout);
	
	input [3:0]num1;
	input [3:0]num2;
	
	output cout;
	output [3:0]sum;
	output [8:0] seg_led_1;					
	output [8:0] seg_led_2;
	
	wire[3:0]temp_cin;
	wire[3:0]temp_num2;
	wire[3:0]temp_num1;
	wire[3:0]temp_sum;
	wire cin=1;//全0
	
	assign temp_num2=num2;
	assign temp_num1=num1;
	add u1(//第一位加法器
		.a(temp_num1[0]),
		.b(temp_num2[0]),
		.cin(cin),//输入前一位进位信号
		.sum(temp_sum[0]),//输出第一位的和
		.cout(temp_cin[0]),//输出该位进位信号
	 );
	 //接下来同理
	 add u2(
	 	.a(temp_num1[1]),
		.b(temp_num2[1]),
		.cin(temp_cin[0]),//输入前一位进位信号
		.sum(temp_sum[1]),//输出第一位的和
		.cout(temp_cin[1]),//输出该位进位信号
	 );
	
	  add u3(
	 	.a(temp_num1[2]),
		.b(temp_num2[2]),
		.cin(temp_cin[1]),//输入前一位进位信号
		.sum(temp_sum[2]),//输出第一位的和
		.cout(temp_cin[2]),//输出该位进位信号
	 );
	
	  add u4(
	 	.a(temp_num1[3]),
		.b(temp_num2[3]),
		.cin(temp_cin[2]),//输入前一位进位信号
		.sum(temp_sum[3]),//输出第一位的和
		.cout(temp_cin[3]),//输出该位进位信号
	 );
		segment s1(
		.seg_data_1(temp_sum),
		.seg_data_2(cout),
		.seg_led_1(seg_led_1),
		.seg_led_2(seg_led_2));
		
	 assign sum=temp_sum;
	 assign cout=temp_cin[3]; 
//	 endgenerate
 endmodule