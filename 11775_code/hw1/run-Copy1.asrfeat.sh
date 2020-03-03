#!/bin/bash

# An example script for feature extraction of Homework 1

# Note that this script gives you the very basic setup. Its configuration is by no means the optimal. 
# This is NOT the only solution by which you approach the problem. We highly encourage you to create
# your own setups.

# Paths to different tools; 
opensmile_path=/home/ubuntu/tools/opensmile-2.3.0/inst
export PATH=$opensmile_path/bin:$PATH
export LD_LIBRARY_PATH=$opensmile_path/lib:$LD_LIBRARY_PATH

# Two additional variables
video_path=../videos  # path to the directory containing all the videos. In this example setup, we are linking all the videos to "../video"
cluster_num=40    # the number of clusters in k-means. Note that 50 is by no means the optimal solution.
                      # You need to explore the best config by yourself.
                      
echo "Creating ASR features"
mkdir -p asrfeat
python2 scripts/create_asrfeat.py vocab list/all.video || exit 1;

# Great! We are done!
echo "SUCCESSFUL COMPLETION"

