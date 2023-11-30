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



