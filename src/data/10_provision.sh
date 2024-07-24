#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

curl --location 'http://localhost:1026/ngsi-ld/v1/entityOperations/upsert' \
--header 'Content-Type: application/json' \
-H 'Link: <http://context/ngsi-context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"' \
-H 'Accept: application/ld+json' \
-d @"${SCRIPTPATH}/10_monuments_madrid.json"
