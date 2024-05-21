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


![ Texte alternatif](/asset/diagramme_sequence.png "diagramme_sequence.png")

### Diagramme de Classe

![ Texte alternatif](/asset/diagramme_classe.png "diagramme_classe.png")

### Diagramme d'activité

![ Texte alternatif](/asset/diagramme_activite.png "diagramme_activite.png")

```plantuml
@startuml EmpruntDocument
!theme toy
actor Abonné
actor "Personnel de la Bibliothèque" as Bibliothecaire
participant "Système de Gestion de la Bibliothèque" as Systeme

Abonné -> Bibliothecaire: Présente la carte et les documents
Bibliothecaire -> Systeme: Vérifie l'abonné
Systeme --> Bibliothecaire: Renvoie le statut de la cotisation et le nombre d'emprunts en cours

alt Cotisation non payée
    Bibliothecaire --> Abonné: Refuse l'emprunt (cotisation non payée)
else alt Plus de 5 emprunts
    Bibliothecaire --> Abonné: Refuse l'emprunt (limite d'emprunts atteinte)
else
    Bibliothecaire -> Systeme: Vérifie la disponibilité des documents
    Systeme --> Bibliothecaire: Renvoie la disponibilité des documents et la date de retour si non disponible
    alt Document non disponible
        Bibliothecaire --> Abonné: Informe de l'indisponibilité du document et de la date de retour
    else
        Bibliothecaire -> Systeme: Enregistre l'emprunt (n° abonné, côte document, date)
        Systeme --> Bibliothecaire: Confirme l'enregistrement
        Bibliothecaire --> Abonné: Confirme l'emprunt
    end
end
@enduml

@startuml Bibliotheque
!theme toy

class Abonne {
  - numeroAbonne : int
  - nom : string
  - adresse : string
  - cotisationPayee : bool
  + empruntsEnCours() : int
  + payerCotisation() : void
}

class Document {
  - cote : string
  - titre : string
  - datePublication : Date
  + estDisponible() : bool
}

class Livre extends Document {
  - auteur : string
  - genre : string
}

class CD extends Document {
  - artiste : string
  - genre : string
}

class DVD extends Document {
  - realisateur : string
  - genre : string
}

class Emprunt {
  - dateEmprunt : Date
  + enregistrer() : void
}

class Bibliothecaire {
  - nom : string
  + verifierAbonne(numeroAbonne : int) : Abonne
  + verifierDisponibilite(document : Document) : bool
  + enregistrerEmprunt(abonne : Abonne, document : Document) : void
}

Abonne "1" -- "*" Emprunt : effectue
Document "1" -- "*" Emprunt : concerne
Bibliothecaire "1" -- "*" Emprunt : enregistre

@enduml

@startuml Acitvite
!theme toy

start

:Présenter la carte et les documents;

:Vérifier l'abonné;
if (Cotisation payée et moins de 5 emprunts ?) then (oui)
    :Vérifier la disponibilité des documents;
    if (Documents disponibles ?) then (oui)
        :Enregistrer l'emprunt;
        :Confirmer l'emprunt à l'abonné;
    else (non)
        :Informer de l'indisponibilité du document;
    endif
else (non)
    :Refuser l'emprunt;
endif

:Quitter avec ou sans documents;

stop
@enduml

