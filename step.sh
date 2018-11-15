#!/bin/bash
set -ex

if [ -z ${directory_to_zip+x} ]; then
	echo "directory_to_zip environment variable is not set, make sure you run this step after the xcode-archive step."
	exit 1
fi
if [ -z ${include_directory+x} ]; then
	echo "include_directory environment variable is not set, make sure you run this step after the xcode-archive step."
	exit 1
fi
if [ ! -e ${directory_to_zip} ]; then
	echo "Could not find ${directory_to_zip} directory, please make sure it exists."
	exit 1
fi

if [ ${include_directory} == false ]; then
	cd ${directory_to_zip}
	zip -r ${directory_to_zip}.zip ./*
else
	zip -r ${directory_to_zip}.zip ${directory_to_zip}
fi

envman add --key ZIP_FILE --value $(pwd)/temp.zip
