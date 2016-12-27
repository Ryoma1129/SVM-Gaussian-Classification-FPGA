	The program computes 629 Ai's by multiplication of 900 exp(-mod(x_j-z_ij)/(2sigma^2))
	Here the z_ij is the (629 SVMs: Zi * 30x30 pixel set: Zij) and x_j (30x30 image vector: X)
	sigma assumed to be 625
	The weights are ai
	and then add those Ai's to compute the final result i.e. classification of X
	i[0,629]
	j[0,899]


	The following data are intialized in a file
		ai -- 629 Values stored in Logarithmic Number System (LNS)
			  weighted according to the 'weight' value specified ranging
			  from 0 to 30
		zi -- 629 SVMs each 900 pixel (8bit)
		xi -- Input image 900 pixel (8bit)
	The same data is used by the Hardware Design Testbench (Verilog) to initilize 
	 	ai and zi; and
		periodic entering of image X into the design