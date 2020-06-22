#!/bin/bash -e

GATE_API_BRANCH=$1

./prepare_extra_directories.sh

./setup_swagger_codegen.sh

./get_gate_code.sh $GATE_API_BRANCH

./generate_swagger_json.sh

./generate_gateapi_go_code.sh

