#!/bin/bash
shopt -s extglob; set +H
#megadl --path=mc.zip ${MEGA_URL}
wget https://www.tekx.it/downloads/0.96Tekxit3Server.zip
unzip 0.96Tekxit3Server.zip -d /data-temp
#mv -v data-temp/*/* data/
mv -v data-temp/*/!(server.properties|ops.json|banned-ips.json|banned-players.json|whitelist.json|usercache.json) data/
rm -r -f /data-temp 
rm -r -f ./mc.zip
jarfile=$(cd /data && ls|grep forge-*.jar)
cd /data && java -server "-Xmx${INIT_MEM}" "-Xms${MAX_MEM}" "-Dfml.queryResult=confirm" -jar $jarfile nogui
