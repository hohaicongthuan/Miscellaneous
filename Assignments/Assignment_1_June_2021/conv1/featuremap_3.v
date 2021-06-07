module featuremap3(
	input clk,
	input rst,

	input [DATA_WIDTH - 1:0] data_in,
	input valid_in,

	output [DATA_WIDTH - 1:0] data_out,
	output valid_out
);
	parameter DATA_WIDTH = 24;
conv2d5x5 #(
	.w0(0.005289406),
	.w1(0.046010956),
	.w2(-0.09546393),
	.w3(-0.017749287),
	.w4(-0.044680562),
	.w5(0.076098524),
	.w6(0.014410314),
	.w7(0.08313962),
	.w8(-0.031949148),
	.w9(-0.02413141),
	.w10(-0.0010079497),
	.w11(0.05338038),
	.w12(-0.059164807),
	.w13(0.093651384),
	.w14(0.098482855),
	.w15(0.06162755),
	.w16(0.072844125),
	.w17(-0.111094266),
	.w18(-0.102842346),
	.w19(0.075119555),
	.w20(-0.026132978),
	.w21(0.012287694),
	.w22(-0.1096901),
	.w23(0.10592997),
	.w24(0.047065005),
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
	.w0(0.10872816),
	.w1(0.07245057),
	.w2(0.021749454),
	.w3(0.002306233),
	.w4(0.081650324),
	.w5(0.11501795),
	.w6(0.08986692),
	.w7(0.02796221),
	.w8(-0.040609516),
	.w9(0.015369412),
	.w10(0.0790861),
	.w11(-0.054021616),
	.w12(0.019180184),
	.w13(0.039971437),
	.w14(-0.07176369),
	.w15(-0.08995478),
	.w16(-0.035633817),
	.w17(0.019373722),
	.w18(0.0005729724),
	.w19(0.09656105),
	.w20(0.0031276792),
	.w21(-0.054475572),
	.w22(-0.04844792),
	.w23(-0.013289945),
	.w24(0.008898795),
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
	.w0(-0.07880388),
	.w1(-0.10759029),
	.w2(-0.026167613),
	.w3(0.08532621),
	.w4(-0.04661117),
	.w5(-0.041562352),
	.w6(0.06551392),
	.w7(-0.11211205),
	.w8(0.10177669),
	.w9(0.01425627),
	.w10(-0.09775627),
	.w11(0.096620835),
	.w12(0.09996234),
	.w13(-0.07935963),
	.w14(-0.007326173),
	.w15(0.019297326),
	.w16(0.11125018),
	.w17(0.10881609),
	.w18(-0.06175017),
	.w19(0.07278605),
	.w20(-0.06334491),
	.w21(-0.04576379),
	.w22(-0.025591845),
	.w23(-0.010154916),
	.w24(-0.020836182),
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