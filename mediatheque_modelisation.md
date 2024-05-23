## Identification des Acteurs

- **Abonné** : Utilisateur qui emprunte des documents.
- **Bibliothécaire** : Personne qui gère les opérations de la bibliothèque, telles que l'enregistrement des emprunts et la vérification des abonnements.
- **Système de Gestion de la Bibliothèque (SGB)** : Système qui automatise les processus de gestion des prêts et des retours de documents.

## Cas d'Usage Identifiés

1. Inscription d'un nouvel abonné
2. Paiement de la cotisation
3. Emprunt de documents
4. Retour de documents
5. Vérification de la disponibilité des documents
6. Envoi de lettres de relance pour les documents non retournés
7. Gestion des abonnés (par le bibliothécaire)
8. Gestion des documents (par le bibliothécaire)

## Cas d'Usage : Emprunt d'une Ressource

### Scénario Principal (Emprunt de document)

- **Acteur** : Abonné
- **Précondition** : L'abonné doit être inscrit et avoir payé sa cotisation. Il ne doit pas avoir plus de 5 emprunts en cours.
- **Description** :
  1. L'abonné sélectionne le document qu'il souhaite emprunter.
  2. L'abonné demande à emprunter le document.
  3. Le Système de Gestion de la Bibliothèque (SGB) vérifie que l'abonné a payé sa cotisation et qu'il a moins de 5 emprunts en cours.
  4. Le SGB vérifie la disponibilité du document.
  5. Si toutes les conditions sont remplies, le SGB enregistre l'emprunt.
  6. L'abonné reçoit une confirmation de l'emprunt.
- **Postcondition** : Le document est marqué comme emprunté et le nombre d'emprunts en cours de l'abonné est mis à jour.

### Scénarios Alternatifs

1. **Condition de cotisation non remplie** :
   1. Le SGB vérifie que l'abonné a payé sa cotisation.
   2. Si la cotisation n'est pas payée, le SGB refuse l'emprunt.
   3. L'abonné reçoit un message indiquant qu'il doit payer sa cotisation pour emprunter des documents.

2. **Nombre maximal d'emprunts atteint** :
   1. Le SGB vérifie le nombre d'emprunts en cours de l'abonné.
   2. Si l'abonné a déjà 5 emprunts en cours, le SGB refuse l'emprunt.
   3. L'abonné reçoit un message indiquant qu'il doit retourner des documents avant de pouvoir en emprunter de nouveaux.

3. **Document non disponible** :
   1. Le SGB vérifie la disponibilité du document.
   2. Si le document n'est pas disponible (déjà emprunté par un autre abonné), le SGB refuse l'emprunt.
   3. L'abonné reçoit un message indiquant que le document n'est pas disponible actuellement.



## 4. Diagrammes UML

### Diagramme de Séquence


![ Texte alternatif](/asset/diagramme_sequence.png "diagramme_sequence.png")

### Diagramme de Classe

![ Texte alternatif](/asset/diagramme_classe.png "diagramme_classe.png")

### Diagramme d'activité

![ Texte alternatif](/asset/diagramme_activite.png "diagramme_activite.png")

