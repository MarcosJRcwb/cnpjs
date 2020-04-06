FROM postgres

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install postgresql-contrib

WORKDIR /usr/src/postgres

VOLUME /var/lib/postgresql/data
ENTRYPOINT ["/usr/src/postgres/docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]

RUN mkdir /externo
RUN chmod 777 /externo
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen pt_BR.UTF-8
RUN sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR:pt
ENV LC_ALL pt_BR.UTF-8
RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.utf-8
ENV LANG pt_BR.utf8
#RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/pg_hba.conf
#RUN echo "listen_addresses='*'" >> /etc/postgresql/postgresql.conf
USER postgres
EXPOSE 5432
