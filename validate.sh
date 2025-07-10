#!/bin/bash
##
## Copyright (c) 2011-2025 The Johns Hopkins University Applied Physics
## Laboratory LLC.
##
## This file is part of the Delay-Tolerant Networking Management
## Architecture (DTNMA) Tools package.
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##     http://www.apache.org/licenses/LICENSE-2.0
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
set -e

USAGE="Usage: $0 [filename] {... filename}"
if [ "$#" -eq "0" ]; then
    echo "$USAGE"
    exit 1
fi

SELFDIR=$(readlink -f $(dirname "${BASH_SOURCE[0]}"))
# line length to allow RFC doc indentation
LINTOPTS="--ietf --lint-ensure-hyphenated-names --max-line-length=69 --adm-check-refs"
VALIDATE="ace_adm --path=${SELFDIR} ${LINTOPTS}"

# Validate a single ADM module file
# Arguments:
#  1: The file path to normalize
#
function validate {
    FILEPATH=$1
    shift

    if [ ! -f "${FILEPATH}" ]; then
        echo "File is missing: ${FILEPATH}" >/dev/stderr
        return 1
    fi

    echo "Validating ${FILEPATH}"
    ${VALIDATE} "${FILEPATH}"
}

ERRCOUNT=0
for FILEPATH in "$@"
do
    if ! validate "${FILEPATH}"
    then
        ERRCOUNT=$(($ERRCOUNT + 1))
    fi
done
exit ${ERRCOUNT}
