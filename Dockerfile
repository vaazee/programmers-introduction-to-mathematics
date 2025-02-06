FROM python:3.7-slim-buster

RUN pip3 install --upgrade pip setuptools wheel

RUN apt-get update \
    && apt-get install -y \
       build-essential \
       python3.7-dev \
       python-igraph \
       pkg-config \
       libfreetype6-dev \
       libpng-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


COPY . /pimbook
WORKDIR "/pimbook"


RUN pip3 install scipy
RUN pip3 install numpy
RUN pip3 install igraph
RUN pip3 install matplotlib
RUN pip3 install -r requirements.txt

RUN pip install --no-cache-dir --force-reinstall PyYAML

ENTRYPOINT ["bash"]
