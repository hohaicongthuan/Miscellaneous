module featuremap1(
	input clk,
	input rst,

	input [DATA_WIDTH - 1:0] data_in,
	input valid_in,

	output [DATA_WIDTH - 1:0] data_out,
	output valid_out
);
	parameter DATA_WIDTH = 24;
conv2d5x5 #(
	.w0(0.046270773),
	.w1(-0.056019384),
	.w2(0.04646105),
	.w3(-0.03493627),
	.w4(-0.08599189),
	.w5(0.113185845),
	.w6(-0.0147665),
	.w7(-0.112036936),
	.w8(0.08420679),
	.w9(-0.030473983),
	.w10(-0.10479461),
	.w11(0.011361757),
	.w12(0.066653505),
	.w13(0.09473057),
	.w14(0.07402557),
	.w15(-0.063640505),
	.w16(0.07393614),
	.w17(-0.004251875),
	.w18(-0.09260505),
	.w19(-0.008627567),
	.w20(-0.11265057),
	.w21(-0.00036784486),
	.w22(0.041765302),
	.w23(0.0914085),
	.w24(0.021705681),
)
conv2d5x5_inst0(
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.valid_in(valid_in),
	.data_out(data_out),
	.valid_out(valid_out)
);

conv2d5x5 #(
	.w0(0.037514433),
	.w1(0.027878216),
	.w2(0.0008723221),
	.w3(-0.044328835),
	.w4(-0.057221793),
	.w5(-0.09162438),
	.w6(0.034193095),
	.w7(0.008734673),
	.w8(-0.10203691),
	.w9(0.1038173),
	.w10(-0.0114273755),
	.w11(-0.104885764),
	.w12(0.044094704),
	.w13(-0.1111503),
	.w14(0.030227313),
	.w15(-0.054380648),
	.w16(0.102828376),
	.w17(0.08317569),
	.w18(0.11196876),
	.w19(-0.018444123),
	.w20(0.0722438),
	.w21(-0.03463395),
	.w22(0.09278391),
	.w23(-0.066212885),
	.w24(-0.06660973),
)
conv2d5x5_inst1(
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.valid_in(valid_in),
	.data_out(data_out),
	.valid_out(valid_out)
);

conv2d5x5 #(
	.w0(-0.071506836),
	.w1(-0.09593416),
	.w2(0.014324572),
	.w3(0.034024883),
	.w4(-0.1106339),
	.w5(-0.09982121),
	.w6(0.09674898),
	.w7(-0.01814136),
	.w8(0.08299834),
	.w9(0.07587344),
	.w10(-0.07501563),
	.w11(-0.10754793),
	.w12(-0.10036603),
	.w13(0.11040916),
	.w14(0.015016887),
	.w15(-0.025952863),
	.w16(-0.08698201),
	.w17(-0.024329875),
	.w18(-0.0006065042),
	.w19(-0.07145779),
	.w20(0.027118312),
	.w21(0.052095834),
	.w22(0.06752305),
	.w23(0.04631464),
	.w24(-0.09901163),
)
conv2d5x5_inst2(
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.valid_in(valid_in),
	.data_out(data_out),
	.valid_out(valid_out)
);

endmodule