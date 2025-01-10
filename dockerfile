# Imagen base
FROM node:18-alpine as build

# Crear directorio de trabajo
WORKDIR /app

# Copiar dependencias y código fuente
COPY package*.json ./
RUN npm install
COPY . .

# Construir el proyecto
RUN npm run build

# Imagen para servir los archivos estáticos
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80

# Comando de inicio
CMD ["nginx", "-g", "daemon off;"]
