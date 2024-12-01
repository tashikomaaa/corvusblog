#!/bin/bash

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Fonction pour afficher les messages colorés
info() { echo -e "${BLUE}[INFO]${RESET} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${RESET} $1"; }
error() { echo -e "${RED}[ERROR]${RESET} $1"; }
warning() { echo -e "${YELLOW}[WARNING]${RESET} $1"; }

# Obtenir la date et l'heure actuelle
dt=$(date '+%d/%m/%Y %H:%M:%S')
info "Date et heure actuelle : $dt"

# Exécuter le script Python
info "Exécution du script Python 'images.py'..."
if python3 images.py; then
    success "Script Python exécuté avec succès."
else
    error "Échec de l'exécution du script Python."
    exit 1
fi

# Ajouter les fichiers au dépôt Git
info "Ajout des fichiers au suivi Git..."
if git add . > /dev/null 2>&1; then
    success "Fichiers ajoutés avec succès."
else
    error "Échec lors de l'ajout des fichiers à Git."
    exit 1
fi

# Commit avec message
info "Commit des modifications avec le message : 'update new version - $dt'..."
if git commit -m "update new version - $dt" > /dev/null 2>&1; then
    success "Commit réalisé avec succès."
else
    error "Échec lors du commit."
    exit 1
fi

# Pousser les modifications vers le dépôt distant
info "Poussée des modifications vers le dépôt distant..."
if git push > /dev/null 2>&1; then
    success "Modifications poussées avec succès."
else
    error "Échec lors de la poussée des modifications."
    exit 1
fi

success "Script terminé avec succès."
