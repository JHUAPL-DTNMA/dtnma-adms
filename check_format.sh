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
./yang-normalize.sh ietf-*.yang iana-*.yang

changed=$(git status --porcelain=1)
if [ -n "${changed}" ]; then
  echo "Error: Files changed after formatting:"
  git diff
  exit 1
fi

