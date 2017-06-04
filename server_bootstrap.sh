#!/bin/sh
docker cp apps_solr_1:/opt/solr/server/solr/ freshcuts_data/solr/

# Assume basic server initialization and user config is taken care of

# Git and docker required

# Pull down project repositories
git clone https://github.com/devonwalshe/freshcuts_server freshcuts_server
git clone https://github.com/devonwalshe/freshcuts_crawler freshcuts_crawler
git clone https://github.com/devonwalshe/freshcuts_solr freshcuts_solr

# Create data dirs
mkdir -p freshcuts_data/pgdata freshcuts_data/solr freshcuts_data/logs

# Clone solr data from into solr data dir
docker run --rm -d solr:5-alpine --name solr_tmp
docker cp solr_tmp:/opt/solr/server/solr/ freshcuts_data/solr/
docker stop solr_tmp

# Thats it? 
