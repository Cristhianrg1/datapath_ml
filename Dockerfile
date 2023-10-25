FROM python:3.9

WORKDIR /app

RUN pip3 install pipenv

COPY Pipfile Pipfile.lock ./

RUN pipenv install --dev --system --deploy

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY scaler.pkl model.pkl ./
COPY main.py .

ENTRYPOINT ["python", "main.py"]