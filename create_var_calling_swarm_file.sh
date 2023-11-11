find /data/shankaras/workflow_results/fq2bam/ -type f -name '*.bam' | while read i; do
   folder=$(echo $i | cut -d '_' -f4 | cut -d '-' -f1)
   command="java -Dconfig.file=/data/shankaras/GenCompass/config/biowulf-swarm.conf -jar \$CROMWELL_JAR run /gpfs/gsfs12/users/shankaras/GenCompass/workflows/variant_calling.wdl -o ./variant_calling_options/$folder.variant_calling_options.json -i ./variant_calling_inputs/$folder.variant_calling_inputs.json"
   echo $command >> gencompass_workflow_001_variant_calling.swarm
done
