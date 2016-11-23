FROM python:3.4

# Build
COPY . /code
WORKDIR /code
RUN python setup.py install
RUN pip install passlib
WORKDIR /
RUN rm -rf /pypiserver

# Data Directory
RUN mkdir -p /data/packages
WORKDIR /data

# Set the entrypoint
ENTRYPOINT ["pypi-server"]

# Set the default command
CMD ["-p", "80", "packages"]

# Expose the port
EXPOSE 80
