FROM mathworks/matlab:r2023a

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mesa-utils software-properties-common && \
    add-apt-repository -y ppa:kisak/kisak-mesa && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/matlab && \
    chown -R matlab:matlab /opt/matlab

COPY ./drirc /home/matlab/.drirc
COPY ./drirc /etc/drirc
COPY ./java.opts /opt/matlab/R2023a/bin/glnxa64/java.opts

USER matlab