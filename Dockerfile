FROM python:3.9

WORKDIR /app

COPY Pipfile Pipfile.lock ./
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y && \
    pip3 install pipenv && \
    pip3 install datapane && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY scaler.pkl model.pkl ./
COPY main.py .

ENTRYPOINT ["python", "main.py"]