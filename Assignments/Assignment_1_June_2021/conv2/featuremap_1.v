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
	.w0(-0.059251457),
	.w1(0.05809154),
	.w2(0.06370212),
	.w3(-0.06660859),
	.w4(-0.008448629),
	.w5(-0.0026334682),
	.w6(0.07870962),
	.w7(0.03427551),
	.w8(0.033436704),
	.w9(-0.05361984),
	.w10(0.04695425),
	.w11(0.023961494),
	.w12(0.056949858),
	.w13(-0.00025414876),
	.w14(-0.04600807),
	.w15(-0.076525114),
	.w16(-0.043807436),
	.w17(0.055494238),
	.w18(-0.012049684),
	.w19(-0.01172126),
	.w20(0.031304847),
	.w21(-0.052235965),
	.w22(0.0667424),
	.w23(0.054039095),
	.w24(-0.078486644),
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
	.w0(-0.042468064),
	.w1(-0.04824784),
	.w2(0.033638593),
	.w3(-0.00705502),
	.w4(0.0018026935),
	.w5(-0.04027576),
	.w6(0.00093155436),
	.w7(-0.01665689),
	.w8(0.07287843),
	.w9(-0.03735284),
	.w10(0.04666635),
	.w11(0.00083358766),
	.w12(-0.04087958),
	.w13(-0.062682614),
	.w14(0.030956294),
	.w15(-0.015302342),
	.w16(-0.017181229),
	.w17(0.07771771),
	.w18(-0.032098915),
	.w19(-0.06413614),
	.w20(-0.01603225),
	.w21(-0.02633841),
	.w22(0.014958773),
	.w23(-0.049452204),
	.w24(-0.06834536),
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
	.w0(-0.04671448),
	.w1(-0.012171994),
	.w2(-0.039056692),
	.w3(0.0792565),
	.w4(-0.04385988),
	.w5(-0.016249431),
	.w6(-0.057119463),
	.w7(0.07820079),
	.w8(-0.06942519),
	.w9(0.029097488),
	.w10(-0.06431164),
	.w11(0.0098875845),
	.w12(0.03130513),
	.w13(0.07698711),
	.w14(-0.07659424),
	.w15(0.046720125),
	.w16(-0.08077684),
	.w17(-0.06725175),
	.w18(-0.06587922),
	.w19(0.07062437),
	.w20(0.06780624),
	.w21(-0.03321487),
	.w22(0.038591735),
	.w23(-0.04721215),
	.w24(-0.06513926),
)
conv2d5x5_inst2(
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.valid_in(valid_in),
	.data_out(data_out),
	.valid_out(valid_out)
);

conv2d5x5 #(
	.w0(-0.073685035),
	.w1(-0.0056430055),
	.w2(0.054550964),
	.w3(0.041264314),
	.w4(-0.01742797),
	.w5(-0.036812976),
	.w6(-0.007651249),
	.w7(-0.044622403),
	.w8(0.07818645),
	.w9(0.0073791714),
	.w10(-0.025914842),
	.w11(-0.042958364),
	.w12(0.032441378),
	.w13(-0.022150712),
	.w14(-0.053772207),
	.w15(-0.03887742),
	.w16(0.055034775),
	.w17(-0.07582577),
	.w18(0.046171844),
	.w19(-0.042378046),
	.w20(0.07966777),
	.w21(-0.062584676),
	.w22(0.028125744),
	.w23(0.07652711),
	.w24(0.046557423),
)
conv2d5x5_inst3(
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.valid_in(valid_in),
	.data_out(data_out),
	.valid_out(valid_out)
);

conv2d5x5 #(
	.w0(0.036635604),
	.w1(-0.06706401),
	.w2(-0.023940792),
	.w3(0.04404015),
	.w4(-0.008703595),
	.w5(-0.0021098503),
	.w6(0.062483512),
	.w7(-0.061702706),
	.w8(-0.07817372),
	.w9(0.04918068),
	.w10(-0.011129538),
	.w11(-0.060385525),
	.w12(0.029197158),
	.w13(0.050319273),
	.w14(0.03747139),
	.w15(0.0317296),
	.w16(-0.056611907),
	.w17(-0.0053514903),
	.w18(0.052009195),
	.w19(0.006639949),
	.w20(0.024504296),
	.w21(0.009270536),
	.w22(-0.0050951615),
	.w23(0.013958724),
	.w24(0.06677785),
)
conv2d5x5_inst4(
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.valid_in(valid_in),
	.data_out(data_out),
	.valid_out(valid_out)
);

conv2d5x5 #(
	.w0(0.055577286),
	.w1(0.051871527),
	.w2(0.060271136),
	.w3(0.06656121),
	.w4(-0.041904528),
	.w5(-0.06143781),
	.w6(0.038524877),
	.w7(0.033053655),
	.w8(-0.029688528),
	.w9(0.004155976),
	.w10(-0.04914018),
	.w11(-0.020683354),
	.w12(-0.015198078),
	.w13(0.0775606),
	.w14(-0.04361634),
	.w15(0.062207706),
	.w16(0.034654967),
	.w17(-0.054763183),
	.w18(-0.05820059),
	.w19(-0.026793486),
	.w20(0.065247804),
	.w21(0.023541285),
	.w22(-0.044401854),
	.w23(-0.06121556),
	.w24(-0.07623823),
)
conv2d5x5_inst5(
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.valid_in(valid_in),
	.data_out(data_out),
	.valid_out(valid_out)
);

endmodule