FROM ubuntu:latest
RUN apt-get update && apt-get install -y netcat
VOLUME /code
COPY run.sh /code/run.sh
WORKDIR /code
RUN chmod +x run.sh
CMD ./run.sh