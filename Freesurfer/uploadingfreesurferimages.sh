cd ~/Desktop/FreeSurfer
cobia=1304
freeview -v \
$cobia/mri/T1.mgz \
$cobia/mri/brainmask.mgz \
-f $cobia/surf/lh.white:edgecolor=yellow \
$cobia/surf/lh.pial:edgecolor=red \
$cobia/surf/rh.white:edgecolor=yellow \
$cobia/surf/rh.pial:edgecolor=red
$cobia/mriaparc.a2009s+aseg.mgz

cd ~/Desktop/FreeSurfer
recon-all -skullstrip -clean-bm -gcut -subjid /1306


cd ~/Desktop/FreeSurfer
freeview -v \
1306/mri/brainmask.auto.mgz


cd ~/Desktop/FreeSurfer
cobia=1304
freeview -v $cobia/mri/orig.mgz \
$cobia/mri/aparc+aseg.mgz:colormap=lut:opacity=0.4 \
-f $cobia/surf/lh.white:annot=aparc.annot
