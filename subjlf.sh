
for sub in (<path to subjects>); do
var=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/$var
sbatch \
-o ~/logfiles/$var/output-antsCT.txt \
-e ~/logfiles/$var/error-antsCT.txt \
~/scripts/class/antsCT.sh $sub

done
