#!/bin/bash

chown esUser:esUser /opt/elasticsearch/data -R
su -c "/opt/elasticsearch/bin/elasticsearch" esUser
