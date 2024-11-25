#!/bin/bash


# for s in $(seq 0 20)
# do
#     python -m infinigen_examples.generate_indoors --output_folder outputs/room_${s} -s ${s} -g base disable/no_objects -t coarse
#     python -m infinigen_examples.generate_indoors --input_folder outputs/room_${s} --output_folder outputs/room_${s}/frames -s ${s} -g base disable/no_objects -t render
# done

for s in $(seq 6 15)
do
   python -m infinigen_examples.generate_indoors \
    --seed ${s} \
    --task coarse \
    --output_folder /mnt/nas_mnt/synthetic_scenes/house_${s} \
    -g fast_solve \
    -p compose_indoors.terrain_enabled=False \
       compose_indoors.floating_objs_enabled=False \
       restrict_solving.solve_max_rooms=50 \
       compose_indoors.solve_steps_large=30 \
       compose_indoors.solve_steps_small=30
done