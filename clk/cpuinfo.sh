#!/system/bin/sh
cpufamily=`cat /proc/cpuinfo  | grep family | head -1 | cut -d ":" -f2 | sed -e 's/^[ \t]*//'`
model=`cat /proc/cpuinfo  | grep model | head -1 | cut -d ":" -f2 | sed -e 's/^[ \t]*//'`
if [[ "$cpufamily" == "6" && "$model" == "142" ]]
then
	echo "board belongs to kabylake family"

elif [[ "$cpufamily" == "6" && "$model" == "92" ]]
then
	echo "board belongs to apollolake family"
else
	echo "New HW"
fi
