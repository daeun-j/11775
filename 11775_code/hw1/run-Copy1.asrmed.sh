echo ""
echo "#####################################"
echo "#       MED with ASR Features       #"
echo "#####################################"
mkdir -p asr_pred
# iterate over the events
feat_dim_asr=983
for event in P001 P002 P003; do
  echo "=========  Event $event  ========="
  # now train a svm model
  #python2 scripts/train_svm.py $event "asrfeat/" $feat_dim_asr asr_pred/svm.$event.model || exit 1;
  python2 scripts/train_svm.py $event "asrfeat/" $feat_dim_asr asr_pred/svm.$event.model || exit 1;
  # apply the svm model to *ALL* the testing videos;
  # output the score of each testing video to a file ${event}_pred 
  python2 scripts/test_svm.py asr_pred/svm.$event.model "asrfeat/" $feat_dim_asr asr_pred/${event}_test_asr.lst || exit 1;
  # compute the average precision by calling the mAP package
  #ap list/${event}_val_label asr_pred/${event}_asr.lst
  #python2 scripts/evaluator.py list/${event}_val_value asr_pred/${event}_chi_test_asr.lst
  
    # now train a svm model
  ##python2 scripts/train_svm.py $event "asrfeat/" $feat_dim_asr asr_pred/svm.$event.model || exit 1;
  #python2 scripts/train_svmchi.py $event "asrfeat/" $feat_dim_asr asr_pred/svm.$event.model || exit 1;
  # apply the svm model to *ALL* the testing videos;
  # output the score of each testing video to a file ${event}_pred 
  #python2 scripts/test_svm.py asr_pred/svm.$event.model "asrfeat/" $feat_dim_asr asr_pred/${event}_asr_test.lst || exit 1;
  # compute the average precision by calling the mAP package
  #ap list/${event}_val_label asr_pred/${event}_asr.lst
  #python2 scripts/evaluator.py list/${event}_val_value asr_pred/${event}_asr.lst
  
  
done