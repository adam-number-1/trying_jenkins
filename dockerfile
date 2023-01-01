FROM python:3.11.0-alpine
RUN mkdir /app
WORKDIR /app
COPY . .
CMD ["python3","-m","main"]