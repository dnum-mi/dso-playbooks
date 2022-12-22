
# Creation d'un projet de initest

## Configuration

Creation d'un fichier ansible-vault dans inventory/<NOM_ENV>/all

Créer un fichier pass_secret avec le mot de passe vault par exemple dans ~/pass_secret

```
ansible-vault create all.yml  --vault-password-file ~/pass_secret
```

Les fois d'après pour éditer ce fichier :

```
ansible-vault edit all.yml  --vault-password-file ~/pass_secret
```

Le contenu de ce fichier doit correspondre à (valeurs d'exemples) :


Le fichier README du projet infra-socle-openshift décrit comment récupérer l'ensemble de ces variables

 * GITLAB_TOKEN : Récupéré dans l'IHM Web Gitlab
 * Vault_Token : Récéupéré lors de l'initialisation du Vault
 * KC_PASSWORD : récupéré par dans le secret : ``` kubectl get secret credential-dso-keycloak -n keycloak-system -o yaml | yq '.data.ADMIN_PASSWORD' | base64 -d ```
 * NEXUS_ADMIN_PASSWORD : Récupéré lors de la première connexion à Nexus suite à la modification du mot de passe par defaut
 * QUAY_ADMIN_TOKEN : Créé dans l'application Web QUAY (en tant que superuser)
 * SONAR_API_TOKEN : Créé dans l'application Web SONAR
 * K8S_AUTH_KUBECONFIG : Chemin de votre fichier kubeconfig sur votre environnement
 * Les URL sont créées / configurées lors de l'installation initiale par le fichier d'environnement env-<NOM_ENV>.sh
 * Les nom d'utilisateur ne doivent pas être modifiés



### Execution

ansible-playbook provisioning-project-dso.yml -i inventory/ -e "ORGANIZATION_NAME=interieur" -e "EMAIL=test@test.com" -e "PROJECT_NAME=inittest" --connection=local -e 'ansible_python_interpreter=/usr/bin/python3' -vvv


