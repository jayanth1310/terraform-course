#! bin/bash
apt-get update
apt-get install -y nginx

aws s3 sync s3://{bucket_name} /var/www/html

