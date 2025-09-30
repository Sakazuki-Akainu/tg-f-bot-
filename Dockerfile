# Don't Remove Credit @VJ_Botz
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

FROM python:3.10-slim

# Install git and clean up cache
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY requirements.txt /requirements.txt

# Upgrade pip and install dependencies
RUN pip3 install --no-cache-dir -U pip && \
    pip3 install --no-cache-dir -r /requirements.txt

# Set working directory
WORKDIR /VJ-FILTER-BOT

# Copy project files
COPY . .

# Start bot
CMD ["python", "bot.py"]
