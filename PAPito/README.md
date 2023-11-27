PAPIto

PAPIto is a simple tool developed to facilitate the use of the Performance Application Programming Interface (PAPI)(https://icl.utk.edu/papi/).

Installing

Just write the following command on the Linux terminal:

chmod +x papito_install.sh

./papito_install.sh

The above commands install the necessary tools and run the example code simple_array_sum.cpp (to verify if everything is OK).

Obs1: You will need root privileges, for example: sudo ./simple_array_sum

Using PAPIto in your code

After including "papito.h" in your code (#include "papito.h"), it is necessary to insert three simple commands:

papito_init() Initialize the PAPI lib;

papito_start() Start measuring the hardware counters;

papito_end() Finnish the measurement and print the final results.

Also, the user must specify in counters.in the hardware counters to be measured.

Obs2: to check the available hardware in your machine, use the following command (from the PAPIto directory):

../papi/install/bin/papi_avail -a

Source: Simple PAPI Instrumentation
https://web.eece.maine.edu/~vweaver/projects/papi/papi_simple.html
