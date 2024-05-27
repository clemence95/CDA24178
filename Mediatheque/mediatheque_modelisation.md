## Identification des Acteurs

1. **Abonné** : Utilisateur de la médiathèque qui emprunte des ressources.
2. **Employé** : Personnel de la médiathèque qui gère les inscriptions, les emprunts, les retours, et les mises hors service.
3. **Bénévole** : Personne qui aide à la médiathèque en gérant les emprunts et les retours, mais ne peut pas inscrire des abonnés ou effectuer des paiements.
4. **Système de Gestion de la Bibliothèque (SGB)** : Système qui gère les opérations liées aux abonnés et aux documents.
5. **Base de données (DB)** : Stocke les informations sur les abonnés, les documents, les emprunts, et les transactions.

## Identification des Cas d'Usage

1. **Inscription d'un abonné**
2. **Vérification de la carte d'abonné**
3. **Paiement de la cotisation**
4. **Emprunt de document**
5. **Retour de document**
6. **Gestion des documents non rendus**
7. **Modification des coordonnées de l'abonné**
8. **Consultation de l'état de l'abonné**
9. **Mise hors service des documents perdus ou volés**

## Cas d'Usage : Emprunt d'une ressource

### Scénario Principal

1. **Acteur principal** : Abonné
2. **Pré-condition** : L'abonné doit avoir une carte valide, une cotisation à jour et moins de 5 emprunts en cours.
3. **Post-condition** : L'emprunt est enregistré dans le système et le document est marqué comme emprunté.

**Étapes du scénario principal** :
1. L'abonné présente sa carte et le(s) document(s) à emprunter à l'employé ou au bénévole.
2. L'employé ou le bénévole vérifie la carte de l'abonné dans le SGB.
3. Le SGB récupère les détails de l'abonné depuis la base de données.
4. L'employé ou le bénévole vérifie la cotisation de l'abonné et le nombre d'emprunts en cours.
5. Le SGB confirme que la cotisation est payée et que le nombre d'emprunts en cours est inférieur à 5.
6. L'employé ou le bénévole vérifie la disponibilité du document dans le SGB.
7. Si le document est un CD-ROM, une caution est demandée à l'abonné.
8. Si le document est un microfilm, le SGB vérifie la disponibilité d'un écran.
9. L'employé ou le bénévole enregistre l'emprunt (numéro d'abonné, cote du document, date de retour) dans le SGB.
10. Le SGB met à jour l'état du document dans la base de données pour indiquer qu'il est emprunté.
11. L'abonné ressort avec le document emprunté.

### Scénarios Alternatifs

#### Scénario alternatif 1 : Carte non valide

1. L'abonné présente sa carte et le(s) document(s) à emprunter à l'employé ou au bénévole.
2. L'employé ou le bénévole vérifie la carte de l'abonné dans le SGB.
3. Le SGB indique que la carte n'est pas valide.
4. L'employé ou le bénévole dirige l'abonné vers un employé pour une inscription.
5. L'abonné accepte l'inscription et fournit les informations nécessaires.
6. L'employé inscrit l'abonné dans le SGB.
7. Le SGB enregistre le nouvel abonné dans la base de données.
8. L'abonné présente de nouveau sa carte valide pour emprunter le(s) document(s).

#### Scénario alternatif 2 : Cotisation non payée

1. L'abonné présente sa carte et le(s) document(s) à emprunter à l'employé ou au bénévole.
2. L'employé ou le bénévole vérifie la carte de l'abonné dans le SGB.
3. Le SGB récupère les détails de l'abonné depuis la base de données.
4. L'employé ou le bénévole vérifie la cotisation de l'abonné et le nombre d'emprunts en cours.
5. Le SGB indique que la cotisation n'est pas payée.
6. L'employé ou le bénévole dirige l'abonné vers un employé pour le paiement de la cotisation.
7. L'abonné accepte de payer la cotisation.
8. L'employé enregistre le paiement de la cotisation dans le SGB.
9. Le SGB met à jour le statut de la cotisation dans la base de données.
10. L'abonné présente de nouveau sa carte avec la cotisation à jour pour emprunter le(s) document(s).

#### Scénario alternatif 3 : Nombre d'emprunts supérieur ou égal à 5

1. L'abonné présente sa carte et le(s) document(s) à emprunter à l'employé ou au bénévole.
2. L'employé ou le bénévole vérifie la carte de l'abonné dans le SGB.
3. Le SGB récupère les détails de l'abonné depuis la base de données.
4. L'employé ou le bénévole vérifie la cotisation de l'abonné et le nombre d'emprunts en cours.
5. Le SGB indique que le nombre d'emprunts en cours est supérieur ou égal à 5.
6. L'employé ou le bénévole informe l'abonné qu'il ne peut pas emprunter plus de 5 documents à la fois.
7. L'abonné ressort sans emprunter de nouveaux documents.

#### Scénario alternatif 4 : Document non disponible

1. L'abonné présente sa carte et le(s) document(s) à emprunter à l'employé ou au bénévole.
2. L'employé ou le bénévole vérifie la carte de l'abonné dans le SGB.
3. Le SGB récupère les détails de l'abonné depuis la base de données.
4. L'employé ou le bénévole vérifie la cotisation de l'abonné et le nombre d'emprunts en cours.
5. Le SGB confirme que la cotisation est payée et que le nombre d'emprunts en cours est inférieur à 5.
6. L'employé ou le bénévole vérifie la disponibilité du document dans le SGB.
7. Le SGB indique que le document n'est pas disponible.
8. L'employé ou le bénévole informe l'abonné que le document n'est pas disponible.
9. L'abonné ressort sans emprunter le document.




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

EB -> SGB: Vérifie si des documents sont perdus ou volés
SGB -> DB: Rechercher documents perdus ou volés
DB --> SGB: Liste des documents perdus ou volés
alt Documents perdus ou volés
    SGB -> EB: Génère une mise hors service
    EB -> SGB: Enregistre la mise hors service
    SGB -> DB: Mettre à jour le statut du document
    DB --> SGB: Confirmation de mise hors service
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
    + mettreHorsService()
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
    + mettreHorsServiceDocument(document: Document)
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

:Vérifie si des documents sont perdus ou volés;
if (Documents perdus ou volés?) then (Oui)
    :Mettre hors service le document;
endif

:Modification des coordonnées de l'abonné (si demandé);
:Consulter état de l'abonné par le personnel;

stop

@enduml







