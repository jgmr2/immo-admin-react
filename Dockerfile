# Usar una imagen base oficial de Node.js
FROM node:18 AS build

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo package.json y package-lock.json
COPY package*.json ./

# Instalar las dependencias del proyecto
RUN npm install --legacy-peer-deps

# Copiar el resto de los archivos del proyecto
COPY . .

# Construir la aplicación para producción
RUN npm run build

# Usar una imagen base de Nginx para servir la aplicación
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 80

# Comando para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]
