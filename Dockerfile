FROM tensorflow/tensorflow:1.14.0-py3
RUN pip install pipenv
RUN mkdir /src
COPY Pipfile /src
COPY Pipfile.lock /src
WORKDIR /src
RUN pipenv install --system
COPY . /src
CMD exec gunicorn --bind :5000 --workers 1 --threads 8 app:app
#ENTRYPOINT ["exec", "gunicorn", "--bind", ":$PORT", ""]