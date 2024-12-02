import os
import re
import shutil

# Chemins
posts_dir = "/home/corvus/corvusblog/content/posts"
attachments_dir = "/home/corvus/corvusblog/content"
static_images_dir = "/home/corvus/corvusblog/static/images/"

# Couleurs ANSI
RESET = "\033[0m"
RED = "\033[0;31m"
GREEN = "\033[0;32m"
BLUE = "\033[0;34m"
YELLOW = "\033[1;33m"

# Fonctions pour affichage coloré
def info(message):
    print(f"{BLUE}[INFO]{RESET} {message}")

def success(message):
    print(f"{GREEN}[SUCCESS]{RESET} {message}")

def warning(message):
    print(f"{YELLOW}[WARNING]{RESET} {message}")

def error(message):
    print(f"{RED}[ERROR]{RESET} {message}")

# Vérification que les répertoires existent
if not os.path.exists(posts_dir):
    error(f"Répertoire introuvable : {posts_dir}")
    raise FileNotFoundError(f"Répertoire introuvable : {posts_dir}")

if not os.path.exists(static_images_dir):
    os.makedirs(static_images_dir)
    info(f"Répertoire créé : {static_images_dir}")

# Étape 1 : Traitement de chaque fichier Markdown
for filename in os.listdir(posts_dir):
    if filename.endswith(".md"):
        filepath = os.path.join(posts_dir, filename)
        info(f"Traitement du fichier : {filename}")

        with open(filepath, "r", encoding="utf-8") as file:
            content = file.read()

        # Étape 2 : Trouver tous les liens d'images au format [[image.png]]
        images = re.findall(r'\[\[([^]]+\.(?:png|jpg|jpeg|gif))\]\]', content)
        if not images:
            info(f"Aucune image avec le format [[image.png]] trouvée dans {filename}.")
            continue  # Passer au fichier suivant si aucune image à remplacer

        # Copie du contenu d'origine pour comparaison
        original_content = content

        # Étape 3 : Remplacement des liens d'images
        for image in images:
            # Préparer le lien Markdown compatible
            markdown_image = f"![Image Description](https://tashikomaaa.github.io/corvusblog/images/{image.replace(' ', '%20')})"
            content = content.replace(f"[[{image}]]", markdown_image)

            # Étape 4 : Copier l'image dans le répertoire static/images
            image_source = os.path.join(attachments_dir, image)
            if os.path.exists(image_source):
                shutil.copy(image_source, static_images_dir)
                success(f"Image copiée : {image}")
            else:
                warning(f"Image introuvable : {image_source}")

        # Étape 5 : Vérifier si le fichier a été modifié avant d'écrire
        if content != original_content:
            with open(filepath, "w", encoding="utf-8") as file:
                file.write(content)
            success(f"Fichier mis à jour : {filename}")
        else:
            info(f"Aucune modification nécessaire pour le fichier : {filename}")

success("Tous les fichiers Markdown ont été traités.")
