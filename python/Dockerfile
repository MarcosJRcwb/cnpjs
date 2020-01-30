FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN mkdir /app && apt-get install -y python3-pandas python3-numpy python3-matplotlib python3-ipython python3-sympy figlet && \
    pip3 install --upgrade pip jupyter pandarallel qgrid pyarrow pipenv_to_requirements
RUN pip3 install metaphone fuzzywuzzy python-Levenshtein
RUN pip3 install --upgrade pip
RUN pip3 install psycopg2-binary
WORKDIR /app
RUN apt-get install -y make gcc git
RUN cd /app && git clone https://github.com/bkmeneguello/MTFN.git
RUN apt-get update
RUN apt-get install -y maven --fix-missing
RUN cd /app/MTFN && mvn package
RUN apt-get install -y jython

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--allow-root", "--ip=0.0.0.0", "--NotebookApp.token=''", "--NotebookApp.password=''"]
