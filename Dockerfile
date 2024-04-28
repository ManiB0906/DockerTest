# Use an official Python runtime as a parent image
FROM python:3.9.16
# Install pip
RUN apt-get update
RUN apt-get install -y python3-pip
# Install virtualenv
RUN pip install virtualenv
# Create a virtual environment
RUN python3 -m venv venv
# Make port 5000 available to the world outside this container
EXPOSE 5000
# Copy the current directory contents into the container
COPY . .
# Install any needed dependencies specified in requirements.txt
RUN venv/bin/pip install --no-cache-dir -r requirements.txt
# Run app.py when the container launches
CMD ["venv/bin/python3", "app.py"]