module featuremap13(
	input clk,
	input rst,

	input [DATA_WIDTH - 1:0] data_in,
	input valid_in,

	output [DATA_WIDTH - 1:0] data_out,
	output valid_out
);
	parameter DATA_WIDTH = 24;
conv2d5x5 #(
	.w0(-0.06925432),
	.w1(0.06679514),
	.w2(-0.08053363),
	.w3(-0.040378224),
	.w4(-0.0678878),
	.w5(-0.017576998),
	.w6(-0.03551902),
	.w7(-0.032635294),
	.w8(-0.025450032),
	.w9(-0.07292045),
	.w10(-0.01313341),
	.w11(0.040569883),
	.w12(-0.048718452),
	.w13(-0.070422165),
	.w14(-0.033132274),
	.w15(0.051548406),
	.w16(-0.06624556),
	.w17(0.039145652),
	.w18(0.032326426),
	.w19(0.019284295),
	.w20(-0.044588745),
	.w21(0.056927316),
	.w22(-0.04564847),
	.w23(-0.022024762),
	.w24(-0.048577882),
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
	.w0(0.0462395),
	.w1(-0.014431329),
	.w2(-0.01364928),
	.w3(-0.035332527),
	.w4(0.07894455),
	.w5(-0.0024017256),
	.w6(-0.04270033),
	.w7(0.02119792),
	.w8(-0.0055495943),
	.w9(-0.03937509),
	.w10(-0.073918864),
	.w11(0.06320756),
	.w12(-0.0280795),
	.w13(0.060082942),
	.w14(0.034941856),
	.w15(-0.02589008),
	.w16(-0.0610597),
	.w17(0.035901707),
	.w18(-0.043386146),
	.w19(0.025033405),
	.w20(-0.075173505),
	.w21(0.012909085),
	.w22(0.008407329),
	.w23(-0.08014732),
	.w24(-0.05647088),
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
	.w0(-0.0025503838),
	.w1(0.07702059),
	.w2(0.06969633),
	.w3(0.049737994),
	.w4(-0.023302417),
	.w5(-0.050430555),
	.w6(0.05256837),
	.w7(0.01762699),
	.w8(-0.020084409),
	.w9(0.015019432),
	.w10(0.06620641),
	.w11(-0.053816453),
	.w12(-0.00014028746),
	.w13(-0.06679417),
	.w14(-0.0067244833),
	.w15(-0.006823813),
	.w16(-0.057301953),
	.w17(-0.014370622),
	.w18(-0.022157975),
	.w19(0.07410269),
	.w20(0.017707864),
	.w21(-0.08089764),
	.w22(-0.006244734),
	.w23(0.07141283),
	.w24(0.046562135),
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
	.w0(0.059768807),
	.w1(0.060487103),
	.w2(0.010931988),
	.w3(-0.07209103),
	.w4(-0.078759104),
	.w5(-0.057781745),
	.w6(0.03669701),
	.w7(0.06855626),
	.w8(-0.05089733),
	.w9(-0.077538714),
	.w10(-0.014105222),
	.w11(-0.03665696),
	.w12(-0.033044342),
	.w13(-0.05682937),
	.w14(-0.015246365),
	.w15(-0.021003408),
	.w16(0.076121785),
	.w17(-0.07796719),
	.w18(-0.022243306),
	.w19(-0.059084132),
	.w20(-0.010458808),
	.w21(0.035252966),
	.w22(-0.043773856),
	.w23(-0.069058),
	.w24(0.06187024),
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
	.w0(0.028256988),
	.w1(-0.065701336),
	.w2(-0.038252596),
	.w3(0.026090024),
	.w4(-0.07610501),
	.w5(-0.05716742),
	.w6(-0.025098443),
	.w7(0.00710249),
	.w8(0.027015902),
	.w9(0.003506739),
	.w10(0.0009483347),
	.w11(0.050720435),
	.w12(0.0030449866),
	.w13(0.0806029),
	.w14(0.050659817),
	.w15(0.076344445),
	.w16(0.018735215),
	.w17(0.029694272),
	.w18(0.05599213),
	.w19(-0.004251821),
	.w20(-0.08164054),
	.w21(-0.013726602),
	.w22(-0.035824113),
	.w23(-0.032099646),
	.w24(-0.055561554),
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
	.w0(-0.021886177),
	.w1(-0.024290863),
	.w2(-0.021756608),
	.w3(0.074246176),
	.w4(0.040506218),
	.w5(-0.066066645),
	.w6(0.0066030985),
	.w7(0.025762085),
	.w8(-0.0029275822),
	.w9(0.021163346),
	.w10(0.035981443),
	.w11(-0.08000711),
	.w12(0.04567443),
	.w13(-0.026128948),
	.w14(-0.056484923),
	.w15(-0.05027019),
	.w16(0.041616574),
	.w17(-0.05642919),
	.w18(-0.03437152),
	.w19(0.04892757),
	.w20(-0.04046425),
	.w21(0.06740294),
	.w22(0.046696115),
	.w23(0.033219054),
	.w24(-0.010925759),
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