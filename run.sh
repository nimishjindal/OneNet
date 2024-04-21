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
#CUDA_VISIBLE_DEVICES=0 python -u main.py --method $m --root_path ./data/ --n_inner $n --test_bsz $bsz --data finance --features M --seq_len 10 --label_len 0 --pred_len 10 --des 'Exp' --itr $i --train_epochs 3 --learning_rate 1e-3 --online_learning $online_learning --use_adbfgs
CUDA_VISIBLE_DEVICES=0 python -u main.py --method $m --root_path ./data/ --n_inner $n --test_bsz $bsz --data finance --features M --seq_len 60 --label_len 0 --pred_len $len --des 'Exp' --itr $i --train_epochs 3 --learning_rate 1e-3 --online_learning $online_learning  --sleep_interval $sleep_interval --sleep_epochs $sleep_epochs --online_adjust $online_adjust --offline_adjust $offline_adjust > $m-ETTm1$len$online_learning-sleep$sleep_interval-epoch$sleep_epochs'_'online_adjust$online_adjust'_'offline_adjust$offline_adjust.out 2>&1 & 

done
done
done
done