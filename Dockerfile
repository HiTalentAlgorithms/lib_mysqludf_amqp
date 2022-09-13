FROM mysql:8.0.27
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29 &&\
    apt update &&\
    apt install -y build-essential autoconf libtool git pkg-config libbsd-dev librabbitmq-dev libmysqlclient-dev
RUN git clone https://github.com/HiTalentAlgorithms/lib_mysqludf_amqp.git
RUN cd lib_mysqludf_amqp/ &&\
    ./autogen && ./configure && make && make install
RUN apt remove -y build-essential pkg-config autoconf libtool git &&\
    cd .. && rm -rf lib_mysqludf_amqp
