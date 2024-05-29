# Cahier des Charges - VillageGreen

## Identification des Acteurs

Pour le système VillageGreen, les acteurs principaux sont :

1. **Client**
   - Particulier
   - Professionnel
2. **Commercial**
3. **Gestionnaire de Produits**
4. **Système de Commande (SC)**
5. **Système de Paiement (SP)**
6. **Système de Stock (SS)**
7. **Base de Données (BD)**
8. **Email de Confirmation (EC)**

## Identification des Cas d'Usage

Voici les principaux cas d'usage pour le système VillageGreen :

1. **Consultation du Catalogue**
   - Acteur principal : Client
2. **Ajout de Produit au Panier**
   - Acteur principal : Client
3. **Validation du Panier et Passage de Commande**
   - Acteur principal : Client
4. **Connexion/Déconnexion d'un Utilisateur**
   - Acteur principal : Client
5. **Inscription d'un Nouvel Utilisateur**
   - Acteur principal : Particulier
6. **Visualisation des Anciennes Commandes**
   - Acteur principal : Client
7. **Gestion des Produits**
   - Acteur principal : Gestionnaire de Produits
8. **Gestion des Commandes**
   - Acteur principal : Commercial
9. **Paiement de la Commande**
   - Acteur principal : Client
10. **Mise à Jour du Stock**
    - Acteur principal : Système de Stock
11. **Envoi de Confirmation par Email**
    - Acteur principal : Système de Commande

## Scénario Principal et Scénarios Alternatifs pour le Cas d'Usage "Validation du Panier et Passage de Commande"

### Scénario Principal : Validation du Panier et Passage de Commande

1. **Précondition :** Le client est connecté et a des produits dans son panier.
2. **Scénario principal :**
   1. Le client accède à son panier et clique sur "Valider la commande".
   2. Le système affiche le récapitulatif de la commande.
   3. Le client vérifie les détails de la commande (produits, quantités, prix, adresses de livraison et de facturation).
   4. Le client confirme la commande.
   5. Le système vérifie la disponibilité des produits dans la base de données.
   6. Le système calcule le montant total de la commande.
   7. Le client choisit le mode de paiement (carte de crédit, PayPal, etc.).
   8. Le système redirige le client vers le système de paiement sécurisé.
   9. Le client effectue le paiement.
   10. Le système de paiement confirme le paiement.
   11. Le système enregistre la commande dans la base de données.
   12. Le système met à jour les stocks.
   13. Le système envoie une confirmation de commande par email au client.
   14. Le client reçoit l'email de confirmation.
3. **Postcondition :** La commande est enregistrée et confirmée, les stocks sont mis à jour.

### Scénarios Alternatifs

1. **Scénario alternatif A1 : Produit indisponible**
   1. Le système vérifie la disponibilité des produits dans la base de données.
   2. Le système détecte qu'un ou plusieurs produits sont indisponibles.
   3. Le système informe le client de l'indisponibilité et propose des alternatives ou la suppression des produits indisponibles.
   4. Le client choisit de modifier la commande ou d'annuler la commande.
   5. Le scénario principal reprend à l'étape 5 si la commande est modifiée, sinon il se termine.

2. **Scénario alternatif A2 : Paiement échoué**
   1. Le client choisit le mode de paiement.
   2. Le système redirige le client vers le système de paiement sécurisé.
   3. Le client effectue le paiement.
   4. Le système de paiement refuse le paiement (carte refusée, solde insuffisant, etc.).
   5. Le système informe le client de l'échec du paiement.
   6. Le client choisit de réessayer le paiement ou d'annuler la commande.
   7. Le scénario principal reprend à l'étape 7 si le paiement est réessayé, sinon il se termine.

3. **Scénario alternatif A3 : Adresse de livraison non valide**
   1. Le client vérifie les détails de la commande.
   2. Le système détecte que l'adresse de livraison est non valide ou incomplète.
   3. Le système informe le client de l'erreur d'adresse.
   4. Le client corrige l'adresse de livraison.
   5. Le scénario principal reprend à l'étape 4.
