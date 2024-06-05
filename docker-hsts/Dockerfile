# Utiliser une image de base de Nginx
FROM nginx:alpine

# Copier les fichiers de configuration et HTML dans l'image
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./html /usr/share/nginx/html
COPY ./ssl /etc/nginx/ssl
