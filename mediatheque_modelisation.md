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
  - Le personnel de la médiathéque informe l'Abonné que le document est perdu


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

alt Abonné non inscrit
    Bibliothecaire --> Abonné: Demande l'inscription
else
    alt Cotisation non payée
        Bibliothecaire --> Abonné: Refuse l'emprunt (cotisation non payée)
    else alt Plus de 5 emprunts
        Bibliothecaire --> Abonné: Refuse l'emprunt (limite d'emprunts atteinte)
    else
        Bibliothecaire -> Systeme: Vérifie la disponibilité des documents
        Systeme --> Bibliothecaire: Renvoie la disponibilité des documents

        alt Document non disponible
            Bibliothecaire --> Abonné: Informe de l'indisponibilité du document et de la date de retour
        else
            Bibliothecaire -> Systeme: Vérifie si le document est perdu
            Systeme --> Bibliothecaire: Renvoie le statut du document (perdu ou non)
            alt Document perdu
                Bibliothecaire -> Systeme: Signale le document comme perdu
                Bibliothecaire --> Abonné: Informe que le document est perdu
            else
                Bibliothecaire -> Systeme: Enregistre l'emprunt (n° abonné, côte document, date)
                Systeme --> Bibliothecaire: Confirme l'enregistrement
                Bibliothecaire --> Abonné: Confirme l'emprunt
            end
        end
    end
end
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
!theme toy

start
:Présente la carte et les documents;
:Vérifie l'abonné;
if (Abonné non inscrit?) then (oui)
  :Demande l'inscription;
  stop
else (non)
  :Vérifie la cotisation et le nombre d'emprunts;
  if (Cotisation non payée?) then (oui)
    :Refuse l'emprunt (cotisation non payée);
    stop
  else (non)
    if (Plus de 5 emprunts?) then (oui)
      :Refuse l'emprunt (limite d'emprunts atteinte);
      stop
    else (non)
      :Vérifie la disponibilité des documents;
      if (Document disponible?) then (oui)
        if (Document perdu?) then (oui)
          :Signale le document comme perdu;
          stop
        else (non)
          :Enregistre l'emprunt;
          :Confirme l'emprunt;
          stop
        endif
      else (non)
        :Informe de l'indisponibilité du document;
        :et de la date de retour;
        stop
      endif
    endif
  endif
endif

@enduml



