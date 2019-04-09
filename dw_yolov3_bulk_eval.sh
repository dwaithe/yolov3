## declare an array variable
declare -a arr=( 100 200 300 400 500 600 700 800 900 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 11000 12000 13000 14000 15000 16000 17000 18000 19000 20000);
#test_set="test_n55"
#dataset_dir="peroxisome_full_class"
#cell_class="cell - peroxisome gfp-scp all"
#iteration=$dataset_dir"55"

#test_set="test_n20"
#dataset_dir="nucleopore_class"
#cell_class="cell - GM5756T nucleopore"
#iteration=$dataset_dir"26"

#test_set="test_n30"
#dataset_dir="c127_dapi_class"
#cell_class="cell - c127 dapi"
#iteration=$dataset_dir"30"

#test_set="test_n40"
#dataset_dir="eukaryote_dapi_class"
#cell_class="cell - eukaryote dapi"
#iteration=$dataset_dir"40"

#test_set="test_n80"
#dataset_dir="glycophorinA_class"
#cell_class="cell - celltype dapi"
#iteration=$dataset_dir"80"

#test_set="test_n180"
#dataset_dir="neuroblastoma_phal_class"
#cell_class="cell - neuroblastoma phalloidin"
#iteration=$dataset_dir"180"

#iteration2="global"
#hash out the next line to evaluate the global trained  model on the data.
#teration2=$iteration

test_set2=$test_set"_"
cell_class2=$cell_class"_"


echo $test_set2
## now loop through the above array
for i in "${arr[@]}"
do
	echo "$i";
	weights=$iteration2"/"$cfg_file"_"$i.weights;
	echo "./darknet detector valid /home/molimm2/dwaithe/keras_experiments/Faster-RCNN-TensorFlow-Python3.5/data/$dataset_dir/2018/obj_$iteration.data cfg/$cfg_file.cfg /scratch/dwaithe/models/darknet/$weights";
	
	./darknet detector valid /home/molimm2/dwaithe/keras_experiments/Faster-RCNN-TensorFlow-Python3.5/data/$dataset_dir/2018/obj_$iteration.data cfg/$cfg_file.cfg /scratch/dwaithe/models/darknet/$weights;
	mv "/home/molimm2/dwaithe/keras_experiments/darknet/results/comp4_det_test_.txt" "/home/molimm2/dwaithe/keras_experiments/darknet/results/comp4_det_$test_set2$cell_class.txt";
	python scripts/reval_custom_py3.py /home/molimm2/dwaithe/keras_experiments/darknet/results $i --dataset_dir /home/molimm2/dwaithe/keras_experiments/Faster-RCNN-TensorFlow-Python3.5/data/$dataset_dir --year 2018 --image_set $test_set --classes /home/molimm2/dwaithe/keras_experiments/Faster-RCNN-TensorFlow-Python3.5/data/$dataset_dir/2018/obj_$dataset_dir.names;
	mv "/home/molimm2/dwaithe/keras_experiments/darknet/results/comp4_det_$test_set2$cell_class.txt" "/home/molimm2/dwaithe/keras_experiments/darknet/results/comp4_det_$test_set2$cell_class2$i.txt";
done

path="/scratch/dwaithe/models/darknet"
for i in "${arr[@]}"
do
	output_path="$path""_""$outfile";
	python scripts/reval_final_list.py "results/$cell_class2"$i"_pr.pkl" $output_path;
done
