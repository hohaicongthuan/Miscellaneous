module featuremap0(
	input clk,
	input rst,

	input [DATA_WIDTH - 1:0] data_in,
	input valid_in,

	output [DATA_WIDTH - 1:0] data_out,
	output valid_out
);
	parameter DATA_WIDTH = 24;
conv2d5x5 #(
	.w0(-0.010422647),
	.w1(0.049680732),
	.w2(0.10491877),
	.w3(-0.0064872177),
	.w4(-0.10267236),
	.w5(-0.0145616755),
	.w6(0.02779623),
	.w7(-0.096954875),
	.w8(0.038690235),
	.w9(-0.009164213),
	.w10(-0.05335179),
	.w11(0.04319133),
	.w12(-0.035408),
	.w13(0.022691827),
	.w14(-0.11052882),
	.w15(-0.04146631),
	.w16(-0.017754931),
	.w17(-0.023775788),
	.w18(0.010651382),
	.w19(-0.114628136),
	.w20(-0.06695101),
	.w21(0.03222686),
	.w22(-0.0055200127),
	.w23(-0.0012792461),
	.w24(-0.041105296),
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
	.w0(-0.06044674),
	.w1(-0.026354859),
	.w2(-0.045939807),
	.w3(-0.0675553),
	.w4(-0.07202159),
	.w5(-0.012322451),
	.w6(0.03506609),
	.w7(0.113849744),
	.w8(0.086189575),
	.w9(-0.045003504),
	.w10(-0.11277402),
	.w11(0.049084637),
	.w12(-0.059876297),
	.w13(0.10277569),
	.w14(-0.0933718),
	.w15(-0.07269548),
	.w16(0.11183506),
	.w17(-0.0060799634),
	.w18(-0.027754687),
	.w19(-0.06830768),
	.w20(-0.11394771),
	.w21(0.1126641),
	.w22(-0.021951348),
	.w23(-0.07250781),
	.w24(-0.088975824),
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
	.w0(-0.09692871),
	.w1(-0.05854886),
	.w2(-0.107524514),
	.w3(-0.021401597),
	.w4(-0.07358788),
	.w5(-0.022172084),
	.w6(0.041710615),
	.w7(0.06528518),
	.w8(0.02601866),
	.w9(0.036210343),
	.w10(0.05793875),
	.w11(-0.10956946),
	.w12(-0.0024548548),
	.w13(0.027045922),
	.w14(0.013433281),
	.w15(-0.096787915),
	.w16(-0.00464118),
	.w17(-0.07256315),
	.w18(-0.09552333),
	.w19(0.004459783),
	.w20(-0.0832744),
	.w21(-0.085367166),
	.w22(0.0900908),
	.w23(-0.056363195),
	.w24(-0.013390802),
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