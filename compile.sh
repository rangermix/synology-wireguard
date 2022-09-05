#!/bin/bash

git pull

docker build --network=host -t synobuild .

docker run --network=host --rm --privileged --env PACKAGE_ARCH=<arch> --env DSM_VER=<dsm-ver> -v $(pwd)/artifacts:/result_spk synobuild
# docker run --network=host --rm --privileged --env PACKAGE_ARCH=apollolake --env DSM_VER=6.2 -v $(pwd)/artifacts:/result_spk -v $(pwd)/toolkit_tarballs:/toolkit_tarballs synobuild
