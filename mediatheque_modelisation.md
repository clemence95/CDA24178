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
- **Abonné non inscrit** : 
  - Le Personnel de la mediathéque demande à l'abonné de s'inscrire
- **Cotisation Non Payée** :
  - Le Personnel de la Médiathèque informe l'Abonné que sa cotisation n'est pas payée et refuse l'emprunt.
- **Limite d'Emprunts Atteinte** :
  - Le Personnel de la Médiathèque informe l'Abonné qu'il a atteint sa limite d'emprunts et refuse l'emprunt.
- **Ressource Indisponible** :
  - Le Personnel de la Médiathèque informe l'Abonné que la ressource demandée n'est pas disponible.
  - L'Abonné peut choisir une autre ressource ou attendre que celle-ci soit disponible.
- **Document Perdu** : 
  - Le personnel de la médiathéque informe l'Abonné que le document est perdu.


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
actor Bibliothécaire
participant "Système de Gestion de la Bibliothèque" as SGB

Abonné -> Bibliothécaire: Présente la carte et les documents
Bibliothécaire -> SGB: Vérifie la carte de l'abonné
alt Carte non valide
    SGB -> Bibliothécaire: Proposer inscription
    Bibliothécaire -> Abonné: Proposer inscription
    Abonné -> Bibliothécaire: Accepte l'inscription
    Bibliothécaire -> SGB: Inscription de l'abonné
    SGB -> Bibliothécaire: Confirmation d'inscription
    Bibliothécaire -> Abonné: Confirmation d'inscription
else Carte valide
    SGB -> Bibliothécaire: Abonné inscrit
end

Bibliothécaire -> SGB: Vérifie cotisation et nombre d'emprunts
alt Cotisation non payée ou plus de 5 emprunts
    SGB -> Bibliothécaire: Proposer paiement de la cotisation
    Bibliothécaire -> Abonné: Proposer paiement de la cotisation
    Abonné -> Bibliothécaire: Paye la cotisation
    Bibliothécaire -> SGB: Enregistre paiement cotisation
    SGB -> Bibliothécaire: Confirmation de paiement
else Cotisation payée et moins de 5 emprunts
    SGB -> Bibliothécaire: Abonné valide
end

Bibliothécaire -> SGB: Vérifie disponibilité des documents
alt Documents disponibles
    SGB -> Bibliothécaire: Documents disponibles
    Bibliothécaire -> SGB: Enregistre emprunt (n° abonné, côte document, date)
    SGB -> Bibliothécaire: Confirmation de l'emprunt
    Bibliothécaire -> Abonné: Confirme l'emprunt
else Documents non disponibles
    SGB -> Bibliothécaire: Documents non disponibles
    Bibliothécaire -> Abonné: Informe de l'indisponibilité des documents
end

Bibliothécaire -> SGB: Vérifie les documents non rendus après 4 semaines
alt Documents non rendus
    SGB -> Bibliothécaire: Génère et envoie une lettre de relance
else Tous les documents rendus
    SGB -> Bibliothécaire: Aucun document non rendu
end

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






