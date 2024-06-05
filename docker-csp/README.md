    Modifier le fichier default.conf pour ajouter l'entête CSP :

nginx

server {
    listen 80;
    server_name localhost;

    root /usr/share/nginx/html;
    index index.html;

    location / {
        add_header Content-Security-Policy "default-src 'self'; script-src 'self';";
        try_files $uri $uri/ =404;
    }
}

    Créer un fichier main.js et déplacer le script inline :

Créer un fichier html/main.js :

javascript

function showMessage(message) {
    document.getElementById('message').innerHTML = message;
}

document.getElementById('messageForm').onsubmit = function(event) {
    event.preventDefault();
    showMessage(document.getElementById('userInput').value);
}

Modifier index.html pour inclure le fichier JS :

html

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSP Demo</title>
    <script src="main.js"></script>
</head>
<body>
    <h1>Content Security Policy Demo</h1>
    <form id="messageForm">
        <label for="userInput">Enter a message:</label>
        <input type="text" id="userInput" name="userInput">
        <button type="submit">Submit</button>
    </form>
    <div id="message"></div>
</body>
</html>

    Rebâtir et relancer le conteneur Docker :
