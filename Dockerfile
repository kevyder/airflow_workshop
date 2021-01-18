FROM puckel/docker-airflow:1.10.9


COPY ./requirements.txt /requirements.txt
COPY ./scripts/entrypoint.sh /entrypoint.sh
COPY ./airflow.cfg /usr/local/airflow/airflow.cfg

WORKDIR /
ENV AIRFLOW_HOME=/usr/local/airflow

RUN pip install --upgrade pip
RUN pip install --user -r /requirements.txt

ENTRYPOINT [ "/entrypoint.sh" ]

COPY . /