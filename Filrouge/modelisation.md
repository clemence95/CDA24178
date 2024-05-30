# Cahier des Charges - VillageGreen
### Identification des Acteurs

Pour le système VillageGreen, les acteurs principaux sont :

1. **Client**
   - Particulier
   - Professionnel
2. **Commercial**
3. **Gestionnaire de Produits**

### Identification des Cas d'Usage

Voici les principaux cas d'usage pour le système VillageGreen :

1. **Consulter le Catalogue**
   - Acteur principal : Client
2. **Ajouter des Produits au Panier**
   - Acteur principal : Client
3. **Valider le Panier et Créer une Commande**
   - Acteur principal : Client
4. **Connexion/Déconnexion d'un Utilisateur**
   - Acteur principal : Client
5. **Inscription d'un Nouvel Utilisateur**
   - Acteur principal : Particulier
6. **Visualiser les Anciennes Commandes**
   - Acteur principal : Client
7. **Gérer les Produits**
   - Acteur principal : Gestionnaire de Produits
8. **Gérer les Commandes**
   - Acteur principal : Commercial

### Scénario Principal Détaillé - Création d'une Commande

#### Flux Principal

1. **Consulter le Catalogue**
   - Le client consulte le catalogue pour sélectionner les produits désirés.
   
2. **Ajouter des Produits au Panier**
   - Le client ajoute les produits sélectionnés au panier en indiquant les quantités souhaitées.

3. **Connexion du Client**
   - Si le client n'est pas encore connecté, il doit se connecter à son compte. S'il n'a pas de compte, il peut en créer un.

4. **Validation du Panier**
   - Le client valide son panier pour procéder à l'achat.

5. **Vérification des Adresses**
   - Le client vérifie et confirme ses adresses de livraison et de facturation.

6. **Choix du Mode de Paiement**
   - Le client choisit un mode de paiement parmi les options proposées (carte bancaire, PayPal, etc.).

7. **Confirmation de la Transaction**
   - Le système de paiement traite la transaction et confirme son succès ou échec.

8. **Enregistrement de la Commande**
   - Le système enregistre la commande dans la base de données.

9. **Mise à Jour des Stocks**
   - Le système met à jour les stocks en fonction des produits commandés.

10. **Envoi de la Confirmation**
    - Le système envoie une confirmation de commande par email au client.

11. **Postcondition**
    - La commande est enregistrée et confirmée, et les stocks sont mis à jour.

#### Flux Alternatifs

1. **Produit Indisponible au Moment de la Validation du Panier**
   - **Situation** : Un produit devient indisponible lors de la validation du panier.
   - **Actions** :
     - Le système informe le client de l'indisponibilité.
     - Le système propose des alternatives ou la suppression du produit indisponible.
     - Le client peut modifier ou annuler la commande.
   - **Reprise** : Le flux principal reprend après modification ou annulation.

2. **Connexion Impossible**
   - **Situation** : Le client rencontre des problèmes de connexion.
   - **Actions** :
     - Le système propose des options de récupération de mot de passe.
     - Le système affiche un message d'erreur avec des instructions pour résoudre le problème.
   - **Reprise** : Le flux principal reprend après une connexion réussie.

3. **Problème lors de la Création du Compte**
   - **Situation** : Le client rencontre un problème technique ou un conflit avec un compte existant lors de la création du compte.
   - **Actions** :
     - Le système affiche un message d'erreur explicatif.
     - Le système propose des solutions pour résoudre le problème (contact du support technique, etc.).
   - **Reprise** : Le flux principal reprend après résolution du problème.

4. **Paiement Échoué**
   - **Situation** : Le paiement échoue.
   - **Actions** :
     - Le système informe le client de l'échec.
     - Le système propose de réessayer le paiement ou d'annuler la commande.
   - **Reprise** : Le flux principal reprend après confirmation du paiement ou annulation de la commande.

5. **Adresse de Livraison Non Valide**
   - **Situation** : L'adresse de livraison fournie par le client est non valide.
   - **Actions** :
     - Le système informe le client de l'erreur.
     - Le client corrige l'adresse.
   - **Reprise** : Le flux principal reprend après correction de l'adresse.



### Diagramme Séquence

![ Texte alternatif](asset/diagramme_sequence.png "diagramme_sequence.png")

### Diagramme Utilisation

![ Texte alternatif](asset/diagramme_utilisation.png "diagramme_utilisation.png")

