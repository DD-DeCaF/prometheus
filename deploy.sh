#!/usr/bin/env bash

# Copyright 2018 Novo Nordisk Foundation Center for Biosustainability, DTU.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

SHA=$(git rev-parse HEAD)
IMAGE_SHA=gcr.io/dd-decaf-cfbf6/prometheus:${SHA::12}
IMAGE_LATEST=gcr.io/dd-decaf-cfbf6/prometheus:latest
docker build -t ${IMAGE_SHA} -t ${IMAGE_LATEST} .
docker push ${IMAGE_SHA}
docker push ${IMAGE_LATEST}
kubectl set image deployment/prometheus prometheus=${IMAGE_SHA}
