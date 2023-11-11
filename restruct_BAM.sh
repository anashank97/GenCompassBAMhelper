ls *.bam | while read i; do
   folder=$(echo $i | cut -d '_' -f3 | cut -d '-' -f1)
   mkdir -p $folder
   mv *$folder* $folder
done
