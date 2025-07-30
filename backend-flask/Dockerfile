# Dockerfile is a build instruction file, not a script to be run directly.

# Use the official lightweight Python 3.10 image from Docker Hub
FROM python:3.10-slim-buster

# Set the working directory inside the container
WORKDIR /backend-flask

# Copy the requirements file and install Python dependencies
COPY requirements.txt requirements.txt
# Install the python libraries used for the app
RUN pip3 install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variables for Flask
ENV FLASK_ENV=development


EXPOSE ${PORT}

# Run the Flask app, binding it to all network interfaces on port 5000
# python3 -m flask run --host=0.0.0.0 --port=4567
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=4567"]