```plantuml
@startuml
!theme toy
title Sequence Diagram - Gestion des prêts de documents à la bibliothèque

actor Abonné
actor Employé
actor Bénévole
participant "Système de Gestion de la Bibliothèque" as SGB
participant "Base de données" as DB

Abonné -> Employé: Présente la carte et les documents
Employé -> SGB: Vérifie la carte de l'abonné
SGB -> DB: Rechercher abonné par carteID
DB --> SGB: Détails de l'abonné

alt Carte non valide
    SGB -> Employé: Proposer inscription
    Employé -> Abonné: Proposer inscription
    Abonné -> Employé: Accepte l'inscription
    Employé -> SGB: Inscription de l'abonné
    SGB -> DB: Enregistrer nouvel abonné
    DB --> SGB: Confirmation d'inscription
    SGB -> Employé: Confirmation d'inscription
    Employé -> Abonné: Confirmation d'inscription
else Carte valide
    SGB -> Employé: Abonné inscrit
end

Employé -> SGB: Vérifie cotisation et nombre d'emprunts
alt Cotisation non payée ou plus de 5 emprunts
    SGB -> Employé: Proposer paiement de la cotisation
    Employé -> Abonné: Proposer paiement de la cotisation
    Abonné -> Employé: Paye la cotisation
    Employé -> SGB: Enregistre paiement cotisation
    SGB -> DB: Mettre à jour cotisation
    DB --> SGB: Confirmation de paiement
else Cotisation payée et moins de 5 emprunts
    SGB -> Employé: Abonné valide
end

Employé -> SGB: Vérifie disponibilité des documents
alt Documents disponibles
    SGB -> Employé: Documents disponibles
    Employé -> SGB: Enregistre emprunt (n° abonné, côte document, date)
    SGB -> DB: Enregistrer emprunt
    DB --> SGB: Confirmation d'enregistrement
    SGB -> Employé: Confirmation de l'emprunt
    Employé -> Abonné: Confirme l'emprunt
else Documents non disponibles
    SGB -> Employé: Documents non disponibles
    Employé -> Abonné: Informe de l'indisponibilité des documents
end

Employé -> SGB: Vérifie les documents non rendus après 4 semaines
SGB -> DB: Rechercher emprunts en retard (date actuelle > date de fin d'emprunt)
DB --> SGB: Liste des emprunts non rendus
alt Documents non rendus
    SGB -> Employé: Génère et envoie une lettre de relance
    Employé -> Abonné: Envoie lettre de relance
else Tous les documents rendus
    SGB -> Employé: Aucun document non rendu
end

Abonné -> Employé: Demande modification des coordonnées
Employé -> SGB: Modifie les coordonnées de l'abonné
SGB -> DB: Mettre à jour les coordonnées
DB --> SGB: Confirmation de la mise à jour
SGB -> Employé: Confirmation de la mise à jour
Employé -> Abonné: Confirmation de la mise à jour

Employé -> SGB: Consulter situation d'un abonné
SGB -> DB: Obtenir état de l'abonné
DB --> SGB: État de l'abonné
SGB -> Employé: État de l'abonné

@enduml

@startuml
!theme toy
title Class Diagram - Gestion des prêts de documents à la bibliothèque

class Abonné {
    - carteID: String
    - nom: String
    - adresse: String
    - cotisationPayée: Boolean
    - nbEmpruntsEnCours: Integer
    + inscrire()
    + payerCotisation()
    + emprunterDocument(document: Document)
    + peutEmprunter(): Boolean
}

class Document {
    - cote: String
    - titre: String
    - datePublication: Date
    + estDisponible: Boolean
    + typeDocument: String
}

class Emprunt {
    - dateEmprunt: Date
    - dateRetour: Date
    + enregistrerEmprunt(abonne: Abonné, document: Document)
    + verifierRetour()
}

class SystèmeGestionBibliothèque {
    + verifierCarte(carteID: String): Boolean
    + verifierCotisationEtEmprunts(abonne: Abonné): Boolean
    + verifierDisponibilitéDocuments(documents: List<Document>): List<Boolean>
    + enregistrerEmprunt(abonne: Abonné, document: Document)
    + verifierDocumentsNonRendus(): List<Emprunt>
    + envoyerLettreRelance(emprunt: Emprunt)
}

Abonné "1" -- "0..*" Emprunt
Document "1" -- "0..*" Emprunt
SystèmeGestionBibliothèque "1" -- "0..*" Abonné
SystèmeGestionBibliothèque "1" -- "0..*" Document
SystèmeGestionBibliothèque "1" -- "0..*" Emprunt

@enduml

@startuml
!theme toy
title Gestion des prêts de documents à la bibliothèque

start

:Vérifie la carte de l'abonné;

if (Carte?) then (Non)
    :Proposer inscription par le personnel de la bibliothèque;
    if (Inscription acceptée?) then (Oui)
        :Inscription de l'abonné;
    else (Non)
        :Abonné ressort sans document;
        stop
    endif
endif

if (Cotisation payée et moins de 5 emprunts?) then (Non)
    :Proposer paiement de la cotisation;
    if (Cotisation payée?) then (Oui)
        :Retourne à la vérification de la disponibilité des documents;
    else (Non)
        :Abonné ressort sans document;
        stop
    endif
endif

:Vérifie la disponibilité des documents;

if (Documents disponibles?) then (Non)
    :Abonné ressort sans document;
    stop
else (Oui)
    :Enregistre l'emprunt (n° abonné, côte document, date);
    :Confirme l'emprunt;
    :Abonné ressort avec document;
endif

:Vérifie les documents non rendus après 4 semaines;
if (Documents non rendus?) then (Oui)
    :Génère et envoie une lettre de relance;
endif

stop

@enduml






