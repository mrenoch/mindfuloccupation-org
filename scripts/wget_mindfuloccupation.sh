#!/bin/bash

#
# dowload static snapshot of mindfuloccupation.org
#

MO_DOMAIN="mindfuloccupation.org"
MO_URL="https://${MO_DOMAIN}"

PUBLISH_URL="https://mindfuloccupation.org"

DOWNLOAD_PATH="snapshots"
DOWNLOAD_DIR="current"


set -x 

mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH
mkdir $DOWNLOAD_DIR
cd $DOWNLOAD_DIR


# Options:
# no-host-directories we are creating the date directory ourselves
# recursive, levels get everything
# cut-dirs - dont recreate hierarchy (sb/common/eprep)
# page-requesites - retrieve all page reqs
# domains dont go offsite
# include/exclude directories try to only get the wakk pages
wget --quiet \
    --no-clobber \
    --no-host-directories  \
    --exclude-directories=/wp-admin \
    --convert-links \
    --page-requisites \
    --html-extension \
    --page-requisites \
    --recursive --level=50 \
    --domains="${MO_DOMAIN}" \
    $MO_URL


# EXTRA_PAGES="/search_results /contactconfirm /maap_library/images /maap_library/videos /maap_library/maps /mbl_index"

# for page in $EXTRA_PAGES; do
#     wget --quiet \
# 	--http-user="${HTTP_USER}	" \
# 	--http-password="${HTTP_PASSWORD}" \
# 	--no-clobber \
# 	--no-host-directories  \
# 	--exclude-directories=/admin \
# 	--convert-links \
# 	--page-requisites \
# 	--html-extension \
# 	--page-requisites \
# 	--recursive --level=50 \
# 	--domains="${ADMIN_DOMAIN}" \
# 	${ADMIN_URL}${page}
# done;


# search/replace the google key, as well as any extraneous dev links
#find . -type f | xargs perl -pi -e "s#${REPLACE_KEY}#${PUBLISH_KEY}#g; \
#                                    s#${ADMIN_URL}#${PUBLISH_URL}#g"
