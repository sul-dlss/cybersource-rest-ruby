FILECOUNT=0
find Samples -print | grep -i -e "\.rb$"    > list.txt

set -e
while IFS="" read -r p || [ -n "$p" ]
do
  if [[ "$p" =~ $(echo ^\($(sed 's/[[:blank:]]//g' sampleCodeIgnoreList.txt | paste -sd '|' /dev/stdin)\)$) ]]; then
   printf '\n#### SKIPPED - %s ####\n' "$p"
  else
   printf '\n\n**** RUNNING - %s ****\n' "$p"
   ruby $p
   FILECOUNT=$((FILECOUNT+1))
  fi
done < list.txt
printf '\n\n**** %s Sample Codes ran successfully ****\n' "$FILECOUNT"
# rm -f list.txt
