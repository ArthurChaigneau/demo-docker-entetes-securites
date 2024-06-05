#!/bin/bash

# Start Docker containers for each scenario

# Scenario 1: Clickjacking vulnerability (missing X-Frame-Options)
docker run -d -p 80:80 --name docker-xframe docker-xframe

# Scenario 2: XSS vulnerability (missing Content-Security-Policy)
docker run -d -p 81:80 --name docker-csp docker-csp

# Scenario 3: SSL Stripping vulnerability (missing HSTS)
docker run -d -p 82:80 -p 83:443 --name docker-hsts docker-hsts

# Scenario 4: MIME Sniffing vulnerability (missing X-Content-Type-Options)
docker run -d -p 84:80 --name docker-mime docker-mime

# Scenario 5: Referrer Policy vulnerability (missing Referrer-Policy)
docker run -d -p 85:80 --name docker-referrer docker-referrer

# Scenario 6: Feature Policy vulnerability (missing Feature-Policy)
docker run -d -p 86:80 --name docker-feature docker-feature

echo "Docker containers started successfully."
