FROM dockerfile/java:oracle-java8

MAINTAINER Norbert Schultz

VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

RUN curl -L https://download.jetbrains.com/teamcity/TeamCity-9.0.2.tar.gz | tar xz -C /opt

# Download Postgres JDBC Driver
RUN curl -L -O https://jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc41.jar 
# todo: copy that to the data volume doesn't work in docker

EXPOSE 8111
CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]

