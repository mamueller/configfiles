export EDITOR=nvim
# find hostspecific configuration_file
hcp=~/configfiles/bash_$(hostname).sh
test=$(hostname)
if [ -f "$hpc" ]; then
	source $hcp
fi
echo "####################\n$test"
#
