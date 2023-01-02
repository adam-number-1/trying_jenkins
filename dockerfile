FROM adamstrejcovsky/jdk-python:3.11
WORKDIR /var/lib/jenkins
COPY requirements.txt requirements.txt
RUN pip install -r requirements
COPY . .
CMD ["python3","-m","main"]