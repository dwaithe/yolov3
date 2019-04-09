############## running Darknet on global dataset and evaluating.
outfile="glo_yolov3_flip"
cfg_file="yolov3-flip"
export outfile cfg_file



for VARIABLE in 1
do
	rm results/*
	./darknet detector train /home/molimm2/dwaithe/keras_experiments/Faster-RCNN-TensorFlow-Python3.5/data/global/2018/obj_global_class.data cfg/$cfg_file.cfg /scratch/dwaithe/models/darknet/global_class/yolov3_9000.weights -gpus 1
	sleep 20s
	test_set="test_n55"
	dataset_dir="hela_peroxisome_all_class"
	cell_class="cell - hela peroxisome all"
	iteration=$dataset_dir"55"
	iteration2="global_class"

	export test_set dataset_dir cell_class iteration iteration2
	./dw_yolov3_bulk_eval.sh
	sleep 20s

	test_set="test_n20"
	dataset_dir="fibroblast_nucleopore_class"
	cell_class="cell - fibroblast nucleopore"
	iteration=$dataset_dir"26"
	iteration2="global_class"
	export test_set dataset_dir cell_class iteration iteration2
	./dw_yolov3_bulk_eval.sh
	sleep 20s

	test_set="test_n30"
	dataset_dir="c127_dapi_class"
	cell_class="cell - c127 dapi"
	iteration=$dataset_dir"30"
	iteration2="global_class"
	export test_set dataset_dir cell_class iteration iteration2
	./dw_yolov3_bulk_eval.sh
	sleep 20s

	test_set="test_n40"
	dataset_dir="eukaryote_dapi_class"
	cell_class="cell - eukaryote dapi"
	iteration=$dataset_dir"40"
	iteration2="global_class"
	export test_set dataset_dir cell_class iteration iteration2
	./dw_yolov3_bulk_eval.sh
	sleep 20s

	test_set="test_n80"
	dataset_dir="erythroblast_dapi_class"
	cell_class="cell - erythroblast dapi"
	iteration=$dataset_dir"80"
	iteration2="global_class"
	export test_set dataset_dir cell_class iteration iteration2
	./dw_yolov3_bulk_eval.sh
	sleep 20s

	test_set="test_n180"
	dataset_dir="neuroblastoma_phal_class"
	cell_class="cell - neuroblastoma phalloidin"
	iteration=$dataset_dir"180"
	iteration2="global_class"
	export test_set dataset_dir cell_class iteration iteration2
	./dw_yolov3_bulk_eval.sh
	sleep 20s
done