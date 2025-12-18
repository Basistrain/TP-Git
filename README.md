# TP-Git
## Commandes:
### SSH:
```
ssh-keygen -t ed25519 -C "dylanmorel0117@gmaiL.com"
Import de la clé sur le compte Github en allant dans "parametrese" puis "Clés SSH"
ssh -T git@github.com
```
### Dossier Devops
Création du dossier DevOps via interface graphique de visual studio code

### Création de la branche develop
```
git branch develop
```
### Push des fichiers sur Github
```
git add Devops/*
git commit -m "depot"
git push origin develop
```

### Merge de la branche develop sur la branch main
```
git switch main
git merge develop
```

### Renomage du fichier file1 et supression du fichier file3
```
git mv ./DevOps/file1 ./DevOps/file1.txt
git rm DevOps/file3
git commit -m "depot"
git push origin develop
```

### Merge de la branche develop sur la branch main
```
git switch main
git merge develop
```

## Liens Utilisés:
```
https://docs.github.com/fr/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
https://training.github.com/downloads/fr/github-git-cheat-sheet.pdf
https://www.atlassian.com/fr/git/glossary#commands
https://www.hostinger.com/fr/tutoriels/commandes-git
https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging
```
## Liste des commandes:
| Commande | Description |
|:-------- |:--------:| 
| ssh-keygen -t ed25519 -C "dylanmorel0117@gmaiL.com"    | Création de la clé SSH  |
| ssh -T git@github.com    | Connexion à Github  |
| git branch develop     | Création de la deuxieme branch "develop"   | 
| git add Devops/*    | Ajout de tout le dossier Devops dans l'index pour le commit   | 
| git commit -m "depot"    | Enregistre des instantanés des fichiers de l'index   | 
| git push origin develop    | Envoie tous les commits de la branche develop vers GitHub   | 
| git switch main    | Permet de passer d'une branche à une autre, ici on passe de develop à la branche main   | 
| git merge develop    | Combine dans la branche courante l'historique de la branche spécifiée  | 
| git mv ./DevOps/file1 ./DevOps/file1.txt     | Renomme le fichier et prépare le changement pour un commit    | 
| git rm DevOps/file3    | Supprime le fichier du répertoire de travail et met à jour l'index   | 
## Diagram du flow

```mermaid
  graph TD;
     A(["Start"]) --> B{"Branch"}
    B --> C["Main"] & D["Develop"]
    C --> n1["Création du dossier Devops"]
    D --> n2["Création des 3 fichiers"]
    n2 --> n3["Commit"]
    n1 --> n4["Merge branch Develop"]
    n3 --> n12["Push"]
    n4 --> n5["Main"] & n6["Develop"]
    n6 --> n7["Suppresion du fichier file3"]
    n7 --> n8["Renomage du fichier file1"]
    n8 --> n9["Commit"]
    n5 --> n10["Merge Branch Develop"]
    n9 --> n11["Push"]
    n11 --> n10
    n12 --> n4
    n3@{ shape: diam}
    n9@{ shape: diam}
```







