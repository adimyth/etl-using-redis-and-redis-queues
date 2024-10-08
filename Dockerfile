FROM python:3.10.8-slim-buster

WORKDIR /app/ 

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY users.sql .
COPY src /app/src

# Set the Python path to include /app
ENV PYTHONPATH=/app

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0"]