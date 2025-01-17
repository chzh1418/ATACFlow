#!/bin/bash

CROMWELL_JAR=$(which cromwell-30.1.jar)
WDL=$CODE/atac-seq-pipeline/atac.wdl
INPUT=$CODE/atac-seq-pipeline-test-data/scripts/ENCSR889WQX_disable_tn5_shift.json
WF_OPT=$CODE/atac-seq-pipeline/workflow_opts/docker.json
BACKEND_CONF=$CODE/atac-seq-pipeline/backends/backend.conf
BACKEND=Local

mkdir -p ENCSR889WQX_disable_tn5_shift && cd ENCSR889WQX_disable_tn5_shift
java -Dconfig.file=${BACKEND_CONF} -Dbackend.default=${BACKEND} -jar ${CROMWELL_JAR} run ${WDL} -i ${INPUT} -o ${WF_OPT}
find $PWD -name '*.tagAlign.gz' | grep -v glob | grep shard-0
cd ..
