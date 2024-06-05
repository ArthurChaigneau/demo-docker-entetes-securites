#!/bin/bash

# Build Docker images for each scenario

# Scenario 1: Clickjacking vulnerability (missing X-Frame-Options)
cd docker-xframe
docker build -t docker-xframe .
cd ..

# Scenario 2: XSS vulnerability (missing Content-Security-Policy)
cd docker-csp
docker build -t docker-csp .
cd ..

# Scenario 3: SSL Stripping vulnerability (missing HSTS)
cd docker-hsts
docker build -t docker-hsts .
cd ..

# Scenario 4: MIME Sniffing vulnerability (missing X-Content-Type-Options)
cd docker-mime
docker build -t docker-mime .
cd ..

cd docker-referrer
docker build -t docker-referrer .
cd ..

cd docker-feature
docker build -t docker-feature .
cd ..

echo "Docker images built successfully."