```plantuml 
@startuml
!theme toy
actor Client
participant "Site Web E-commerce" as SW
participant "Base de Données" as BD
participant "Système de Paiement" as SP
participant "Email de Confirmation" as EC
participant "Gestionnaire de Stocks" as GS

Client -> SW: Consulter le catalogue
Client -> SW: Ajouter produit au panier (avec quantités)
Client -> SW: Valider son panier

alt Client non connecté
    SW -> Client: Se connecter
    Client -> SW: Se connecte ou s'inscrit
    alt Connexion impossible
        SW -> Client: Proposer récupération de mot de passe ou afficher un message d'erreur
        Client -> SW: Réessayer de se connecter ou récupérer mot de passe
        SW -> BD: Vérifier les identifiants
        BD --> SW: Identifiants valides
    else Connexion réussie
        SW -> Client: Connexion réussie
    end

    alt Inscription nécessaire
        Client -> SW: Demander l'inscription
        SW -> Client: Afficher formulaire d'inscription
        Client -> SW: Remplir et soumettre le formulaire d'inscription
        SW -> BD: Enregistrer les détails du compte
        BD --> SW: Compte créé
        SW -> Client: Compte créé, demander connexion
    end
else Client connecté
end

Client -> SW: Valider panier

alt Confirmation de commande
    SW -> BD: Vérifier disponibilité des produits
    alt Produits indisponibles
        BD --> SW: Produits indisponibles
        SW -> Client: Informer de l'indisponibilité et proposer des alternatives
        Client -> SW: Modifier ou annuler la commande
        SW -> GS: Alerter gestionnaire des stocks
        GS -> BD: Désactiver produit indisponible
        SW -> BD: Vérifier disponibilité des produits modifiés
        BD --> SW: Disponibilité confirmée
    else Produits disponibles
        BD --> SW: Disponibilité confirmée
    end

    Client -> SW: Confirmer les adresses de livraison et de facturation
    SW -> Client: Demander adresse de livraison
    Client -> SW: Fournir adresse de livraison
    SW -> BD: Vérifier adresse de livraison
    alt Adresse de livraison valide
        BD --> SW: Adresse valide
    else Adresse de livraison invalide
        BD --> SW: Adresse invalide
        SW -> Client: Informer erreur adresse de livraison
        Client -> SW: Corriger adresse de livraison
        SW -> BD: Vérifier adresse de livraison corrigée
        BD --> SW: Adresse valide
    end

    SW -> Client: Demander adresse de facturation
    Client -> SW: Fournir adresse de facturation
    SW -> BD: Vérifier adresse de facturation
    alt Adresse de facturation valide
        BD --> SW: Adresse valide
    else Adresse de facturation invalide
        BD --> SW: Adresse invalide
        SW -> Client: Informer erreur adresse de facturation
        Client -> SW: Corriger adresse de facturation
        SW -> BD: Vérifier adresse de facturation corrigée
        BD --> SW: Adresse valide
    end

    Client -> SW: Choisir le mode de paiement
    SW -> SP: Demande de paiement
    alt Paiement réussi
        SP --> SW: Paiement confirmé
        SW -> BD: Enregistrer commande
        SW -> BD: Mettre à jour les stocks
        SW -> EC: Envoyer confirmation par email
        EC --> Client: Confirmation de commande reçue
    else Paiement échoué
        SP --> SW: Paiement refusé
        SW -> Client: Informer échec du paiement et proposer de réessayer ou annuler
        alt Réessayer le paiement
            Client -> SW: Réessayer le paiement
            SW -> SP: Nouvelle demande de paiement
            SP --> SW: Paiement confirmé
            SW -> BD: Enregistrer commande
            SW -> BD: Mettre à jour les stocks
            SW -> EC: Envoyer confirmation par email
            EC --> Client: Confirmation de commande reçue
        else Annuler la commande
            Client -> SW: Annuler la commande
            SW -> Client: Confirmer annulation
        end
    end
end

@enduml

@startuml
actor Client
actor Particulier as P
actor Professionnel as Pro
actor Commercial
actor GestionnaireDeProduits as GDP

Client <|-- P
Client <|-- Pro

usecase "Consulter le Catalogue" as UC1
usecase "Ajouter/Supprimer des Produits dans le Panier" as UC2
usecase "Inscription d'un Nouvel Utilisateur" as UC3
usecase "Connexion/Déconnexion" as UC4
usecase "Valider le Panier et Créer une Commande" as UC5
usecase "Visualiser les Anciennes Commandes" as UC6
usecase "Gérer les Produits" as UC7
usecase "Gérer les Commandes" as UC8
usecase "Afficher le Tableau de Bord" as UC9

Client --> UC1
Client --> UC2
P --> UC3
Client --> UC4
Client --> UC5
Client --> UC6
GDP --> UC7
Commercial --> UC8
Commercial --> UC9
@enduml

