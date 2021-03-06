FROM python:3-alpine
WORKDIR /usr/src/app
EXPOSE 8000
COPY requirements.txt .
RUN pip install -qr requirements.txt
COPY server.py .
RUN addgroup user && adduser -DH -G user user
CMD ["python3", "./server.py"]
