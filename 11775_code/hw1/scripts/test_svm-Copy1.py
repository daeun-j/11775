#!/bin/python 

import numpy
import os
from sklearn.svm.classes import SVC
import cPickle
import sys
import pandas
# Apply the SVM model to the testing videos; Output the score for each video

if __name__ == '__main__':
    if len(sys.argv) != 5:
        print "Usage: {0} model_file feat_dir feat_dim output_file".format(sys.argv[0])
        print "model_file -- path of the trained svm file"
        print "feat_dir -- dir of feature files"
        print "feat_dim -- dim of features; provided just for debugging"
        print "output_file -- path to save the prediction score"
        exit(1)

    model_file = sys.argv[1]
    feat_dir = sys.argv[2]
    feat_dim = int(sys.argv[3])
    output_file = sys.argv[4]

    # assume that you don't change the video list
    #video_list_file = 'list/val.video'

    # assume that you don't change the video list
    video_list_file = 'list/test.video'
    
    # load the svm model
    svm = cPickle.load(open(model_file,"rb"))
    # read the video list to be processed
    video_list = []
    fopen = open(video_list_file, 'r')
    for line in fopen.readlines():
        splits = line.replace('\n','').split(' ')
        video_list.append(splits[0])
    fopen.close()
    
    # do the classification on one video each time
    fopen = open(output_file, 'w') 
    for video in video_list:
        # BOW features of this video
        feat_vec = numpy.genfromtxt(feat_dir + video, dtype=numpy.float32, delimiter=";")
        #mfcc_array = pandas.read_csv("select.mfcc.csv", header = None, sep = ';', dtype = 'float64')
        assert(feat_vec.shape[0] == feat_dim)
        feat_vec = feat_vec.reshape(1,-1)
        pred = svm.decision_function(feat_vec)
        #pred = svm.predict_proba(feat_vec)
        fopen.write(str(pred[0]) + '\n')
    fopen.close()