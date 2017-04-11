#!/bin/sh

################################################################################
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

echo "STARTUP"
sed -i -e "s/#max_inflight_messages 20/max_inflight_messages 100/g" /etc/mosquitto/mosquitto.conf
sed -i -e "s/#max_queued_messages 100/max_queued_messages 1000/g" /etc/mosquitto/mosquitto.conf
sed -i -e "s/#pid_file/pid_file \/var\/run\/mosquitto.pid/g" /etc/mosquitto/mosquitto.conf
#sed -i -e "s/log_dest syslog/log_dest file \/var\/log\/mosquitto.log/g" /etc/mosquitto/mosquitto.conf
sed -i -e "s/log_dest syslog/log_dest none/g" /etc/mosquitto/mosquitto.conf
#sed -i -e "s/#log_type error/log_type error/g" /etc/mosquitto/mosquitto.conf
#sed -i -e "s/#log_type warning/log_type warning/g" /etc/mosquitto/mosquitto.conf
#sed -i -e "s/#log_type notice/log_type notice/g" /etc/mosquitto/mosquitto.conf
#sed -i -e "s/#connection_messages true/connection_messages true/g" /etc/mosquitto/mosquitto.conf
#sed -i -e "s/#log_timestamp true/log_timestamp true/g" /etc/mosquitto/mosquitto.conf
/usr/sbin/mosquitto -d -c /etc/mosquitto/mosquitto.conf
#./bin/jmeter.sh -n -t flink-test.xml &
tail -f /dev/null 
