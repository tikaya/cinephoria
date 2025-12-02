# syntax=docker/dockerfile:1
ARG NODE_VERSION=22.21.1
FROM node:${NODE_VERSION}-alpine

# Mode development pour installer TOUTES les dépendances
ENV NODE_ENV=development

WORKDIR /usr/src/app

# Installer nodemon globalement pour le hot reload
RUN npm install -g nodemon

# Copier package.json et installer TOUTES les dépendances (dev incluses)
COPY package.json package-lock.json ./
RUN npm ci

# Copier le reste du code
COPY . .

EXPOSE 3000

# Commande par défaut (peut être overridée par compose)
CMD ["npm", "run", "dev"]