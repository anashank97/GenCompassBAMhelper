find /data/shankaras/workflow_results/fq2bam/ -type f -name '*.bam' | while read i; do
   bai=$(echo $i.bai)
   folder=$(echo $i | cut -d '_' -f4 | cut -d '-' -f1)
   cp template.json $folder.variant_calling_inputs.json
   jq --arg fol "$folder" '."VariantCalling.sampleID"=$fol' $folder.variant_calling_inputs.json | sponge $folder.variant_calling_inputs.json
   jq --arg BAI "$bai" '."VariantCalling.sampleBAI"=$BAI' $folder.variant_calling_inputs.json | sponge $folder.variant_calling_inputs.json 
   jq --arg BAM "$i" '."VariantCalling.sampleBAM"=$BAM' $folder.variant_calling_inputs.json | sponge $folder.variant_calling_inputs.json
done
