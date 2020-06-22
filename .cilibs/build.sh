#!/bin/bash -e

GATE_VERSION=release-1.20.x
BUILD_OS=linux
BUILD_ARCH=amd64


while getopts "o:a:g" opt; do
  case ${opt} in
    o) #Build OS
      BUILD_OS=${OPTARG}
      ;;
    a) #Build arch
      BUILD_ARCH=${OPTARG}
      ;;
    g) #Gate version
      GATE_VERSION=${OPTARG}
      ;;
    c) #Send Coverity
      SEND_COVERITY=${OPTARG}
      ;;
  esac
done

./get_dependencies.sh

./examine_source_code_with_go_get.sh

./execute_go_tests.sh

./compile_code.sh -o ${BUILD_OS} -a ${BUILD_ARCH} -g ${GATE_API_BRANCH}

./calculate_code_coverage.sh $SEND_COVERITY

./check_linting.sh

./copy_binaries_for_later_use.sh

./generate_checksum.sh -o ${BUILD_OS} -a ${BUILD_ARCH} -g ${GATE_API_BRANCH}

