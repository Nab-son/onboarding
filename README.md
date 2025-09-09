📋 Application Todo (avec Firebase)

Une application mobile Flutter de gestion de tâches (Todo List) avec Firebase Firestore. Elle permet d'ajouter, afficher, modifier et supprimer des tâches avec une persistance cloud en temps réel.

🚀 Fonctionnalités
✅ Affichage des tâches : Liste des tâches avec leur statut (complétée/non complétée)

➕ Ajout de tâches : Possibilité d'ajouter de nouvelles tâches

🔄 Modification du statut : Marquer une tâche comme complétée ou non complétée

❌ Suppression de tâches : Supprimer une tâche de la liste (swipe to delete)

☁️ Persistance cloud : Synchronisation en temps réel avec Firebase Firestore

📱 Interface intuitive : Design Material Design avec expérience utilisateur fluide

🛠️ Technologies utilisées
Flutter - Framework de développement cross-platform

Dart - Langage de programmation

Firebase Firestore - Base de données NoSQL cloud

Provider - Gestion d'état

Firebase Core - Intégration Firebase

🏗️ Architecture
Le projet suit une architecture modulaire avec séparation des préoccupations :

Structure des dossiers
text
lib/
├── core/           # Code transverse (constants, services, utils)

├── data/           # Couche données (models, repositories)

├── domain/         # Entités métier

└── presentation/   # Couche UI (pages, providers, widgets)

🚀 Exécution du projet

**Cloner le projet**

git clone git@github.com:Nab-son/onboarding.git

cd todo_app

**Installer les dépendances**

flutter pub get

**Lancer l'application**

flutter run
