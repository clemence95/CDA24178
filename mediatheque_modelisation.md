# Modélisation de la Médiathèque

## 1. Identification des Acteurs

**Acteurs Principaux :**

- **Abonné**
    - Rôle : Emprunte des documents, consulte la liste des documents, modifie ses coordonnées.
- **Personnel de la Bibliothèque**
    - Rôle : Enregistre les abonnés, enregistre les emprunts, modifie les coordonnées des abonnés, envoie des relances, consulte les états des abonnés.
- **Bénévole**
    - Rôle : Enregistre les emprunts (durant une période limitée).
- **Système de Gestion de la Bibliothèque**
    - Rôle : Gère les documents, les emprunts, les abonnés et les relances.

## 2. Identification des Cas d'Usage

### Gestion des Documents

- Ajouter un document
- Modifier un document
- Supprimer un document
- Consulter la liste des documents

### Gestion des Abonnés

- Ajouter un abonné
- Modifier les coordonnées d'un abonné
- Consulter l'état d'un abonné

### Gestion des Emprunts

- Enregistrer un emprunt
- Retourner un emprunt
- Envoyer des relances pour les emprunts en retard

### Consultation des Documents

- Rechercher des documents par différents critères
- Vérifier la disponibilité d'un document

## 3. Scénario Principal et Scénarios Alternatifs pour l'Emprunt d'une Ressource

### Scénario Principal : Emprunt d'une Ressource

**Acteurs :** Abonné, Personnel de la Bibliothèque (ou Bénévole), Système de Gestion de la Bibliothèque

**Préconditions :**
- L'abonné doit avoir une carte valide.
- L'abonné doit avoir payé sa cotisation.
- L'abonné doit avoir moins de 5 emprunts en cours.
- Le document doit être disponible.

**Postconditions :**
- L'emprunt est enregistré.
- Le document est marqué comme emprunté.

**Scénario Principal :**

1. L'abonné se présente au guichet avec sa carte et les documents qu'il souhaite emprunter.
2. Le personnel (ou le bénévole) demande la carte de l'abonné et vérifie son statut dans le Système de Gestion de la Bibliothèque.
3. Le système vérifie que l'abonné a payé sa cotisation et qu'il a moins de 5 emprunts en cours.
4. Le personnel scanne les côtes des documents pour vérifier leur disponibilité.
5. Le système enregistre les emprunts et met à jour le statut des documents comme "empruntés".
6. Le personnel informe l'abonné de la date de retour des documents.
7. L'abonné quitte le guichet avec les documents empruntés.

### Scénarios Alternatifs

**Scénario Alternatif A (Cotisation non payée) :**
- Le personnel informe l'abonné que sa cotisation n'est pas à jour.
- L'abonné doit payer sa cotisation avant de pouvoir emprunter des documents.

**Scénario Alternatif B (Nombre d'emprunts maximum atteint) :**
- Le système informe le personnel que l'abonné a déjà 5 emprunts en cours.
- Le personnel informe l'abonné qu'il ne peut pas emprunter de nouveaux documents jusqu'à ce qu'il en retourne.

**Scénario Alternatif C (Document indisponible) :**
- Le personnel scanne les côtes des documents et le système indique qu'un ou plusieurs documents ne sont pas disponibles (déjà empruntés ou perdus).
- Le personnel informe l'abonné de la situation et demande s'il souhaite emprunter d'autres documents à la place.

**Scénario Alternatif D (Emprunt par un bénévole en dehors de la période autorisée) :**
- Le bénévole tente d'enregistrer un emprunt en dehors de la période autorisée pour les bénévoles.
- Le système refuse l'emprunt et le bénévole informe l'abonné qu'il doit se rendre au guichet avec un membre du personnel pour enregistrer l'emprunt.

## 4. Diagrammes UML

### Diagramme de Séquence

```plantuml
@startuml
actor Abonné
actor "Personnel de la Bibliothèque" as Bibliothecaire
participant "Système de Gestion de la Bibliothèque" as Systeme

Abonné -> Bibliothecaire: Présente la carte et les documents
Bibliothecaire -> Systeme: Vérifie l'abonné
Systeme --> Bibliothecaire: Renvoie le statut de la cotisation
Bibliothecaire -> Systeme: Vérifie le nombre d'emprunts en cours
Systeme --> Bibliothecaire: Renvoie le nombre d'emprunts
Bibliothecaire -> Systeme: Vérifie la disponibilité des documents
Systeme --> Bibliothecaire: Renvoie la disponibilité
Bibliothecaire -> Systeme: Enregistre l'emprunt
Systeme --> Bibliothecaire: Confirme l'emprunt
Bibliothecaire --> Abonné: Informe du succès
Abonné -> Abonné: Quitte avec les documents
@enduml

