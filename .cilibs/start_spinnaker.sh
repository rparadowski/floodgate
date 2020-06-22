#!/bin/bash -e

GATE_API_BRANCH=$1
FLOODGATE_EXTRA_PARAMS=$2

./prepare_directories.sh

./install_toolset.sh

./update_hosts.sh

./wait_for_dpkg.sh

./install_spinnaker_and_configure_floodgate.sh $GATE_API_BRANCH

./test_floodgate_against_running_spinnaker_instance.sh $FLOODGATE_EXTRA_PARAMS
