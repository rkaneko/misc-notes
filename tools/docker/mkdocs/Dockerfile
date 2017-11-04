FROM python:3.6
MAINTAINER rkaneko<kanek.o.dev@gmail.com>

WORKDIR /usr/src/app

# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -U pip \
    && pip install mkdocs \
    && pip install mkdocs-material \
    && pip install pygments \
    && pip install python-markdown-math \
    && pip install fontawesome_markdown

CMD ["python", "-V"]
