<!-- Lecture du diagramme de séquence -->

<!-- Acteurs et Participants : -->
<!--     Abonné : C'est l'utilisateur qui souhaite emprunter des documents. -->
<!--     Personnel de la Bibliothèque (alias Bibliothecaire) : C'est l'employé qui gère l'emprunt des documents. -->
<!--     Système de Gestion de la Bibliothèque (alias Systeme) : C'est le système informatique utilisé pour gérer les emprunts de la bibliothèque. -->

<!-- Séquence d'Interactions : -->
<!--     Abonné -> Bibliothecaire : L'abonné présente sa carte et les documents qu'il souhaite emprunter au bibliothécaire. -->
<!--     Bibliothecaire -> Systeme : Le bibliothécaire vérifie les informations de l'abonné dans le système. -->
<!--     Systeme --> Bibliothecaire : Le système renvoie le statut de la cotisation de l'abonné au bibliothécaire (par exemple, si la cotisation est à jour). -->
<!--     Bibliothecaire -> Systeme : Le bibliothécaire vérifie le nombre d'emprunts en cours de l'abonné. -->
<!--     Systeme --> Bibliothecaire : Le système renvoie le nombre d'emprunts actuels de l'abonné. -->
<!--     Bibliothecaire -> Systeme : Le bibliothécaire vérifie la disponibilité des documents que l'abonné souhaite emprunter. -->
<!--     Systeme --> Bibliothecaire : Le système renvoie les informations sur la disponibilité des documents. -->
<!--     Bibliothecaire -> Systeme : Le bibliothécaire enregistre l'emprunt des documents dans le système. -->
<!--     Systeme --> Bibliothecaire : Le système confirme l'enregistrement de l'emprunt. -->
<!--     Bibliothecaire --> Abonné : Le bibliothécaire informe l'abonné que l'emprunt a été enregistré avec succès. -->
<!--     Abonné -> Abonné : L'abonné quitte la bibliothèque avec les documents empruntés. -->

<!-- Points Clés du Diagramme -->

<!-- - Flèches Pleines avec Pointe Simple : Représentent l'envoi de messages ou de requêtes d'une entité à une autre. -->
<!-- - Flèches en Tirets avec Pointe Simple : Représentent les réponses ou les retours d'information des systèmes ou des participants. -->
<!-- - Lifelines (lignes de vie) : Les lignes verticales sous chaque acteur ou participant représentent le temps qui passe. Les messages sont envoyés de haut en bas pour montrer la séquence chronologique. -->

<!-- Conclusion -->

<!-- Ce diagramme de séquence montre comment un abonné interagit avec le personnel de la bibliothèque et le système de gestion pour emprunter des documents. Il détaille chaque étape de l'interaction, de la présentation de la carte à l'enregistrement de l'emprunt, en passant par les vérifications nécessaires. -->

# Modélisation de la Médiathèque

### Identification des Acteurs

- **Abonné** : Personne inscrite à la médiathèque qui souhaite emprunter des ressources.
- **Personnel de la Médiathèque** : Employés ou bénévoles responsables de la gestion des ressources et des emprunts.

### Cas d'Usage : Emprunt d'une Ressource

**Scénario Principal** :
1. L'Abonné se rend à la médiathèque pour emprunter une ressource.
2. L'Abonné présente sa carte d'abonné au Personnel de la Médiathèque.
3. Le Personnel de la Médiathèque vérifie l'abonné dans le système.
4. Le Personnel de la Médiathèque enregistre l'emprunt de la ressource pour l'abonné.
5. L'Abonné reçoit la ressource empruntée et sa carte d'abonné est mise à jour.

**Scénarios Alternatifs** :
- **Cotisation Non Payée** :
  - Le Personnel de la Médiathèque informe l'Abonné que sa cotisation n'est pas payée et refuse l'emprunt.
- **Limite d'Emprunts Atteinte** :
  - Le Personnel de la Médiathèque informe l'Abonné qu'il a atteint sa limite d'emprunts et refuse l'emprunt.
- **Ressource Indisponible** :
  - Le Personnel de la Médiathèque informe l'Abonné que la ressource demandée n'est pas disponible.
  - L'Abonné peut choisir une autre ressource ou attendre que celle-ci soit disponible.


## 4. Diagrammes UML

### Diagramme de Séquence

```plantuml
@startuml EmpruntDocument
actor Abonné
actor "Personnel de la Bibliothèque" as Bibliothecaire
participant "Système de Gestion de la Bibliothèque" as Systeme

Abonné -> Bibliothecaire: Présente la carte et les documents
Bibliothecaire -> Systeme: Vérifie l'abonné
Systeme --> Bibliothecaire: Renvoie le statut de la cotisation et le nombre d'emprunts en cours
alt Cotisation non payée ou plus de 5 emprunts
    Bibliothecaire --> Abonné: Refuse l'emprunt
else
    Bibliothecaire -> Systeme: Vérifie la disponibilité des documents
    Systeme --> Bibliothecaire: Renvoie la disponibilité des documents
    alt Document non disponible
        Bibliothecaire --> Abonné: Informe de l'indisponibilité du document
    else
        Bibliothecaire -> Systeme: Enregistre l'emprunt (n° abonné, côte document, date)
        Systeme --> Bibliothecaire: Confirme l'enregistrement
        Bibliothecaire --> Abonné: Confirme l'emprunt
    end
end
@enduml

