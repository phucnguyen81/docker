# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install needed python packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Install needed commands
RUN apt-get update && apt-get install -y curl

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV PYTHON_APP_PORT 8080

# Run app.py when the container launches
# TODO pass port into app.py
CMD ["python", "app.py"]