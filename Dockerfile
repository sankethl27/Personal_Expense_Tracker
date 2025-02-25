# Use a base image with Python
FROM python:3.11-slim AS builder

# Install system dependencies required for mysqlclient
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    python3-dev \
    libmariadb-dev-compat \
    libmariadb-dev

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
