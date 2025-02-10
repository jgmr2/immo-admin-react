# Front Admin - React + Vite

Ce projet est une application d'administration construite avec React et Vite.

## Instructions

### Installation des dépendances

Pour installer les dépendances du projet, exécutez :

```sh
npm install
```

### Développement

Pour démarrer le serveur de développement, exécutez :

```sh
npm run dev
```

### Construction

Pour construire l'application pour la production, exécutez :

```sh
npm run build
```

### Prévisualisation

Pour prévisualiser la version de production de l'application, exécutez :

```sh
npm run preview
```

### Linting

Pour vérifier le code avec ESLint, exécutez :

```sh
npm run lint
```

## Docker

Pour construire et exécuter l'application avec Docker, utilisez les commandes suivantes :

```sh
docker build -t front_admin .
docker run -p 80:80 front_admin
```

## Docker Compose

Pour utiliser Docker Compose et exécuter tous les services définis dans le fichier `docker-compose.yml`, utilisez les commandes suivantes :

### Créer un fichier `docker-compose.yml`

```yaml
version: '3.8'

services:
  immo-admin-react:
    build:
      context: ./immo-admin-react
      dockerfile: Dockerfile
    ports:
      - "3000:80"

  immo-api-php:
    build:
      context: ./immo-api-php
      dockerfile: Dockerfile
    ports:
      - "8080:80"
    environment:
      - DB_HOST=db
      - DB_DATABASE=immo
      - DB_USERNAME=root
      - DB_PASSWORD=root
    depends_on:
      - db

  immo-client-vue:
    build:
      context: ./immo-client-vue
      dockerfile: Dockerfile
    ports:
      - "8081:80"

  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: immo
    ports:
      - "3306:3306"
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

### Démarrer les services

Pour démarrer tous les services définis dans le fichier `docker-compose.yml`, exécutez :

```sh
docker-compose up --build
```

Cela construira et démarrera tous les conteneurs définis dans le fichier `docker-compose.yml`.
