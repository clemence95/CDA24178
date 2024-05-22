### Acteurs :

- **Utilisateur** : Client particulier ou professionnel utilisant le site web ou l'application mobile pour consulter le catalogue, passer des commandes et gérer son compte.

- **Système** : La plateforme e-commerce et l'application mobile fournissant les fonctionnalités nécessaires pour la consultation du catalogue, la gestion des commandes, la création de compte, etc.

- **Commercial** : Personne chargée de gérer les clients professionnels, de négocier les réductions et de gérer les stocks des produits.

- **Fournisseur** : Entreprise ou entité fournissant des produits à l'entreprise Village Green, responsable de la mise à jour du catalogue et de la gestion des approvisionnements.

### Scénario Principal :

1. **Consultation et Commande de Produits** :
   - L'utilisateur visite le site web ou l'application mobile.
   - L'utilisateur ajoute des produits dans son panier.
   - L'utilisateur valide son panier.
   - L'utilisateur se connecte à son compte ou crée un compte.
   - L'utilisateur fournit les informations nécessaires telles que l'adresse de livraison et de facturation.
   - L'utilisateur valide sa commande.
   - L'utilisateur reçoit un mail de confirmation de commande avec la date de facturation, le numéro de commande, etc.

### Scénarios Alternatifs :

1. **Produit non disponible au moment de la validation du panier** :
   - L'utilisateur ajoute un produit à son panier, mais au moment de valider sa commande, ce produit devient indisponible.
   - Le système doit informer l'utilisateur de cette indisponibilité et lui permettre de supprimer ou de remplacer le produit concerné dans son panier.

2. **Connexion impossible** :
   - L'utilisateur tente de se connecter à son compte, mais rencontre des problèmes de connexion dus à une erreur de saisie du mot de passe ou à une panne du système.
   - Le système doit proposer des options de récupération de mot de passe ou afficher un message d'erreur avec des instructions pour résoudre le problème.

3. **Problème lors de la création du compte** :
   - L'utilisateur tente de créer un compte mais rencontre un problème technique ou un conflit avec un compte existant.
   - Le système doit afficher un message d'erreur explicatif et proposer des solutions pour résoudre le problème, comme contacter le support technique.

4. **Modification de la commande après validation** :
   - L'utilisateur a validé sa commande mais souhaite apporter des modifications à celle-ci, comme ajouter ou supprimer des produits, ou modifier les informations de livraison.
   - Le système doit permettre à l'utilisateur de modifier sa commande tant qu'elle n'a pas été expédiée, en lui fournissant une interface conviviale pour effectuer ces changements.

5. **Problème lors de l'envoi du mail de confirmation** :
   - Suite à la validation de la commande, le système rencontre un problème lors de l'envoi du mail de confirmation à l'utilisateur.
   - Le système doit notifier l'utilisateur de ce problème et lui assurer que sa commande a bien été enregistrée, tout en lui fournissant les informations nécessaires pour suivre l'état de sa commande.

