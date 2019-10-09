#usage: bash script.sh inputFile outputFile

cat wages.csv | cut -d ',' -f 1,2 | sed 's/\,/\ /' > gender-years.txt
grep -w "male" gender-years.txt | sort -k 2n > male-years.txt
grep -w "female" gender-years.txt | sort -k 2n > female-years.txt
cat female-years.txt > gender-years-sort.txt
cat male-years.txt >> gender-years-sort.txt
rm female-years.txt
rm male-years.txt
rm gender-years.txt
