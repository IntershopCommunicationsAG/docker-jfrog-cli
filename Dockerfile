#
# Copyright 2019 Intershop Communications AG.
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
#
FROM docker:18.09.6

ARG JFROG_CLI_VERSION="1.25.0"
ENV JFROG_CLI_DOWNLOAD_URL="https://jfrog.bintray.com/jfrog-cli-go/${JFROG_CLI_VERSION}/jfrog-cli-linux-amd64/jfrog"

RUN apk --update add curl \
 && curl -fL ${JFROG_CLI_DOWNLOAD_URL} -o /usr/local/bin/jfrog | sh \
 && apk del curl \
 && rm -rf /var/cache/apk/*
RUN docker -v
RUN chmod +x /usr/local/bin/jfrog
RUN jfrog -v
