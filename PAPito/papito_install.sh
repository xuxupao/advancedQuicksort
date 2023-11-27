#!/bin/bash

#Obs: Run the following command to make this script executable
#     chmod +x papito_install.sh

cd ..

echo ">>>>>>> Cloning PAPI repository"
git clone https://github.com/icl-utk-edu/papi.git

echo ">>>>>>> Entrer the directory"
cd papi/src

echo ">>>>>>> Configuring"
./configure --prefix=$PWD/../install

echo ">>>>>>> Installing"
make && make install

echo ">>>>>>> Checking if everything is OK"
cd ctests
./serial_hl

echo ">>>>>>> Going to PAPIto directory"
cd ../../../PAPIto

echo ">>>>>>> Compiling example code"
g++ simple_array_sum.cpp papito.cpp -I$PWD/../papi/install/include -L$PWD/../papi/install/lib $PWD/../papi/install/lib/libpapi.a -o simple_array_sum -lpapi

echo ">>>>>>> Running example code"
./simple_array_sum
