module vga_plot (
	// Inputs
	Clock,
	Reset,
	VolumeOn,
	PitchOn,
	DistortionOn,
	VolumeGo,
	PitchGo,
	DistortionGo,
	EffectGo,
	volume_data,
	pitch_data,
	distortion_data,
	
	//Outputs
	colour,
	x,
	y,
	writeEn	
);

// Inputs
input 		Clock;
input 		Reset;
input 		VolumeOn;
input 		PitchOn;
input 		DistortionOn;
input 		VolumeGo;
input 		PitchGo;
input 		DistortionGo;
input 		EffectGo;
input [6:0]	volume_data;
input [6:0] pitch_data;
input [6:0] distortion_data;

// Outputs
output reg [11:0] colour;
output reg  [7:0] x;
output reg 	[6:0] y;
output reg			writeEn;

integer index;
integer sub_index;

always @(posedge Clock)
begin
	writeEn <= 1'b0;
	if (VolumeOn) begin
		for (index=25; index<=41; index=index+1) begin
			for (sub_index=21; sub_index<=27; sub_index=sub_index+1) begin
				x[7:0] <= index;
				y[6:0] <= sub_index;
				colour[11:0] <= 12'h9d5;
				writeEn <= 1'b1;
			end
		end
		
		for (index=51; index>=38; index=index-1) begin
			x[7:0] <= 33;
			y[6:0] <= index;
			colour[11:0] <= 12'ha35;
			writeEn <= 1'b1;
		end
		
	end else begin
		for (index=25; index<=41; index=index+1) begin
			for (sub_index=21; sub_index<=27; sub_index=sub_index+1) begin
				x[7:0] <= index;
				y[6:0] <= sub_index;
				colour[11:0] <= 12'h000;
				writeEn <= 1'b1;
			end
		end
		
		for (index=25; index<=41; index=index+1) begin
			x[7:0] <= 33;
			y[6:0] <= index;
			colour[11:0] <= 12'ha35;
			writeEn <= 1'b1;
		end
	end
end




endmodule
