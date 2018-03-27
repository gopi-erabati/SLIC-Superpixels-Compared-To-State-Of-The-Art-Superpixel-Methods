Manual for SLIC Superpixel

1. Change your current working directory of MATLAB to the folder of SLIC code
2. Compile the C file using "mex slicmex.c" (without quotes) in the command line
3. Run the function superpixel_slic(in_img,num_of_sup,m) for the superpixel slic algorithm.
	The description of each parameters are explained in the superpixel_slic.m file.
	You can read this by running the command "help superpixel_slic"
	An example is given at end of help document.
4. Here, author code provides only the labels of segements. So here we developed a code named
	"drawsuperpxlboundary.m" which takes the output of authors code and original image
	and draws the superpixel boundary on original image.
5. The above step is already done in "superpixel_slic.m" and you dont need to do it explicitly.
6. After running the code you get the output in a figure window.

Cheers!