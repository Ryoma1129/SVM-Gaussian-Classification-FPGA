module add_table(
	input		[30:0]x,
	output	[29:0]add_x
    );

//input output
wire		[30:0]x;//varies from 0 to 255
reg		[29:0]add_x;

always @(x) begin
	case (x[29:22])
		8'b00000000: add_x<=32'b000000010000000000000000000000; //0
		8'b00000001: add_x<=32'b000000001001010111000000000110; //1
		8'b00000010: add_x<=32'b000000000101001001101001111000; //2
		8'b00000011: add_x<=32'b000000000010101110000000001101; //3
		8'b00000100: add_x<=32'b000000000001011001100011111101; //4
		8'b00000101: add_x<=32'b000000000000101101011101011010; //5
		8'b00000110: add_x<=32'b000000000000010110111001111001; //6
		8'b00000111: add_x<=32'b000000000000001011011111110010; //7
		8'b00001000: add_x<=32'b000000000000000101110000100111; //8
		8'b00001001: add_x<=32'b000000000000000010111000011111; //9
		8'b00001010: add_x<=32'b000000000000000001011100010010; //10
		8'b00001011: add_x<=32'b000000000000000000101110001001; //11
		8'b00001100: add_x<=32'b000000000000000000010111000101; //12
		8'b00001101: add_x<=32'b000000000000000000001011100010; //13
		8'b00001110: add_x<=32'b000000000000000000000101110001; //14
		8'b00001111: add_x<=32'b000000000000000000000010111000; //15
		8'b00010000: add_x<=32'b000000000000000000000001011100; //16
		8'b00010001: add_x<=32'b000000000000000000000000101110; //17
		8'b00010010: add_x<=32'b000000000000000000000000010111; //18
		8'b00010011: add_x<=32'b000000000000000000000000001011; //19
		8'b00010100: add_x<=32'b000000000000000000000000000101; //20
		8'b00010101: add_x<=32'b000000000000000000000000000010; //21
		8'b00010110: add_x<=32'b000000000000000000000000000001; //22
		8'b00010111: add_x<=32'b000000000000000000000000000000; //23
		8'b00011000: add_x<=32'b000000000000000000000000000000; //24
		8'b00011001: add_x<=32'b000000000000000000000000000000; //25
		8'b00011010: add_x<=32'b000000000000000000000000000000; //26
		8'b00011011: add_x<=32'b000000000000000000000000000000; //27
		8'b00011100: add_x<=32'b000000000000000000000000000000; //28
		8'b00011101: add_x<=32'b000000000000000000000000000000; //29
		8'b00011110: add_x<=32'b000000000000000000000000000000; //30
		8'b00011111: add_x<=32'b000000000000000000000000000000; //31
		8'b00100000: add_x<=32'b000000000000000000000000000000; //32
		8'b00100001: add_x<=32'b000000000000000000000000000000; //33
		8'b00100010: add_x<=32'b000000000000000000000000000000; //34
		8'b00100011: add_x<=32'b000000000000000000000000000000; //35
		8'b00100100: add_x<=32'b000000000000000000000000000000; //36
		8'b00100101: add_x<=32'b000000000000000000000000000000; //37
		8'b00100110: add_x<=32'b000000000000000000000000000000; //38
		8'b00100111: add_x<=32'b000000000000000000000000000000; //39
		8'b00101000: add_x<=32'b000000000000000000000000000000; //40
		8'b00101001: add_x<=32'b000000000000000000000000000000; //41
		8'b00101010: add_x<=32'b000000000000000000000000000000; //42
		8'b00101011: add_x<=32'b000000000000000000000000000000; //43
		8'b00101100: add_x<=32'b000000000000000000000000000000; //44
		8'b00101101: add_x<=32'b000000000000000000000000000000; //45
		8'b00101110: add_x<=32'b000000000000000000000000000000; //46
		8'b00101111: add_x<=32'b000000000000000000000000000000; //47
		8'b00110000: add_x<=32'b000000000000000000000000000000; //48
		8'b00110001: add_x<=32'b000000000000000000000000000000; //49
		8'b00110010: add_x<=32'b000000000000000000000000000000; //50
		8'b00110011: add_x<=32'b000000000000000000000000000000; //51
		8'b00110100: add_x<=32'b000000000000000000000000000000; //52
		8'b00110101: add_x<=32'b000000000000000000000000000000; //53
		8'b00110110: add_x<=32'b000000000000000000000000000000; //54
		8'b00110111: add_x<=32'b000000000000000000000000000000; //55
		8'b00111000: add_x<=32'b000000000000000000000000000000; //56
		8'b00111001: add_x<=32'b000000000000000000000000000000; //57
		8'b00111010: add_x<=32'b000000000000000000000000000000; //58
		8'b00111011: add_x<=32'b000000000000000000000000000000; //59
		8'b00111100: add_x<=32'b000000000000000000000000000000; //60
		8'b00111101: add_x<=32'b000000000000000000000000000000; //61
		8'b00111110: add_x<=32'b000000000000000000000000000000; //62
		8'b00111111: add_x<=32'b000000000000000000000000000000; //63
		8'b01000000: add_x<=32'b000000000000000000000000000000; //64
		8'b01000001: add_x<=32'b000000000000000000000000000000; //65
		8'b01000010: add_x<=32'b000000000000000000000000000000; //66
		8'b01000011: add_x<=32'b000000000000000000000000000000; //67
		8'b01000100: add_x<=32'b000000000000000000000000000000; //68
		8'b01000101: add_x<=32'b000000000000000000000000000000; //69
		8'b01000110: add_x<=32'b000000000000000000000000000000; //70
		8'b01000111: add_x<=32'b000000000000000000000000000000; //71
		8'b01001000: add_x<=32'b000000000000000000000000000000; //72
		8'b01001001: add_x<=32'b000000000000000000000000000000; //73
		8'b01001010: add_x<=32'b000000000000000000000000000000; //74
		8'b01001011: add_x<=32'b000000000000000000000000000000; //75
		8'b01001100: add_x<=32'b000000000000000000000000000000; //76
		8'b01001101: add_x<=32'b000000000000000000000000000000; //77
		8'b01001110: add_x<=32'b000000000000000000000000000000; //78
		8'b01001111: add_x<=32'b000000000000000000000000000000; //79
		8'b01010000: add_x<=32'b000000000000000000000000000000; //80
		8'b01010001: add_x<=32'b000000000000000000000000000000; //81
		8'b01010010: add_x<=32'b000000000000000000000000000000; //82
		8'b01010011: add_x<=32'b000000000000000000000000000000; //83
		8'b01010100: add_x<=32'b000000000000000000000000000000; //84
		8'b01010101: add_x<=32'b000000000000000000000000000000; //85
		8'b01010110: add_x<=32'b000000000000000000000000000000; //86
		8'b01010111: add_x<=32'b000000000000000000000000000000; //87
		8'b01011000: add_x<=32'b000000000000000000000000000000; //88
		8'b01011001: add_x<=32'b000000000000000000000000000000; //89
		8'b01011010: add_x<=32'b000000000000000000000000000000; //90
		8'b01011011: add_x<=32'b000000000000000000000000000000; //91
		8'b01011100: add_x<=32'b000000000000000000000000000000; //92
		8'b01011101: add_x<=32'b000000000000000000000000000000; //93
		8'b01011110: add_x<=32'b000000000000000000000000000000; //94
		8'b01011111: add_x<=32'b000000000000000000000000000000; //95
		8'b01100000: add_x<=32'b000000000000000000000000000000; //96
		8'b01100001: add_x<=32'b000000000000000000000000000000; //97
		8'b01100010: add_x<=32'b000000000000000000000000000000; //98
		8'b01100011: add_x<=32'b000000000000000000000000000000; //99
		8'b01100100: add_x<=32'b000000000000000000000000000000; //100
		8'b01100101: add_x<=32'b000000000000000000000000000000; //101
		8'b01100110: add_x<=32'b000000000000000000000000000000; //102
		8'b01100111: add_x<=32'b000000000000000000000000000000; //103
		8'b01101000: add_x<=32'b000000000000000000000000000000; //104
		8'b01101001: add_x<=32'b000000000000000000000000000000; //105
		8'b01101010: add_x<=32'b000000000000000000000000000000; //106
		8'b01101011: add_x<=32'b000000000000000000000000000000; //107
		8'b01101100: add_x<=32'b000000000000000000000000000000; //108
		8'b01101101: add_x<=32'b000000000000000000000000000000; //109
		8'b01101110: add_x<=32'b000000000000000000000000000000; //110
		8'b01101111: add_x<=32'b000000000000000000000000000000; //111
		8'b01110000: add_x<=32'b000000000000000000000000000000; //112
		8'b01110001: add_x<=32'b000000000000000000000000000000; //113
		8'b01110010: add_x<=32'b000000000000000000000000000000; //114
		8'b01110011: add_x<=32'b000000000000000000000000000000; //115
		8'b01110100: add_x<=32'b000000000000000000000000000000; //116
		8'b01110101: add_x<=32'b000000000000000000000000000000; //117
		8'b01110110: add_x<=32'b000000000000000000000000000000; //118
		8'b01110111: add_x<=32'b000000000000000000000000000000; //119
		8'b01111000: add_x<=32'b000000000000000000000000000000; //120
		8'b01111001: add_x<=32'b000000000000000000000000000000; //121
		8'b01111010: add_x<=32'b000000000000000000000000000000; //122
		8'b01111011: add_x<=32'b000000000000000000000000000000; //123
		8'b01111100: add_x<=32'b000000000000000000000000000000; //124
		8'b01111101: add_x<=32'b000000000000000000000000000000; //125
		8'b01111110: add_x<=32'b000000000000000000000000000000; //126
		8'b01111111: add_x<=32'b000000000000000000000000000000; //127
		8'b10000000: add_x<=32'b000000000000000000000000000000; //128
		8'b10000001: add_x<=32'b000000000000000000000000000000; //129
		8'b10000010: add_x<=32'b000000000000000000000000000000; //130
		8'b10000011: add_x<=32'b000000000000000000000000000000; //131
		8'b10000100: add_x<=32'b000000000000000000000000000000; //132
		8'b10000101: add_x<=32'b000000000000000000000000000000; //133
		8'b10000110: add_x<=32'b000000000000000000000000000000; //134
		8'b10000111: add_x<=32'b000000000000000000000000000000; //135
		8'b10001000: add_x<=32'b000000000000000000000000000000; //136
		8'b10001001: add_x<=32'b000000000000000000000000000000; //137
		8'b10001010: add_x<=32'b000000000000000000000000000000; //138
		8'b10001011: add_x<=32'b000000000000000000000000000000; //139
		8'b10001100: add_x<=32'b000000000000000000000000000000; //140
		8'b10001101: add_x<=32'b000000000000000000000000000000; //141
		8'b10001110: add_x<=32'b000000000000000000000000000000; //142
		8'b10001111: add_x<=32'b000000000000000000000000000000; //143
		8'b10010000: add_x<=32'b000000000000000000000000000000; //144
		8'b10010001: add_x<=32'b000000000000000000000000000000; //145
		8'b10010010: add_x<=32'b000000000000000000000000000000; //146
		8'b10010011: add_x<=32'b000000000000000000000000000000; //147
		8'b10010100: add_x<=32'b000000000000000000000000000000; //148
		8'b10010101: add_x<=32'b000000000000000000000000000000; //149
		8'b10010110: add_x<=32'b000000000000000000000000000000; //150
		8'b10010111: add_x<=32'b000000000000000000000000000000; //151
		8'b10011000: add_x<=32'b000000000000000000000000000000; //152
		8'b10011001: add_x<=32'b000000000000000000000000000000; //153
		8'b10011010: add_x<=32'b000000000000000000000000000000; //154
		8'b10011011: add_x<=32'b000000000000000000000000000000; //155
		8'b10011100: add_x<=32'b000000000000000000000000000000; //156
		8'b10011101: add_x<=32'b000000000000000000000000000000; //157
		8'b10011110: add_x<=32'b000000000000000000000000000000; //158
		8'b10011111: add_x<=32'b000000000000000000000000000000; //159
		8'b10100000: add_x<=32'b000000000000000000000000000000; //160
		8'b10100001: add_x<=32'b000000000000000000000000000000; //161
		8'b10100010: add_x<=32'b000000000000000000000000000000; //162
		8'b10100011: add_x<=32'b000000000000000000000000000000; //163
		8'b10100100: add_x<=32'b000000000000000000000000000000; //164
		8'b10100101: add_x<=32'b000000000000000000000000000000; //165
		8'b10100110: add_x<=32'b000000000000000000000000000000; //166
		8'b10100111: add_x<=32'b000000000000000000000000000000; //167
		8'b10101000: add_x<=32'b000000000000000000000000000000; //168
		8'b10101001: add_x<=32'b000000000000000000000000000000; //169
		8'b10101010: add_x<=32'b000000000000000000000000000000; //170
		8'b10101011: add_x<=32'b000000000000000000000000000000; //171
		8'b10101100: add_x<=32'b000000000000000000000000000000; //172
		8'b10101101: add_x<=32'b000000000000000000000000000000; //173
		8'b10101110: add_x<=32'b000000000000000000000000000000; //174
		8'b10101111: add_x<=32'b000000000000000000000000000000; //175
		8'b10110000: add_x<=32'b000000000000000000000000000000; //176
		8'b10110001: add_x<=32'b000000000000000000000000000000; //177
		8'b10110010: add_x<=32'b000000000000000000000000000000; //178
		8'b10110011: add_x<=32'b000000000000000000000000000000; //179
		8'b10110100: add_x<=32'b000000000000000000000000000000; //180
		8'b10110101: add_x<=32'b000000000000000000000000000000; //181
		8'b10110110: add_x<=32'b000000000000000000000000000000; //182
		8'b10110111: add_x<=32'b000000000000000000000000000000; //183
		8'b10111000: add_x<=32'b000000000000000000000000000000; //184
		8'b10111001: add_x<=32'b000000000000000000000000000000; //185
		8'b10111010: add_x<=32'b000000000000000000000000000000; //186
		8'b10111011: add_x<=32'b000000000000000000000000000000; //187
		8'b10111100: add_x<=32'b000000000000000000000000000000; //188
		8'b10111101: add_x<=32'b000000000000000000000000000000; //189
		8'b10111110: add_x<=32'b000000000000000000000000000000; //190
		8'b10111111: add_x<=32'b000000000000000000000000000000; //191
		8'b11000000: add_x<=32'b000000000000000000000000000000; //192
		8'b11000001: add_x<=32'b000000000000000000000000000000; //193
		8'b11000010: add_x<=32'b000000000000000000000000000000; //194
		8'b11000011: add_x<=32'b000000000000000000000000000000; //195
		8'b11000100: add_x<=32'b000000000000000000000000000000; //196
		8'b11000101: add_x<=32'b000000000000000000000000000000; //197
		8'b11000110: add_x<=32'b000000000000000000000000000000; //198
		8'b11000111: add_x<=32'b000000000000000000000000000000; //199
		8'b11001000: add_x<=32'b000000000000000000000000000000; //200
		8'b11001001: add_x<=32'b000000000000000000000000000000; //201
		8'b11001010: add_x<=32'b000000000000000000000000000000; //202
		8'b11001011: add_x<=32'b000000000000000000000000000000; //203
		8'b11001100: add_x<=32'b000000000000000000000000000000; //204
		8'b11001101: add_x<=32'b000000000000000000000000000000; //205
		8'b11001110: add_x<=32'b000000000000000000000000000000; //206
		8'b11001111: add_x<=32'b000000000000000000000000000000; //207
		8'b11010000: add_x<=32'b000000000000000000000000000000; //208
		8'b11010001: add_x<=32'b000000000000000000000000000000; //209
		8'b11010010: add_x<=32'b000000000000000000000000000000; //210
		8'b11010011: add_x<=32'b000000000000000000000000000000; //211
		8'b11010100: add_x<=32'b000000000000000000000000000000; //212
		8'b11010101: add_x<=32'b000000000000000000000000000000; //213
		8'b11010110: add_x<=32'b000000000000000000000000000000; //214
		8'b11010111: add_x<=32'b000000000000000000000000000000; //215
		8'b11011000: add_x<=32'b000000000000000000000000000000; //216
		8'b11011001: add_x<=32'b000000000000000000000000000000; //217
		8'b11011010: add_x<=32'b000000000000000000000000000000; //218
		8'b11011011: add_x<=32'b000000000000000000000000000000; //219
		8'b11011100: add_x<=32'b000000000000000000000000000000; //220
		8'b11011101: add_x<=32'b000000000000000000000000000000; //221
		8'b11011110: add_x<=32'b000000000000000000000000000000; //222
		8'b11011111: add_x<=32'b000000000000000000000000000000; //223
		8'b11100000: add_x<=32'b000000000000000000000000000000; //224
		8'b11100001: add_x<=32'b000000000000000000000000000000; //225
		8'b11100010: add_x<=32'b000000000000000000000000000000; //226
		8'b11100011: add_x<=32'b000000000000000000000000000000; //227
		8'b11100100: add_x<=32'b000000000000000000000000000000; //228
		8'b11100101: add_x<=32'b000000000000000000000000000000; //229
		8'b11100110: add_x<=32'b000000000000000000000000000000; //230
		8'b11100111: add_x<=32'b000000000000000000000000000000; //231
		8'b11101000: add_x<=32'b000000000000000000000000000000; //232
		8'b11101001: add_x<=32'b000000000000000000000000000000; //233
		8'b11101010: add_x<=32'b000000000000000000000000000000; //234
		8'b11101011: add_x<=32'b000000000000000000000000000000; //235
		8'b11101100: add_x<=32'b000000000000000000000000000000; //236
		8'b11101101: add_x<=32'b000000000000000000000000000000; //237
		8'b11101110: add_x<=32'b000000000000000000000000000000; //238
		8'b11101111: add_x<=32'b000000000000000000000000000000; //239
		8'b11110000: add_x<=32'b000000000000000000000000000000; //240
		8'b11110001: add_x<=32'b000000000000000000000000000000; //241
		8'b11110010: add_x<=32'b000000000000000000000000000000; //242
		8'b11110011: add_x<=32'b000000000000000000000000000000; //243
		8'b11110100: add_x<=32'b000000000000000000000000000000; //244
		8'b11110101: add_x<=32'b000000000000000000000000000000; //245
		8'b11110110: add_x<=32'b000000000000000000000000000000; //246
		8'b11110111: add_x<=32'b000000000000000000000000000000; //247
		8'b11111000: add_x<=32'b000000000000000000000000000000; //248
		8'b11111001: add_x<=32'b000000000000000000000000000000; //249
		8'b11111010: add_x<=32'b000000000000000000000000000000; //250
		8'b11111011: add_x<=32'b000000000000000000000000000000; //251
		8'b11111100: add_x<=32'b000000000000000000000000000000; //252
		8'b11111101: add_x<=32'b000000000000000000000000000000; //253
		8'b11111110: add_x<=32'b000000000000000000000000000000; //254
		8'b11111111: add_x<=32'b000000000000000000000000000000; //255
		default	  : add_x<=32'b000000000000000000000000000000;
	endcase
end


endmodule