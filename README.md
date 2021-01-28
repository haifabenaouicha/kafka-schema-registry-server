# kafka-schema-registry-server

A sample project to deploy schema registry server under any kafka distribution (local, msk, confluent etc).

## Requirements: 
 - Zookeeper
 - Kafka
 - docker-compose

## Schema registry Server deployment
 To Run schema registry server , we first need both zookeeper and kafka server to be up.
 start zookeeper: ""
 start kafka server : ""
  "docker-compose up"  deploys schema registry server under 0.0.0.0:8081 

  Schema Registry server exposes a Rest API that we can query with Curl. In order to get the list of subjects do :
  "curl -X GET http://localhost:8081/subjects"

  ## Subject creation

  In order to create a new subject , we should register an avro schema as follows: 

  "bash register-schema.sh http://0.0.0.0:8081  
   path/test-schema.avsc  record"

   The different versions of the schema persisted under record subject can be fetched as follows:  
   "curl -X GET http://localhost:8081/subjects/record/versions"


   The content of a specific version of the avro schema under record subject can be fetched as follows: 
   "curl -X GET http://localhost:8081/subjects/record/versions/1"



 
