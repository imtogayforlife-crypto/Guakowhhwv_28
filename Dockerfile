FROM python:3.10-slim-bookworm

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /requirements.txt

RUN mkdir -p /VJ-Forward-Bot

WORKDIR /VJ-Forward-Bot

COPY . /VJ-Forward-Bot

CMD gunicorn app:app & python3 main.py
