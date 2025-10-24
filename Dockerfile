# Railway Deployment Dockerfile for LightRAG
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching (without lightrag)
COPY requirements.txt .

# Install Python dependencies (excluding lightrag)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application
COPY . .

# Debug: List contents to verify file structure
RUN echo "=== Checking /app contents ===" && \
    ls -la /app/ && \
    echo "=== Checking LightRAG-1.4.6 directory ===" && \
    ls -la /app/LightRAG-1.4.6/ && \
    echo "=== Checking for setup files ===" && \
    find /app/LightRAG-1.4.6/ -name "setup.py" -o -name "pyproject.toml"

# Install local LightRAG package with explicit path and build tools
RUN cd /app/LightRAG-1.4.6 && \
    pip install --upgrade pip setuptools wheel && \
    pip install -e . --verbose

# Create necessary directories
RUN mkdir -p inputs rag_storage logs

# Set environment variables for Railway
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1
ENV HOST=0.0.0.0
ENV PORT=8080

# Expose the port that Railway expects
EXPOSE 8080

# Start the application
CMD ["python", "start.py"]