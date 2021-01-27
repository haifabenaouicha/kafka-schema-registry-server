#!/usr/bin/env bash

#################################################################
# Usage: register avsc measurements schema under schema registry server ...
#
# Expects
# - `register-schema.sh` expects  the following input arguments: the path of .avsc file, the schema registry url and the topic name with underscores substituted
# Please note that, currently the provided path for the .avsc file correspnds to a local path 
#
# Does
# - checks if the required  input arguments are provided
# - persists measurements avro schema under  Greenflex schema registry server :  http://schema-registry-rd.prv.dev.iq.greenflex.com:8081 within the subject :cumulocity-measurements-topic-value
#################################################################




usage_and_exit() {
 cat <<EOM
     Registration of measurements avro schema requires:
       - A valid url for the schema registry server
       - A valid path for the avsc file
       - A valid subject name

EOM
exit 1
}

check_prx_args() {
 declare  SCHEMA_REGISTRY_SERVER_URL="$1"
 declare  AVSC_PATH="$2"
 declare  SUBJECT_NAME="$3"
 if [[ -z "$SCHEMA_REGISTRY_SERVER_URL" ]] || [[ -z "$AVSC_PATH" ]] || [[ -z "$SUBJECT_NAME" ]] ; then
    usage_and_exit
 fi
}

check_prx_args "$1" "$2" "$3"

SCHEMA_REGISTRY_SERVER_URL="$1"
AVSC_PATH="$2"
SUBJECT_NAME="$3"

python register-schema.py "$SCHEMA_REGISTRY_SERVER_URL"  "$AVSC_PATH"  "$SUBJECT_NAME"

