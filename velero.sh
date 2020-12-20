#!/bin/bash
if [ ! -f velero-v1.5.2-linux-amd64.tar.gz ]; then wget https://github.com/vmware-tanzu/velero/releases/download/v1.5.2/velero-v1.5.2-linux-amd64.tar.gz; fi
tar -xvf velero-v1.5.2-linux-amd64.tar.gz

sudo mv velero-v1.5.2-linux-amd64/velero /usr/bin/

echo "[default]" > credentials-velero
echo "aws_access_key_id=minioadmin" >> credentials-velero
echo "aws_secret_access_key=minioadmin" >> credentials-velero

velero install \
      --provider aws \
      --plugins velero/velero-plugin-for-aws:v1.0.0 \
      --bucket velero \
      --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://192.168.121.212:9000 \
      --snapshot-location-config region=minio \
      --secret-file ./credentials-velero \
