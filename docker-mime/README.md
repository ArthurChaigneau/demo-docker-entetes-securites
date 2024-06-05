Explication de l'attaque

    Sans l'en-tête X-Content-Type-Options : Le navigateur peut décider de traiter malicious.js comme un script même si le serveur le sert avec un type de contenu différent (par exemple, text/plain). Dans ce cas, le script JavaScript sera exécuté et une alerte XSS Attack via MIME Sniffing! apparaîtra.
    Avec l'en-tête X-Content-Type-Options: nosniff : Le navigateur ne devinera pas le type de contenu et respectera le type fourni par le serveur. Par exemple, s'il est servi en tant que text/plain, il ne l'exécutera pas comme un script JavaScript.
