#! /bin/bash

#      _____  __________      
#  __ / / _ \/ ___/_  _/__ ___ ___ _
# / // / // / /__  / // -_) _ `/  ' \ 
# \___/____/\___/ /_/ \__/\_,_/_/_/_/ 
#
# Copyright 2017 JDCTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FILENAME=Optimized-LineageOS
AROMA_DIR=aroma
PRODUCT_DIR=Products
cd ..
if [ ! -d "$AROMA_DIR" ]; then
	echo "No AROMA directory found.Please check your sources"
	exit -1;
fi


cd flashables

if [ ! -d "$PRODUCT_DIR" ]; then
	mkdir $PRODUCT_DIR
fi
echo "Removing old packages..."

cd Products
rm -rf Optimized*
cd ..

echo "Updating packages from Aroma directory..."

echo "Updating AOSP Camera..."
cd Stock-Camera
rm -rf lib && rm -rf Camera2
cd ..
cp -r ../aroma/jdc/camera/aospcam/Camera2 Stock-Camera/Camera2
cd Stock-Camera/Camera2
mkdir lib
cd lib
mkdir arm
cd ../../..
cp -r ../aroma/jdc/camera/lib/libjni_jpegutil.so Stock-Camera/Camera2/lib/arm/libjni_jpegutil.so
cp -r ../aroma/jdc/camera/lib/libjni_tinyplanet.so Stock-Camera/Camera2/lib/arm/libjni_tinyplanet.so


echo "Updating Google Apps for N..."
cd Google-Apps-Nougat
rm -rf wallpaper && rm -rf launcher
cd ..
cp -r ../aroma/jdc/google/wallpaper Google-Apps-Nougat/wallpaper
cp -r ../aroma/jdc/google/launcher Google-Apps-Nougat/launcher

echo "Updating stock kernel..."
cd Stock-Kernel
rm -rf stock
cd ..
cp -r ../aroma/jdc/kernel/stock/ Stock-Kernel/stock

echo "Making flashables..."

cd Snap-Camera
echo "Making flashable for ${PWD##*/} "
zip -rq9 ../Products/"$FILENAME"-"${PWD##*/}".zip *
cd ..

cd Stock-Kernel
echo "Making flashable for ${PWD##*/} "
zip -rq9 ../Products/"$FILENAME"-"${PWD##*/}".zip *
cd ..

cd Google-Apps-Nougat
echo "Making flashable for ${PWD##*/} "
zip -rq9 ../Products/"$FILENAME"-"${PWD##*/}".zip *
cd ..

cd Stock-Camera
echo "Making flashable for ${PWD##*/} "
zip -rq9 ../Products/"$FILENAME"-"${PWD##*/}".zip *
cd ..

echo "Done"
exit 0;

