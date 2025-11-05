# Small, fast base image
FROM python:3.12-slim

# Prevent .pyc files & set unbuffered stdout
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Workdir
WORKDIR /app

# Install deps (use layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source
COPY app ./app

# Expose Flask port
EXPOSE 5000

# Run
CMD ["python", "app/app.py"] 