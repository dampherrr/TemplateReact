#!/bin/bash

# Fonction pour créer des répertoires et ajouter .gitkeep
create_dir_with_gitkeep() {
  local dir=$1
  mkdir -p "$dir"
  touch "$dir/.gitkeep"
}

# Fonction pour créer le fichier .env.sample
create_env_sample() {
  cat <<EOL >my-react-app/server/.env.sample
# .env.sample - Sample Environment Variables

# Application Configuration
APP_PORT=3310
APP_SECRET=YOUR_APP_SECRET_KEY

# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_USER=YOUR_DATABASE_USERNAME
DB_PASSWORD=YOUR_DATABASE_PASSWORD
DB_NAME=YOUR_DATABASE_NAME

# Client URL (for CORS configuration)
CLIENT_URL=http://localhost:3000
# About specific needs, please ask your trainer about the deploiement project name and follow the pattern
# You can add as much variable as needed. Don't forget to tell your trainer about it. Otherwise, it could break on deploiement
PROJECT_NAME_SPECIFIC_NAME=YOUR_SPECIFIC_VALUE
EOL
  # Copie du fichier .env.sample en .env
  cp my-react-app/server/.env.sample my-react-app/server/.env
}

# Fonction pour créer les fichiers package.json pour client et server
create_package_json() {
  cat <<EOL >my-react-app/client/package.json
{
  "name": "client",
  "version": "1.0.0",
  "main": "main.jsx",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "serve": "vite preview"
  },
  "dependencies": {
    "react-router-dom": "^6.14.1",
    "axios": "^1.4.0",
    "@tanstack/react-query": "^4.29.14",
    "styled-components": "^6.0.4",
    "prop-types": "^15.8.1"
  },
  "devDependencies": {
    "vite": "^4.0.0"
  }
}
EOL

  cat <<EOL >my-react-app/server/package.json
{
  "name": "server",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "dev:server": "nodemon index.js"
  },
  "dependencies": {
    "express": "^4.18.2",
    "cors": "^2.8.5",
    "dotenv": "^16.3.1",
    "mongoose": "^7.3.3",
    "body-parser": "^1.20.2"
  },
  "devDependencies": {
    "nodemon": "^2.0.7"
  }
}
EOL
}

# Fonction pour mettre à jour le fichier package.json dans my-react-app
update_package_json() {
  cat <<EOL >my-react-app/package.json.tmp
{
  "name": "my-react-app",
  "version": "1.0.0",
  "scripts": {
    "test": "echo \\"Error: no test specified\\" && exit 1",
    "dev:client": "npm --prefix ./client run dev",
    "dev:server": "npm --prefix ./server run dev:server",
    "dev": "npm-run-all --parallel dev:client dev:server",
    "setup": "npm i && npm --prefix ./client i && npm --prefix ./server i"
  }
}
EOL
  mv my-react-app/package.json.tmp my-react-app/package.json
}

# Fonction pour créer les fichiers de base .jsx
create_base_files() {
  cat <<EOL >my-react-app/client/src/pages/Home.jsx
import React from 'react';

const Home = () => {
  return (
    <div>
      <h1>Home Page</h1>
    </div>
  );
};

export default Home;
EOL

  cat <<EOL >my-react-app/client/src/pages/About.jsx
import React from 'react';

const About = () => {
  return (
    <div>
      <h1>About Page</h1>
    </div>
  );
};

export default About;
EOL

  cat <<EOL >my-react-app/client/src/context/AppContext.jsx
import React, { createContext, useState } from 'react';

export const AppContext = createContext();

export const AppProvider = ({ children }) => {
  const [state, setState] = useState({});

  return (
    <AppContext.Provider value={[state, setState]}>
      {children}
    </AppContext.Provider>
  );
};
EOL

  cat <<EOL >my-react-app/client/src/main.jsx
import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Home from './pages/Home';
import About from './pages/About';
import { AppProvider } from './context/AppContext';

const App = () => {
  return (
    <AppProvider>
      <Router>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route path="/about" component={About} />
        </Switch>
      </Router>
    </AppProvider>
  );
};

ReactDOM.render(<App />, document.getElementById('root'));
EOL

  cat <<EOL >my-react-app/client/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>React App</title>
</head>
<body>
  <div id="root"></div>
  <script type="module" src="/main.jsx"></script>
</body>
</html>
EOL

  cat <<EOL >my-react-app/README.md

EOL

  cat <<EOL >my-react-app/server/client.js
// Get variables from .env file for database connection
const { DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME } = process.env;

// Create a connection pool to the database
const mysql = require("mysql2/promise");

const client = mysql.createPool({
  host: DB_HOST,
  port: DB_PORT,
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB_NAME,
});

client.checkConnection = () => {
  // Try to get a connection to the database
  client
    .getConnection()
    .then((connection) => {
      console.info($(Using database ${DB_NAME}));

      connection.release();
    })
    .catch((error) => {
      console.warn(
        "Warning:",
        "Failed to establish a database connection.",
        "Please check your database credentials in the .env file if you need a database access."
      );
      console.warn(error.message);
    });
};

// Store database name into client for further uses
client.databaseName = DB_NAME;

// Ready to export
module.exports = client;

EOL
}

