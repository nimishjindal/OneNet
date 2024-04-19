## M
online_learning='full'
i=1
ns=(1 )
bszs=(1 )
lens=(1 24 48)
methods=('onenet_fsnet')
for n in ${ns[*]}; do
for bsz in ${bszs[*]}; do
for len in ${lens[*]}; do
for m in ${methods[*]}; do
CUDA_VISIBLE_DEVICES=0 python -u main.py --method $m --root_path ./data/ --n_inner $n --test_bsz $bsz --data finance --features MS --seq_len 10 --label_len 0 --pred_len 10 --des 'Exp' --itr $i --train_epochs 3 --learning_rate 1e-3 --online_learning $online_learning --use_adbfgs
done
done
done
done