FROM ubuntu

RUN apt-get update

ADD requirements.txt /

RUN pip install -r requirements.txt

RUN mkdir /app

RUN cd /app

WORKDIR /app

COPY . /app

RUN snap install cmake --classic

RUN pip install git+https://github.com/Kojoley/atari-py.git

EXPOSE 8000

CMD ["python", "tf-test.py"]
