#change SubjectToTemplateLogJacobian.nii.gz to <Subj>_LJ.nii.gz and place in data folder
for subj in $(ls ~/compute/class/); do
echo $subj
cp -v \
~/compute/class/${subj}/antsCT/SubjectToTemplateLogJacobian.nii.gz \
~/compute/analyses/class/TBM/data/${subj}_LJ.nii.gz
done

#smooth <Subj>_LJ.nii.gz
for subj in $(ls ~/compute/analyses/class/TBM/data); do
echo $subj
~/apps/ants/bin/SmoothImage \
3 \
~/compute/analyses/class/TBM/data/${subj} \
1 \
~/compute/analyses/class/TBM/data/${subj}
done

#create merged 4d file in stats folder
cd ~/compute/analyses/class/TBM/
fslmerge -t stats/merged.nii.gz data/*.nii.gz

#select the ROIs we want to look at
cp -v \
~/templates/class/template_BrainCerebellumMask.nii.gz \
~/compute/analyses/class/TBM/stats/

#copy design.mat and design.con from CT analyses
cp ~/compute/analyses/class/CT/stats/design.mat ~/compute/analyses/class/TBM/stats/
cp ~/compute/analyses/class/CT/stats/design.con ~/compute/analyses/class/TBM/stats/

#jobscript
var=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/${var}
sbatch \
-o ~/logfiles/${var}/output.txt \
-e ~/logfiles/${var}/error.txt \
~/scripts/class/tbm_jobscript.sh
