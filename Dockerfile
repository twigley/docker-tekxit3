FROM openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

# default url to start with
ENV MEGA_URL=https://www.tekx.it/downloads/0.96Tekxit3Server.zip                                                                            
# min memory use for this modpack
ENV INIT_MEM=4G
ENV MAX_MEM=4G
                                                                                                                                                                                                                                                                #startup script
COPY ./start.sh start.sh    
#make sure startup script can run
RUN chmod +x ./start.sh

#define the volume
VOLUME [ "/data" ]
#execute startup script on startup
ENTRYPOINT [ "./start.sh" ]
