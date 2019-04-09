outfile="indyolov3noflip"
cfg_file="yolov3"
export outfile cfg_file

for VARIABLE in 1 #2 3
do
	rm results/*
	#./darknet detector train /home/molimm2/dwaithe/keras_experiments/Faster-RCNN-TensorFlow-Python3.5/data/neuroblastoma_phal_class/2018/obj_neuroblastoma_phal_class180.data cfg/$cfg_file.cfg darknet19_448.conv.23 -gpus 0
	#sleep 20s
	test_set="test_n180"
	dataset_dir="neuroblastoma_phal_class"
	cell_class="cell - neuroblastoma phalloidin"
	iteration=$dataset_dir"180"
	iteration2=$iteration
	export test_set dataset_dir cell_class iteration iteration2
	./dw_yolov3_bulk_eval.sh
	sleep 20s


	
done

outfile="indyolov3flip"
cfg_file="yolov3-flip"
export outfile cfg_file

for VARIABLE in 1 #2 3
do
	rm results/*
	#./darknet detector train /home/molimm2/dwaithe/keras_experiments/Faster-RCNN-TensorFlow-Python3.5/data/neuroblastoma_phal_class/2018/obj_neuroblastoma_phal_class180.data cfg/$cfg_file.cfg darknet19_448.conv.23 -gpus 0
	#sleep 20s
	test_set="test_n180"
	dataset_dir="neuroblastoma_phal_class"
	cell_class="cell - neuroblastoma phalloidin"
	iteration=$dataset_dir"180"
	iteration2=$iteration
	export test_set dataset_dir cell_class iteration iteration2
	./dw_yolov3_bulk_eval.sh
	sleep 20s


	
done

