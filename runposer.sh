#!/bin/bash


# run a single test

#ORDER=723998
ORDER=764591

/Users/tommy/workspace/ezioverify/zulu_markups/cv/utils/cmake-build-debug/test/test_poser_v3_json --image_dir /Users/tommy/workspace/data/failed/order_$ORDER/ --input_folder /Users/tommy/workspace/data/failed/order_$ORDER/ --order_no $ORDER --debug true --output_dir /Users/tommy/workspace/data/psout/


# run a lot of orders

:'
for d in /Users/tommy/workspace/data/failed/*; do
  ORDER=0
  if [ -d "$d" ]; then
    #echo "$d"/;
    IFS='_' read -ra ADDR <<< "$d"
    for i in "${ADDR[@]}"; do
        case $i in
        ''|*[!0-9]*) ;;#echo not number ;;
        *) ORDER=$i;; #echo is number
        esac
    done
    echo "$ORDER"
    /Users/tommy/workspace/ezioverify/zulu_markups/cv/utils/cmake-build-debug/test/test_poser_v3_json --image_dir /Users/tommy/workspace/data/failed/order_$ORDER/ --input_folder /Users/tommy/workspace/data/failed/order_$ORDER/ --order_no $ORDER --debug true --output_dir /Users/tommy/workspace/data/psout/
  fi
done
'