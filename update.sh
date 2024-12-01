#!/bin/bash

# Obtenir la date et l'heure actuelles
dt=$(date '+%d/%m/%Y %H:%M:%S')
echo "[INFO] Début du script à $dt"

# Exécuter le script Python
echo "[INFO] Exécution du script Python (images.py)..."
if python3 images.py; then
    echo "[SUCCESS] Script Python exécuté avec succès."
else
    echo "[ERROR] Échec de l'exécution du script Python." >&2
    exit 1
fi

# Ajouter les modifications à Git
echo "[INFO] Ajout des modifications au suivi Git..."
if git add . > /dev/null 2>&1; then
    echo "[SUCCESS] Modifications ajoutées avec succès."
else
    echo "[ERROR] Échec de l'ajout des modifications à Git." >&2
    exit 1
fi

# Commit avec un message incluant la date et l'heure
echo "[INFO] Création d'un commit avec le message : 'update new version - $dt'"
if git commit -m "update new version - $dt" > /dev/null 2>&1; then
    echo "[SUCCESS] Commit créé avec succès."
else
    echo "[ERROR] Échec de la création du commit." >&2
    exit 1
fi

# Push des modifications vers le dépôt distant
echo "[INFO] Envoi des modifications au dépôt distant..."
if git push > /dev/null 2>&1; then
    echo "[SUCCESS] Modifications poussées avec succès."
else
    echo "[ERROR] Échec de l'envoi des modifications au dépôt distant." >&2
    exit 1
fi

# Fin du script
echo "[INFO] Script terminé avec succès."
