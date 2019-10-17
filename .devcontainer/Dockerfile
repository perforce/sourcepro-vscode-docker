FROM centos:7

# General yum update.
RUN yum -y update

# Install general purpose development tools and libraries
RUN yum -y groupinstall "Development Tools" "Development Libraries"
RUN yum -y install cppcheck valgrind wget bzip2

# Update to Git 2.x
RUN yum -y remove git
RUN yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install  git2u-all

# Install SourcePro
COPY sourcepro_2018.2_linux_x86-64.run .
COPY license.key .
RUN chmod +x sourcepro_2018.2_linux_x86-64.run
RUN ./sourcepro_2018.2_linux_x86-64.run --mode unattended --license-file license.key
RUN rm license.key sourcepro_2018.2_linux_x86-64.run

# Build SourcePro
COPY buildspec.bsf .
RUN /root/RogueWave/SourcePro/2018.2/rcb/bin/rcb build -b buildspec.bsf \
    -D common.buildspace=/root/RogueWave/SourcePro/2018.2

# Move and clean up SourcePro install.
ENV SOURCEPRO /opt/SourcePro
RUN mkdir -p ${SOURCEPRO}/3rdparty
RUN mv /root/RogueWave/SourcePro/2018.2/3rdparty/icu-58.2 ${SOURCEPRO}/3rdparty
RUN cd /root/RogueWave/SourcePro/2018.2/ && mv lib rw ${SOURCEPRO}
RUN rm -rf /root/RogueWave/

# Add ICU 58 to library path.
ENV LD_LIBRARY_PATH ${SOURCEPRO}/3rdparty/icu-58.2/linux/em64t/lib:${LD_LIBRARY_PATH}

# Clean-up yum.
RUN yum -y autoremove

# Use bash instead of sh.
ENV SHELL /bin/bash