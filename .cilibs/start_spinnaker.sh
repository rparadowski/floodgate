#!/bin/bash -e

GATE_API_BRANCH=$1
FLOODGATE_EXTRA_PARAMS=$2

.cilibs/prepare_directories.sh

.cilibs/install_toolset.sh

.cilibs/update_hosts.sh

.cilibs/wait_for_dpkg.sh

.cilibs/install_spinnaker_and_configure_floodgate.sh $GATE_API_BRANCH

.cilibs/test_floodgate_against_running_spinnaker_instance.sh $FLOODGATE_EXTRA_PARAMS
