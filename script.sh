#usage: bash script.sh wages.csv

cat $1 | grep -v "gender" | cut -d , -f 1,2 | tr ',' ' ' | sort -k1,1d -k2,2n > sorted.txt

echo "highest earner"
cat $1 | grep -v "gender" | sort -t , -k 4 -n | tail -n 1

echo "lowest earner"
cat $1 | grep -v "gender" | sort -t , -k 4 -n | head -n 1

echo "top ten female earners"
cat $1 | grep -v "gender" | sort -t , -k 4 -n | tail -n 10 | grep -c 'female'

echo "effect of graduating college on mimimum wage"
VAR1=$(cat $1 | grep -E '[female|male][,][0-9]{1,4}[,]16' | sort -t , -k 4 -n | head -n 1 | cut -d , -f 4)
VAR2=$(cat $1 | grep -E '[female|male][,][0-9]{1,4}[,]12' | sort -t, -k 4 -n | head -n 1 | cut -d , -f 4)
echo "$VAR1-$VAR2" | bc


