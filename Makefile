# Copyright 2017 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

.PHONY: all flexadapter nfs hostpath clean

all: flexadapter nfs hostpath

flexadapter:
	if [ ! -d ./vendor ]; then dep ensure; fi
	go build -o _output/flexadapter ./flexadapter/app
nfs:
	if [ ! -d ./vendor ]; then dep ensure; fi
	go build -o _output/nfsdriver ./nfs/app
hostpath:
	if [ ! -d ./vendor ]; then dep ensure; fi
	go build -i -o _output/hostpath ./hostpath/app

clean:
	go clean -r -x
	-rm -rf _output
