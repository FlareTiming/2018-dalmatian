#!/bin/bash

mkdir json
curl -X GET -H "Accept:application/json" http://localhost:3000/comps | jq > json/comps.json
curl -X GET -H "Accept:application/json" http://localhost:3000/nominals | jq > json/nominals.json
curl -X GET -H "Accept:application/json" http://localhost:3000/pilots | jq > json/pilots.json
curl -X GET -H "Accept:application/json" http://localhost:3000/tasks | jq > json/tasks.json

mkdir json/gap-point
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/allocation | jq > json/gap-point/allocation.json
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/validity | jq > json/gap-point/validity.json

mkdir json/cross-zone
mkdir json/task-length
for t in {1..3}
    do
        mkdir json/cross-zone/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/cross-zone/$t/pilot-dnf | jq > json/cross-zone/$t/pilot-dnf.json

        mkdir json/gap-point/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/validity-working | jq > json/gap-point/$t/validity-working.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/score | jq > json/gap-point/$t/score.json

        mkdir json/task-length/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/spherical-edge | jq > json/task-length/$t/spherical-edge.json
    done
