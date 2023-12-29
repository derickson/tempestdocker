FROM python:3.10

# Update and install cron and vim
RUN apt-get update && apt-get -y install cron vim

# Set the working directory in the container to /app
WORKDIR /app

# Copy necessary files to /app
COPY crontab /etc/cron.d/crontab
COPY temp.py ./
COPY .env ./
COPY requirements.txt ./

# Install required Python packages
RUN pip install -r requirements.txt

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Apply cron job
RUN /usr/bin/crontab /etc/cron.d/crontab

# Run the Python script and then exit
CMD ["python", "temp.py"]

# run crond as main process of container
# CMD ["cron", "-f"]
