Sensibilisation

    X-Frame-Options : L'absence de l'en-tête X-Frame-Options permet à la page malveillante d'inclure l'application dans un iframe et de superposer des éléments invisibles pour tromper l'utilisateur.
    Impact : L'utilisateur pense cliquer sur un bouton inoffensif, mais en réalité, il clique sur le bouton de suppression de compte de l'application.
    Solution : Ajouter X-Frame-Options: DENY ou X-Frame-Options: SAMEORIGIN pour empêcher le contenu de l'application d'être inclus dans un iframe, empêchant ainsi le Clickjacking.
