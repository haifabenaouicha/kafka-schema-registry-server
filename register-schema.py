#!/usr/bin/python

import os
import sys

import requests

schema_registry_url = sys.argv[1]
schema_avsc_file_path = sys.argv[2]
subject_name = sys.argv[3]
aboslute_path_to_schema = os.path.join(os.getcwd(), schema_avsc_file_path)



with open(aboslute_path_to_schema, 'r') as content_file:
    schema = content_file.read()

payload = "{ \"schema\": \"" \
          + schema.replace("\"", "\\\"").replace("\t", "").replace("\n", "") \
          + "\" }"

url = schema_registry_url + "/subjects/" + subject_name + "/versions"
headers = {"Content-Type": "application/vnd.schemaregistry.v1+json"}

register_request = requests.post(url, headers=headers, data=payload)
if register_request .status_code == requests.codes.ok:
    print("Registration of .avsc schema was done with success")
else:
    register_request .raise_for_status()