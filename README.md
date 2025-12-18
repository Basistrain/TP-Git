# TP-Git
## Commandes:
### SSH:
```
ssh-keygen -t ed25519 -C "dylanmorel0117@gmaiL.com"
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
https://training.github.com/downloads/fr/github-git-cheat-sheet.pdf
https://www.atlassian.com/fr/git/glossary#commands
https://www.hostinger.com/fr/tutoriels/commandes-git
https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging
```
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







