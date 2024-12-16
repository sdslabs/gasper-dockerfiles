FROM python:3.11.11-alpine3.21

# Install system dependencies for building Python packages and other image processing libraries for Pillow
RUN apk add --no-cache \
    build-base \
    jpeg-dev \
    zlib-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    tiff-dev \
    freetype-dev \
    lcms2-dev \
    openjpeg-dev \
    tiff-dev \
    musl-dev \
    curl \
    git

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel
CMD ["tail", "-f", "/dev/null"]
