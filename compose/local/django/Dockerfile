FROM ubuntu:19.04

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
&& apt-get -y upgrade
# psycopg2 dependencies
RUN apt-get install -y gcc python3-dev musl-dev
RUN apt-get install -y postgresql postgresql-contrib
# Pillow dependencies
RUN apt-get install -y libjpeg-dev zlib1g-dev libfreetype6-dev
# CFFI dependencies
RUN apt-get install -y libffi-dev python-cffi \
    && apt-get install -y postgresql-client \
    && apt-get install -y libxslt-dev libxml2-dev gettext

RUN addgroup --system django \
    && adduser --system --ingroup django django \
    # && apt-get install -y linux-headers-$(uname -r) \
    # libcrypto1.1 in alphine:
    && apt-get install -y libssl-dev  \
    # gdal-dev in alpine:
    && apt-get install -y gdal-bin libgdal-dev \
    # geos-dev in alpine:
    && apt-get install -y libgeos-dev \
    # proj-dev in alpine:
    && apt-get install -y libproj-dev proj-data proj-bin


# installing requirements
RUN apt-get install -y python3-pip
COPY ./requirements /requirements
RUN pip3 install -r /requirements/base.txt
RUN pip3 install -r /requirements/dev.txt

COPY ./compose/local/django/entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r//' /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN chown django /entrypoint.sh

RUN apt-get install -y rsync

COPY ./compose/local/django/start.sh /start.sh
RUN sed -i 's/\r//' /start.sh
RUN chmod +x /start.sh
RUN chown django /start.sh

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
