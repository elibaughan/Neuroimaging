template=~/templates/OASIS20/OASIS-TRT-20
subdir=~/compute/class/
for sub in $(ls $subdir); do
var=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/$var
sbatch \
-o ~/logfiles/$var/output-antsjlf.txt \
-e ~/logfiles/$var/error-antsjlf.txt \
~/scripts/class/shellscriptjlf.sh ~/compute/class/${sub}/antsCT $template
done

template=~/templates/OASIS20/OASIS-TRT-20
subdir=~/compute/class/
var=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/$var
sbatch \
-o ~/logfiles/$var/output-antsjlf.txt \
-e ~/logfiles/$var/error-antsjlf.txt \
~/scripts/class/shellscriptjlf.sh ~/compute/class/<subject>/antsCT $template
