# flowlines

We simulate the solution (flow line) of the ODEs z'(t) = e^(i (h(t) + theta)) dt, z(0) = z_0 = 1/2+ 1/2 * i, 
where theta are angle parameters in [0, 2*pi], and h is a sample of Discrete Gaussian Free Field (DGFF) in [0,1] x [0,1]

sampling_DGFF_into_file.m: this file initializes/samples discrete Gaussian Free Field (DGFF) and put it in a file such that we can use this sample for many purposes instead of sampling again everytime. 

DGFF_simulation.m: this file samples DGFF and plots it.

