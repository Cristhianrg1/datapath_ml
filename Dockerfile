FROM python:3.9

WORKDIR /app

COPY Pipfile Pipfile.lock ./
RUN apt-get update && apt-get install -y
RUN pip3 install pipenv
RUN pip3 install datapane
RUN pipenv install --dev --system --deploy

COPY scaler.pkl .
COPY model.pkl .

COPY main.py .

ENTRYPOINT ["python", "main.py"]