module featuremap9(
	input clk,
	input rst,

	input [DATA_WIDTH - 1:0] data_in,
	input valid_in,

	output [DATA_WIDTH - 1:0] data_out,
	output valid_out
);
	parameter DATA_WIDTH = 24;
conv2d5x5 #(
	.w0(-0.030750774),
	.w1(0.032515906),
	.w2(0.05860475),
	.w3(0.058396243),
	.w4(0.015124114),
	.w5(-0.043063443),
	.w6(0.033118248),
	.w7(0.06572343),
	.w8(-0.042106867),
	.w9(-0.04465569),
	.w10(-0.057572532),
	.w11(0.06393491),
	.w12(-0.07761201),
	.w13(0.01796139),
	.w14(-0.04484017),
	.w15(-0.02045821),
	.w16(-0.024925198),
	.w17(0.068592645),
	.w18(-0.07991268),
	.w19(0.0110703),
	.w20(-0.010299482),
	.w21(-0.01920599),
	.w22(-0.018966442),
	.w23(-0.02940704),
	.w24(-0.024369061),
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
	.w0(0.0055898903),
	.w1(-0.05035449),
	.w2(-0.006857364),
	.w3(0.012348129),
	.w4(0.01793652),
	.w5(-0.05478016),
	.w6(-0.013093853),
	.w7(-0.014821036),
	.w8(0.08058224),
	.w9(-0.051535685),
	.w10(-0.015719632),
	.w11(-0.033104435),
	.w12(0.03772303),
	.w13(0.018346395),
	.w14(-0.054554217),
	.w15(-0.011843803),
	.w16(-0.06765642),
	.w17(-0.06545109),
	.w18(0.033467006),
	.w19(0.081470326),
	.w20(-0.058501296),
	.w21(-0.014208659),
	.w22(-0.0131945945),
	.w23(0.0630308),
	.w24(0.018810377),
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
	.w0(0.059761856),
	.w1(0.010309751),
	.w2(0.05422107),
	.w3(0.0013893745),
	.w4(-0.03394725),
	.w5(-0.004792034),
	.w6(0.047580685),
	.w7(-0.03178189),
	.w8(-0.042855725),
	.w9(0.08060197),
	.w10(0.024464691),
	.w11(-0.050166935),
	.w12(-0.009602201),
	.w13(-0.008806574),
	.w14(0.048207495),
	.w15(-0.051491495),
	.w16(0.03597094),
	.w17(0.069318146),
	.w18(-0.0024943585),
	.w19(-0.057997562),
	.w20(-0.029430643),
	.w21(-0.027630694),
	.w22(-0.074527465),
	.w23(0.064833194),
	.w24(0.058829922),
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
	.w0(0.0510237),
	.w1(0.01346929),
	.w2(-0.060033176),
	.w3(-0.061353132),
	.w4(-0.04974728),
	.w5(0.05899071),
	.w6(0.01783178),
	.w7(0.07593696),
	.w8(0.0035548997),
	.w9(0.0014771405),
	.w10(-0.010707157),
	.w11(0.06041156),
	.w12(0.05250119),
	.w13(0.025253009),
	.w14(0.025347803),
	.w15(-0.076783106),
	.w16(0.017905656),
	.w17(-0.032441065),
	.w18(-0.062178522),
	.w19(0.010928192),
	.w20(0.014562215),
	.w21(-0.020097414),
	.w22(0.04237323),
	.w23(0.0051775933),
	.w24(-0.040980168),
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
	.w0(-0.07600312),
	.w1(0.06484781),
	.w2(0.024488043),
	.w3(0.021094542),
	.w4(0.07942915),
	.w5(0.07037971),
	.w6(-0.032416),
	.w7(-0.03431527),
	.w8(0.033135816),
	.w9(0.018386563),
	.w10(0.0038038802),
	.w11(0.039010935),
	.w12(-0.072209716),
	.w13(0.027314864),
	.w14(-0.07898085),
	.w15(-0.0012976469),
	.w16(-0.022791345),
	.w17(-0.03502101),
	.w18(0.02987648),
	.w19(-0.07634734),
	.w20(-0.056904677),
	.w21(0.05555589),
	.w22(-0.014442718),
	.w23(-0.07499847),
	.w24(0.023164406),
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
	.w0(-0.06995547),
	.w1(-0.03722289),
	.w2(0.0735365),
	.w3(-0.02889877),
	.w4(0.041104637),
	.w5(0.04113368),
	.w6(-0.021153186),
	.w7(-0.009740338),
	.w8(-0.036296483),
	.w9(0.026379503),
	.w10(-0.03847033),
	.w11(0.04357294),
	.w12(-0.014193864),
	.w13(-0.018263943),
	.w14(-0.03554855),
	.w15(0.058440674),
	.w16(-0.066471115),
	.w17(-0.053352416),
	.w18(0.055571336),
	.w19(0.06366353),
	.w20(-0.011043786),
	.w21(-0.010983809),
	.w22(0.023589777),
	.w23(-0.02213477),
	.w24(-0.07098332),
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