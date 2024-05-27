## Identification des Acteurs

- **Abonné** : Utilisateur qui emprunte des documents.
- **Employé** : Personne qui gère les opérations de la bibliothèque, telles que l'enregistrement des emprunts et la vérification des abonnements.
- **Système de Gestion de la Bibliothèque (SGB)** : Système qui automatise les processus de gestion des prêts et des retours de documents.
- **Base de Données (BD)** : Système de stockage et de gestion des informations relatives aux abonnés, aux documents et aux emprunts.


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
actor "Employé ou Bénévole" as EB
actor Employé
participant "Système de Gestion de la Bibliothèque" as SGB
participant "Base de données" as DB

Abonné -> EB: Présente la carte et les documents
EB -> SGB: Vérifie la carte de l'abonné
SGB -> DB: Rechercher abonné par carteID
DB --> SGB: Détails de l'abonné

alt Carte non valide
    EB -> Abonné: Diriger vers un employé pour inscription
    Abonné -> Employé: Demande inscription
    Employé -> SGB: Inscription de l'abonné
    SGB -> DB: Enregistrer nouvel abonné
    DB --> SGB: Confirmation d'inscription
    SGB -> Employé: Confirmation d'inscription
    Employé -> Abonné: Confirmation d'inscription
else Carte valide
    SGB -> EB: Abonné inscrit
end

EB -> SGB: Vérifie cotisation et nombre d'emprunts
alt Cotisation non payée ou plus de 5 emprunts
    EB -> Abonné: Diriger vers un employé pour paiement de la cotisation
    Abonné -> Employé: Demande paiement de la cotisation
    Employé -> SGB: Enregistre paiement cotisation
    SGB -> DB: Mettre à jour cotisation
    DB --> SGB: Confirmation de paiement
else Cotisation payée et moins de 5 emprunts
    SGB -> EB: Abonné valide
end

EB -> SGB: Vérifie disponibilité des documents
alt Documents disponibles
    SGB -> EB: Documents disponibles

    alt Document CD-ROM
        EB -> Abonné: Diriger vers un employé pour caution
        Abonné -> Employé: Demande caution
        Employé -> Abonné: Demande caution
        Abonné -> Employé: Fournit caution
        Employé -> SGB: Enregistre caution
        SGB -> DB: Enregistrer caution
        DB --> SGB: Confirmation enregistrement caution
    end

    alt Document Microfilm
        SGB -> DB: Vérifier disponibilité d'un écran
        DB --> SGB: Écran disponible
    end

    EB -> SGB: Enregistre emprunt (n° abonné, côte document, date)
    SGB -> DB: Enregistrer emprunt
    DB --> SGB: Confirmation d'enregistrement
    SGB -> EB: Confirmation de l'emprunt
    EB -> Abonné: Confirme l'emprunt
else Documents non disponibles
    SGB -> EB: Documents non disponibles
    EB -> Abonné: Informe de l'indisponibilité des documents
end

EB -> SGB: Vérifie les documents non rendus après 4 semaines
SGB -> DB: Rechercher emprunts en retard (date actuelle > date de fin d'emprunt)
DB --> SGB: Liste des emprunts non rendus
alt Documents non rendus
    SGB -> EB: Génère et envoie une lettre de relance
    EB -> Abonné: Envoie lettre de relance
else Tous les documents rendus
    SGB -> EB: Aucun document non rendu
end

Abonné -> EB: Demande modification des coordonnées
EB -> SGB: Modifie les coordonnées de l'abonné
SGB -> DB: Mettre à jour les coordonnées
DB --> SGB: Confirmation de la mise à jour
SGB -> EB: Confirmation de la mise à jour
EB -> Abonné: Confirmation de la mise à jour

EB -> SGB: Consulter situation d'un abonné
SGB -> DB: Obtenir état de l'abonné
DB --> SGB: État de l'abonné
SGB -> EB: État de l'abonné

@enduml

@startuml
!theme toy
title Class Diagram - Gestion des prêts de documents à la bibliothèque

class Abonné {
    - carteID: String
    - nom: String
    - adresse: String
    - dateCotisation: Date
    - cautionEnCours: Boolean
    - document1: Document
    - dateRetour1: Date
    - document2: Document
    - dateRetour2: Date
    - document3: Document
    - dateRetour3: Date
    - document4: Document
    - dateRetour4: Date
    - document5: Document
    - dateRetour5: Date
    + inscrire()
    + payerCotisation(nouvelleDateCotisation: Date)
    + emprunterDocument(document: Document, dateRetour: Date)
    + peutEmprunter(): Boolean
    + retourCD(document: Document)
    + retournerDocument(document: Document)
    + nbEmprunts(): Integer
}

class Document {
    - cote: String
    - titre: String
    - datePublication: Date
    + estDisponible: Boolean
    + typeDocument: String
    + consulter()
}

class SystèmeGestionBibliothèque {
    - nomEmployeOuBenevole: String
    - periodeAcces: Date
    + verifierCarte(carteID: String): Boolean
    + verifierCotisationEtEmprunts(abonne: Abonné): Boolean
    + verifierDisponibilitéDocuments(documents: List<Document>): List<Boolean>
    + enregistrerEmprunt(abonne: Abonné, document: Document, dateRetour: Date)
    + verifierDocumentsNonRendus(): List<Abonné>
    + envoyerLettreRelance(abonne: Abonné, document: Document)
    + consulterEtatAbonne(abonne: Abonné): String
    + modifierCoordonnéesAbonne(abonne: Abonné, nouvelleAdresse: String)
    + inscrireAbonne(abonne: Abonné)
    + enregistrerPaiementCotisation(abonne: Abonné)
    + enregistrerCaution(abonne: Abonné, document: Document)
    + retourCD(abonne: Abonné, document: Document)
    + validerEmprunt(abonne: Abonné, document: Document): Boolean
}

Abonné "1" -- "0..*" Document : emprunte
Document "1" -- "0..*" Abonné : est emprunté par
SystèmeGestionBibliothèque "1" -- "0..*" Abonné : gère
SystèmeGestionBibliothèque "1" -- "0..*" Document : gère

@enduml

@startuml
!theme toy
title Gestion des prêts de documents à la bibliothèque

start

:Vérifie la carte de l'abonné;

if (Carte valide?) then (Non)
    :Proposer inscription par le personnel de la bibliothèque;
    if (Inscription acceptée?) then (Oui)
        :Inscription de l'abonné;
        :Enregistrer Abonné;
    else (Non)
        :Abonné ressort sans document;
        stop
    endif
endif

:Vérifie cotisation et nombre d'emprunts;

if (Cotisation payée?) then (Non)
    :Proposer paiement de la cotisation;
    if (Cotisation payée?) then (Oui)
        :Mettre à jour cotisation;
    else (Non)
        :Abonné ressort sans document;
        stop
    endif
endif

if (Nombre d'emprunts < 5?) then (Non)
    :Abonné ressort sans document;
    stop
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

:Retour Document;
if (Document est un CD-ROM?) then (Oui)
    :Enregistrer retour;
    :Restituer caution;
else (Non)
    :Enregistrer retour;
endif

:Vérifie les documents non rendus après 4 semaines;
if (Documents non rendus?) then (Oui)
    :Génère et envoie une lettre de relance;
endif

:Modification des coordonnées de l'abonné (si demandé);
:Consulter état de l'abonné par le personnel;

stop

@enduml






