FROM python:3.9-slim

WORKDIR /app

COPY app.py app.py

RUN pip install Flask==2.0.1 Werkzeug==2.0.1

EXPOSE 5000

CMD ["python", "app.py"]