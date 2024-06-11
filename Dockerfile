#
FROM python:3.10.9
#
WORKDIR /code
COPY . /code
#
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt update
RUN apt install nano
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
#
RUN pip install --upgrade pip
RUN pip install fastapi
CMD ["bash", "-c", "python -m uvicorn src.app.main:app --host 0.0.0.0 --port 8080"]