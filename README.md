# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## How to run

1. Clone this repository.
2. Make sure to have [Node.js](https://nodejs.org/download/release/v18.19.0/node-v18.19.0-x64.msi) installed. Version 18.19.0 will work.
3. Install dependencies, with the `npm install` command.
4. Update the backend server address or domain name in [agent.ts](src/app/api/agent.ts).
5. Run the project, with `npm start`.

It will be hosted on [http://localhost:3000](http://localhost:3000).


-----
1. Descripción del Proyecto
Nombre del Proyecto: ParknMove - Administrador.
Propósito del Proyecto: Evaluar la implementación de un pipeline de integración y despliegue continuo (CI/CD) para una aplicación React desplegada en Firebase Hosting.
2. Flujo CI/CD
El pipeline de CI/CD está configurado para:

Instalar dependencias: Utiliza npm ci para garantizar un entorno limpio.
Construir el proyecto: Genera una versión optimizada con npm run build.
Desplegar en Firebase Hosting: Usa GitHub Actions y el Firebase CLI.
Configuración de CI/CD
Archivo Workflow: .github/workflows/firebase-hosting-merge.yml
Servicios Integrados:
GitHub Actions para automatizar los pasos.
Firebase Hosting para el despliegue.
3. Despliegue en Producción
URL de Producción: https://taller-3-frontend.firebaseapp.com
Prueba del Despliegue
Accede a la URL.
Navega por las diferentes rutas.
Actualiza cualquier página para verificar que las rutas SPA funcionan correctamente.
4. Configuración del Pipeline
Archivo .github/workflows/firebase-hosting-merge.yml:
yaml
Copiar código
name: Deploy to Firebase Hosting

on:
  push:
    branches:
      - main

jobs:
  build_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install dependencies
        run: npm ci
      - name: Build project
        run: |
          CI=false npm run build
      - name: Deploy to Firebase Hosting
        uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: ${{ secrets.GITHUB_TOKEN }}
          firebaseServiceAccount: ${{ secrets.FIREBASE_SERVICE_ACCOUNT_TALLER_3_FRONTEND }}
          channelId: live
          projectId: taller-3-frontend
5. Evaluación del CI/CD
Para evaluar la configuración:

Prueba el flujo de CI/CD en la pestaña Actions del repositorio.
Verifica que el pipeline:
Instale dependencias sin errores.
Construya la aplicación correctamente.
Despliegue en Firebase Hosting.
Accede a la URL de producción para confirmar que la aplicación funciona correctamente.
6. Notas Adicionales
Secretos de GitHub: Se utilizan para almacenar las credenciales de Firebase (FIREBASE_SERVICE_ACCOUNT_TALLER_3_FRONTEND) y garantizar la seguridad.
Rutas SPA: Configuradas en firebase.json para redirigir todas las solicitudes a index.html.
7. Autor
Nombre: Rey valdes [Rey Valdes]
Curso: Taller 3 - Arquitectura de Sistemas.