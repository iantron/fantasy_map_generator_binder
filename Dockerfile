FROM jupyter/minimal-notebook:1386e2046833

RUN pip install --no-cache-dir vdom==0.5

USER root
RUN apt-get update && apt-get -y install libcairo2-dev cmake python2.7 python-pip git pkg-config python-setuptools python-dev
RUN pip install pycairo
RUN pip --version
RUN python --version

WORKDIR /fantasy_map_generator
RUN git clone https://github.com/rlguy/FantasyMapGenerator.git .
WORKDIR build
RUN cmake ..
RUN make
VOLUME /share

USER $NB_UID