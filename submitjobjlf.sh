template=~/templates/OASIS20/OASIS-TRT-20
subdir=~/compute/class/
for sub in $(ls $subdir); do
var=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/$var
sbatch \
-o ~/logfiles/$var/output-antsjlf.txt \
-e ~/logfiles/$var/error-antsjlf.txt \
~/scripts/class/jlf.sh ~/compute/class/${sub}/antsCT/ $template
done

for sub in $(</compute/class>) do
echo $sub
done

for sub in $(ls ~/compute/class/); do
var=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/$var
sbatch \
-o ~/logfiles/$var/output-antsCT.txt \
-e ~/logfiles/$var/error-antsCT.txt \
~/scripts/class/jlf.sh 1 2 3 4 ... n
done
