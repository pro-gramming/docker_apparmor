#!/bin/bash
data_directory=/opt/app/data
mkdir -p ${data_directory}
echo "=> File created at `data`" | tee ${data_directory} create.log


# Provide it execution  permission
# Then see created log at /opt/app/data/create.log