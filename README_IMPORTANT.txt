1. GUI (need a 64 bit system for some algorithms)

	1.1 Make this folder as your current working directory
	1.2 Run gui_superpixel.m
	1.3 Instructions are given on the GUI 
	1.4 For parameters details, you can go to each algorithm folder and run help superpixel_xxxx (xxxx : slic,qs09,tp09,gs04)

NOTE: There is some problem with the mex file of GS04 algorithm sometimes, if you face any error please close the GUI 
	change your current working directory to the program folder (which contains gui_superpixel.m file)
	and run the GUI again or you can run the algorithm individually.

We tried our best to comment the each individual algorithm file in the best possible way!

(OR)

2. You can run each algorithm individually as:

	2.1. In every algorithm code there is a README.txt file (User manual) explaining how to use the code.
	2.2. The descrition of code and parameters is given in each code file as in
		superpixel_slic.m
		superpixel_qs09.m
		superpixel_tp09.m
		superpixel_gs04.m
	2.3. You can read by running "help superpixel_xxxx" after changing your current working directory of MATLAB to each folder.
	2.4. In evry folder there is a results folder
		
Cheers!