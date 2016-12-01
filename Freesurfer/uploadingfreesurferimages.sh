cd ~/Desktop/FreeSurfer
cobia=1306
freeview -v \
$cobia/mri/T1.mgz \
$cobia/mri/brainmask.mgz \
-f $cobia/surf/lh.white:edgecolor=yellow \
$cobia/surf/lh.pial:edgecolor=red \
$cobia/surf/rh.white:edgecolor=yellow \
$cobia/surf/rh.pial:edgecolor=red


cd ~/Desktop/FreeSurfer
recon-all -skullstrip -clean-bm -gcut -subjid /1306


cd ~/Desktop/FreeSurfer
freeview -v \
1306/mri/brainmask.auto.mgz
