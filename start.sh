#!/bin/bash
shopt -s extglob; set +H
#megadl --path=mc.zip ${MEGA_URL}
wget ${MEGA_URL} -O mc.zip
unzip mc.zip -d /data-tem
#mv -v data-temp/*/* data/
mv -v data-temp/*/!(server.properties|ops.json|banned-ips.json|banned-players.json|whitelist.json|usercache.json) data/
rm -r -f /data-temp 
rm -r -f ./mc.zip
jarfile=$(cd /data && ls|grep forge-*.jar)
cd /data && java -server "-Xms${INIT_MEM}" "-Xmx${MAX_MEM}" "-Dfml.queryResult=confirm" -jar $jarfile nogui
