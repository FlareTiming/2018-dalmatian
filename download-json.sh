#!/bin/bash

mkdir json
mkdir json/comp-input
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/comps | jq > json/comp-input/comps.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/nominals | jq > json/comp-input/nominals.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/pilots | jq > json/comp-input/pilots.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/tasks | jq > json/comp-input/tasks.json

mkdir json/task-length
curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/task-lengths | jq > json/task-length/task-lengths.json

mkdir json/gap-point
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/allocation | jq > json/gap-point/allocation.json
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/validity | jq > json/gap-point/validity.json
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/pilots-status | jq > json/gap-point/pilots-status.json

mkdir json/fs-score
curl -X GET -H "Accept:application/json" http://localhost:3000/fs-score/validity | jq > json/fs-score/validity.json

mkdir json/stats
curl -X GET -H "Accept:application/json" http://localhost:3000/stats/point-diff | jq > json/stats/point-diff.json

mkdir json/fs-score
mkdir json/cross-zone
mkdir json/cross-zone/track-flying-section
mkdir json/peg-frame
mkdir json/peg-frame/track-scored-section
mkdir json/tag-zone
mkdir json/pilot-track
mkdir json/mask-track
mkdir json/land-out
for t in {1..3}
    do
        mkdir json/comp-input/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-abs | jq > json/comp-input/$t/pilot-abs.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-dfnt | jq > json/comp-input/$t/pilot-dfnt.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-dnf | jq > json/comp-input/$t/pilot-dnf.json

        mkdir json/fs-score/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/fs-score/$t/score | jq > json/fs-score/$t/score.json

        mkdir json/task-length/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/spherical-edge | jq > json/task-length/$t/spherical-edge.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/ellipsoid-edge | jq > json/task-length/$t/ellipsoid-edge.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-spherical | jq > json/task-length/$t/projected-edge-spherical.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-ellipsoid | jq > json/task-length/$t/projected-edge-ellipsoid.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-planar | jq > json/task-length/$t/projected-edge-planar.json

        mkdir json/cross-zone/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/cross-zone/$t/flying-times | jq > json/cross-zone/$t/flying-times.json

        mkdir json/mask-track/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/reach-stats | jq > json/mask-track/$t/reach-stats.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/reach | jq > json/mask-track/$t/reach.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/bonus-reach | jq > json/mask-track/$t/bonus-reach.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/arrival | jq > json/mask-track/$t/arrival.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/lead | jq > json/mask-track/$t/lead.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/time | jq > json/mask-track/$t/time.json

        mkdir json/land-out/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/land-out/$t/effort | jq > json/land-out/$t/effort.json

        mkdir json/gap-point/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/pilot-df | jq > json/gap-point/$t/pilot-df.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/pilot-nyp | jq > json/gap-point/$t/pilot-nyp.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/validity-working | jq > json/gap-point/$t/validity-working.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/score | jq > json/gap-point/$t/score.json

        mkdir json/cross-zone/track-flying-section/$t
        mkdir json/peg-frame/track-scored-section/$t
        mkdir json/tag-zone/$t
        mkdir json/pilot-track/$t
        for p in {4,9,13,16,21,23,26,37,40,41,46,114,54,57,63,72,73,74,80,82,86,88,91,95,98,101,102,113}
            do
            curl -X GET -H "Accept:application/json" http://localhost:3000/cross-zone/track-flying-section/$t/$p | jq > json/cross-zone/track-flying-section/$t/$p.json
            curl -X GET -H "Accept:application/json" http://localhost:3000/peg-frame/track-scored-section/$t/$p | jq > json/peg-frame/track-scored-section/$t/$p.json
            curl -X GET -H "Accept:application/json" http://localhost:3000/tag-zone/$t/$p | jq > json/tag-zone/$t/$p.json
            curl -X GET -H "Accept:application/json" http://localhost:3000/pilot-track/$t/$p | jq > json/pilot-track/$t/$p.json
            done
    done
