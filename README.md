# Docker Debian

Ce projet sert à s'entrainer sur une machine Debian 12 (la version est modifiable dans le fichier Dockerfile). Cela vous évite de créer une vraie machine virtuel. Vous pouvez installer par défaut des packages si besoin, et modifier le nom d'utilisateur par défaut.

## Variables d'environnement

```yaml
environment:
    - USERNAME=<default user> # Not required, default : debian
    - PASSWORD=<password of default user> # Not required, default : debian
    - PACKAGES=<packages> # Not required
```

## Exposer des ports

Pour ouvrir les ports, veuillez exposer les ports à utiliser dans Dockerfile (avant le lancement de votre projet).

Il faut ensuite bind les ports dans le fichier docker-compose.yaml.

Pour ces deux steps, référez vous à l'exemple du port SSH.

## Installation

Créer l'image : `docker build -t debian-vm .`

Lancer un exemple : `docker compose up -d`

Se connecter à l'exemple : `ssh debian@localhost -p 3322`
