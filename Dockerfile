FROM python:3.11-slim

LABEL org.opencontainers.image.source="https://github.com/fikafredrik/maio3"
LABEL org.opencontainers.image.description="Virtual Diabetes Clinic ML service"
LABEL org.opencontainers.image.licenses="MIT"

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app
COPY train.py .
COPY CHANGELOG.md .

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
