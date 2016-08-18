#!/usr/bin/env bash

echo "Provide AWS S3 path to gpg key:"
read gpgKeyPath

mkdir -p /gpg_keys

aws s3 cp --recursive s3://$AWS_BUCKET_NAME/$gpgKeyPath /gpg_keys/.
if [ ! "$(ls -A /gpg_keys)" ]; then
   echo "Unable to retrieve file"
   exit 1;
fi

isPublicKey=""
while [[ ! $isPublicKey =~ ^[y,n]$ ]]; do
    echo "Is this key public? [y/n]"
    read isPublicKey
done

if [ $isPublicKey = "y" ]; then
     gpg --import /gpg_keys/*
 else
    gpg --allow-secret-key-import --import /gpg_keys/*
fi

# Clear the keys installed by the system
rm -rf /gpg_keys/*