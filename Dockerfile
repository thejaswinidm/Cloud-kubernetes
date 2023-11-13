# Use the official Python image as the base image
FROM --platform=linux/amd64 python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy your application code to the container
COPY . /app

#RUN apk --update --upgrade add --no-cache gcc musl-dev jpeg-dev zlib-dev libffi-dev cairo-dev pango-#dev gdk-pixbuf-dev

# Install the required dependencies
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install --upgrade flask werkzeug

# Expose the port your Flask app will run on
EXPOSE 80

# Start the Flask application
ENTRYPOINT python app.py

