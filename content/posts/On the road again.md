---
title: corvusblog
date: 2024-11-30
draft: false
tags:
  - tech
  - tasky
---

On y va on se lance pour de bon !


---

On commence donc par créer le ficher qui va gérer les commandes reçu.

donc on créer le dossier du projet:

```bash
mkdir tasky
cd tasky
```

on créer ensuite le dossier pour les scripts
```bash
mkdir src
cd src
```

et finalement le fichier pour les commandes cli
```bash
touch cli.js
```

Maintenant on va devoir ajouter quelque librairies pour pouvoir faire ce que l'on veut

on va avoir besoin de:
- [Commander](https://www.npmjs.com/package/commander) solution pour les script node en cli
- [chalk](https://www.npmjs.com/package/chalk) Pour mettre un peu de couleurs dans nos vies !
- [pidusage](https://www.npmjs.com/package/pidusage) Pour connaitre le pourcentage d'utilisation du cpu pour chaque process

on va donc installer tout ça !
on retourne a la racine du projet 
```bash
cd ..
```

on va initier le projet et installer les dependences:
```bash
npm init
npm install commander chalk pidusage
```

