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
@startuml sequence
!theme toy
actor Abonné
actor "Personnel de la Bibliothèque" as Bibliothecaire
participant "Système de Gestion de la Bibliothèque" as Systeme


== Emprunt de documents ==
Abonné -> Bibliothecaire: Présente la carte et les documents
Bibliothecaire -> Systeme: Vérifie l'abonné
Systeme --> Bibliothecaire: Renvoie le statut de la cotisation et le nombre d'emprunts en cours

Bibliothecaire -> Abonné: Demande l'inscription [si abonné non inscrit]
Bibliothecaire -> Abonné: Refuse l'emprunt [si cotisation non payée]
Systeme -> Bibliothecaire : Payement cotisation
Bibliothecaire -> Abonné: Refuse l'emprunt [si plus de 5 emprunts]

Bibliothecaire -> Systeme: Vérifie la disponibilité des documents
Systeme --> Bibliothecaire: Renvoie la disponibilité des documents
Bibliothecaire -> Abonné: Informe de l'indisponibilité du document et de la date de retour [si document non disponible]

Bibliothecaire -> Systeme: Vérifie si le document est perdu
Systeme --> Bibliothecaire: Renvoie le statut du document (perdu ou non)
Bibliothecaire -> Systeme: Signale le document comme perdu [si document perdu]
Bibliothecaire -> Abonné: Informe que le document est perdu [si document perdu]

Bibliothecaire -> Systeme: Enregistre l'emprunt (n° abonné, côte document, date)
Systeme --> Bibliothecaire: Confirme l'enregistrement
Bibliothecaire --> Abonné: Confirme l'emprunt

== Relance après 4 semaines ==
Bibliothecaire -> Systeme: Génère les lettres de relance
Systeme --> Bibliothecaire: Liste des abonnés à relancer
Bibliothecaire -> Abonné: Envoie une lettre de relance

== Modification des coordonnées de l'abonné ==
Abonné -> Bibliothecaire: Demande la modification des coordonnées
Bibliothecaire -> Systeme: Modifie les coordonnées
Systeme --> Bibliothecaire: Confirme la modification
Bibliothecaire --> Abonné: Confirme la modification

== Consultation de l'état des abonnés ==
Bibliothecaire -> Systeme: Consulte l'état des abonnés
Systeme --> Bibliothecaire: Affiche l'état des abonnés (nombre d'emprunts, cotisation, etc.)
@enduml

@startuml
!theme toy

class Abonne {
  +id: int
  +nom: String
  +adresse: String
  +cotisationPayee: bool
  +nombreEmprunts: int
  +modifierCoordonnees(nouvelleAdresse: String)
  +consulterEtat(): String
}

abstract class Document {
  +cote: String
  +titre: String
  +datePublication: Date
  +estDisponible: bool
  +estPerdu: bool
}

class Livre extends Document {
}

class Journal extends Document {
  +consultationSurPlace: bool = true
}

class Media extends Document {
  +type: String
}

class Emprunt {
  +id: int
  +dateEmprunt: Date
  +dateRetour: Date
}

class Bibliothecaire {
  +verifierAbonne(id: int): Abonne
  +verifierDisponibiliteDocument(cote: String): Document
  +enregistrerEmprunt(abonne: Abonne, document: Document): Emprunt
  +signalerDocumentPerdu(cote: String)
  +envoyerRelance(abonne: Abonne)
}

class Benevole {
  +periodeActive: Date
  +enregistrerEmprunt(abonne: Abonne, document: Document): Emprunt
}

class Systeme {
  +verifierAbonne(id: int): Abonne
  +verifierDisponibiliteDocument(cote: String): Document
  +enregistrerEmprunt(abonne: Abonne, document: Document): Emprunt
  +signalerDocumentPerdu(cote: String)
  +envoyerRelance(abonne: Abonne)
  +consulterDocuments(criteria: String): List<Document>
}

Abonne "1" -- "0..*" Emprunt : effectue >
Document "1" -- "0..*" Emprunt : concerne >
Emprunt "0..*" -- "1" Abonne : < effectué par
Emprunt "0..*" -- "1" Document : < concerne
Bibliothecaire "1" -- "1" Systeme : utilise >
Benevole "1" -- "1" Systeme : utilise >
Systeme "1" -- "0..*" Emprunt : gère >
Systeme "1" -- "0..*" Abonne : vérifie >
Systeme "1" -- "0..*" Document : vérifie >

@enduml

@startuml
@startuml
!theme toy
title Sequence Mediatheque

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
    else (Non)
        :Abonné ressort sans document;
        stop
    endif
endif

:Vérifie la disponibilité des documents;
:Vérifie les documents non rendus après 4 semaines;
if (Documents non rendus?) then (Oui)
    :Génère et envoie une lettre de relance;
endif

if (Documents disponibles?) then (Non)
    :Abonné ressort sans document;
    stop
else (Oui)
    :Enregistre l'emprunt (n° abonné, côte document, date);
    :Confirme l'emprunt;
    :Abonné ressort avec document;
    stop
endif

@enduml