# Déplace les fichiers au bon endroit
move_files() {
  # Crée les répertoires nécessaires
  mkdir -p my-react-app/client/src/components
  mkdir -p my-react-app/client/src/pages
  mkdir -p my-react-app/client/src/styles
  mkdir -p my-react-app/client/src/divers
  mkdir -p my-react-app/client/src/services
  mkdir -p my-react-app/client/src/context
  mkdir -p my-react-app/client/assets/media/icons
  mkdir -p my-react-app/client/assets/media/pictures
  mkdir -p my-react-app/client/assets/data
  mkdir -p my-react-app/client/assets/data/datajs
  mkdir -p my-react-app/server/public/assets
  mkdir -p my-react-app/server/public/assets/icons
  mkdir -p my-react-app/server/public/assets/pictures
  mkdir -p my-react-app/server/app
  mkdir -p my-react-app/server/bin
  mkdir -p my-react-app/server/database
  mkdir -p my-react-app/server/database/fixtures
  mkdir -p my-react-app/server/database/models
  mkdir -p my-react-app/server/public/assets/data
  mkdir -p my-react-app/server/public/assets/data/datajs

  # Déplace les fichiers
  mv my-react-app/index.html my-react-app/client/src/index.html
  mv my-react-app/vite.config.js my-react-app/client/vite.config.js
  mv my-react-app/src/App.css my-react-app/client/src/App.css
  mv my-react-app/src/App.jsx my-react-app/client/src/App.jsx
  mv my-react-app/src/index.css my-react-app/client/src/styles/index.css

  # Déplace les fichiers de assets et public
  mv my-react-app/src/assets/* my-react-app/client/assets/media
  mv my-react-app/public/* my-react-app/server/public/assets
  rm -rf my-react-app/src/assets
  rm -rf my-react-app/public

  # Création de fichiers
  touch my-react-app/server/database/client.js

  # Supprime les fichiers .svg
  rm -f my-react-app/client/assets/media/react.svg
  rm -f my-react-app/server/public/assets/vite.svg

  # Crée des fichiers .gitkeep dans les répertoires vides
  create_dir_with_gitkeep my-react-app/client/src/components
  create_dir_with_gitkeep my-react-app/client/src/pages
  create_dir_with_gitkeep my-react-app/client/src/styles
  create_dir_with_gitkeep my-react-app/client/src/divers
  create_dir_with_gitkeep my-react-app/client/src/services
  create_dir_with_gitkeep my-react-app/client/src/context
  create_dir_with_gitkeep my-react-app/client/assets/media/icons
  create_dir_with_gitkeep my-react-app/client/assets/media/pictures
  create_dir_with_gitkeep my-react-app/client/assets/data
  create_dir_with_gitkeep my-react-app/client/assets/data/datajs
  create_dir_with_gitkeep my-react-app/server/public/assets/icons
  create_dir_with_gitkeep my-react-app/server/public/assets/pictures
  create_dir_with_gitkeep my-react-app/server/public/assets/data
  create_dir_with_gitkeep my-react-app/server/public/assets/data/datajs

  # Supprime le répertoire src
  rm -rf my-react-app/src
}

# Vérifie si le script est exécuté dans le bon répertoire
if [ ! -d "my-react-app" ]; then
  echo "Le répertoire my-react-app n'existe pas. Veuillez exécuter ce script depuis le répertoire parent de my-react-app."
  exit 1
fi

# Exécute les opérations de déplacement, de création et de mise à jour
move_files
create_env_sample
echo ".env.sample à jour."
create_package_json
create_base_files
update_package_json
echo "package.json à jour."

# Installe les paquets npm
echo "Installation des paquets npm..."
cd my-react-app
npm install
echo "Installation npm install terminée."

# Installe les dépendances supplémentaires pour le client
cd client
npm install react-router-dom axios @tanstack/react-query styled-components prop-types scass --save-dev
echo "Installation des dépendances client terminée."

# Installe les dépendances supplémentaires pour le serveur
cd ../server
npm install express cors dotenv mongoose body-parser --save-dev
echo "Installation des dépendances serveur terminée."

# Installe json-server pour le serveur
npm install json-server
touch ../db.json
echo "Installation json-server serveur terminée."

# Installe nodemon comme dépendance de développement dans le répertoire server
npm install nodemon --save-dev
echo "Installation nodemon terminée."

# Installe concurrently et npm-run-all dans le répertoire principal
cd ..
npm install concurrently npm-run-all --save-dev
echo "Installation npm-run-all terminée."

echo "Réorganisation terminée et installation des paquets npm terminée."
