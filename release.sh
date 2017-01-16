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

cp -r Products/Optimized-LineageOS-Google-Apps-Nougat.zip Release/Optimized-LineageOS-Google-Apps-Nougat.zip
cp -r Products/Optimized-LineageOS-Snap-Camera.zip Release/Optimized-LineageOS-Snap-Camera.zip
cp -r Products/Optimized-LineageOS-Stock-Kernel.zip Release/Optimized-LineageOS-Stock-Kernel.zip
rm -rf Products/Optimized*

echo "Released..."
exit 0;

