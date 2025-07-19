# 🍵 Test technique - Probesys
Ce projet est un défi technique réalisé dans le cadre du processus de recrutement de l'entreprise Probesys.

 ## 📒 Description

<details>
<summary> <strong>💡 Notions abordées </strong>(voir le détail)</summary>

- Créer des tables dans une bdd (migration)
- Model avec des conditions de validation
- Les Controllers et leurs actions
- Créer des Views avec un formulaire
- Routing (Resources, Collection, Member)
- Tables relationnelles (Belongs to, Has many)
- Requêtes basiques en bdd
- Créer des Helpers

</details>

<details>
<summary> <strong>📝 Contexte </strong>(voir le détail)</summary>

>Le but de cet exercice est de connaitre l'étendu des connaissances et la capacité d’adaptation du participant
>
>Vous devez créer une interface web permettant de créer X équipes composé de 11 joueurs.
>Chaque joueur dispose d'un nom, et d'un poste sur le terrain.
>
>Lors d'un match deux équipent complètes précédemment créées s'affrontent. Un nombre de kill aléatoire (entre 0 et 5) est marqué par chacune des équipes.
>
>Un tournois se déroule entre 8 équipes. Chaque équipe ne rencontre qu'une seule fois une autre équipe.
>Une victoire donne 3 points, un match nul 1 point et une défaite 0 point.
>
>Un classement final sera attendu sous cette forme :
>
>| Equipe | Points | kill reçu | kill marqués |
>| --- | --- | --- | --- |
>| nom_equipe1 | 19 | 12 | 33 |
>| nom_equipe3 | 15 | 22 | 23 |
>| nom_equipe2 | 5 | 40 | 10 |

</details>

<details>
<summary> <strong>🛠️ Développement de la base de l'application </strong>(voir le détail)</summary>


>### Première étape : Créer une équipe (Niveau basique) (feat #1)
>- [x]  L'équipe doit disposer d'un nom. (Nombre de caractère maximum 50)
>- [x]  L'équipe doit disposer d'une ville.
>- [x]  Le routing est correct.
>- [x]  Le model est correct.
>- [x]  Le controller est correct.


>### Deuxième étape : Créer les joueurs (Niveau basique) (feat #2)
>
>- [x]  Un joueur doit avoir un nom
>- [x]  Un joueur doit avoir un poste (Heal/Tank/DPS)
>- [x]  Le poste est selectable dans un dropdown (liste déroulante)


>### Troisième étape : Affecter des joueurs à une équipe (Niveau intermédiaire) (feat #3)
>
>- [x]  Un dropdown permet de sélectionner une équipe précédemment créer dans lequel intégrer le joueur
>- [x]  11 *joueurs maximum par équipe*


>### Quatrième étape : Le tournois (Niveau confirmé) (feat #4)
>
>- [x]  Un bouton permet de créer et peupler automatiquement 8 équipes de 11 joueurs
>- [x]  Chaque équipe affronte une seule et unique fois une autre équipe (Attribuer un score aléatoire suffit)
>- [x]  Le résultat des matchs est affiché correctement (voir le tableau ci-dessus pour la méthode de calcul)


>### Dockeriser le projet (feat #4)
>
>- [x] Créer un docker pour faire tourner votre projet


</details>


<details>
<summary><strong>🚀 Développement de propositions pour améliorer le projet </strong>(voir le détail)</summary>

>### Divers
>- [x]  des alertes et notices 'discardables'
>- [x]  Un bouton permet d'exporter les résultats du tournoi en csv

>### Ergonomie
>- [x]  front-end soigné et 'responsive'
>- [x]  vignette d'options rapides
>- [x]  night mode
>- [x]  possibilité de **changer la langue au moins entre anglais et français sans rechargement de la page et avec persistence** d'une page à l'autre
>   - amelioration future : couvrir les messages d'erreur, outil de detection des balises i18n et de remplissage des fichiers de langues

>### Technique
>- [x]  mettre en place un volume pour ne pas avoir à "re dockeriser" le projet à chaque modification
>- [x]  Repertorier des actions usuelles dans un **Makefile** pour améliorer l'experience de dev + **documentation automatique** (help , helplin , helpwin)
>- [x]  **analyse statique / lint**
>- [x]  **tests** unitaires avec rspec pour valider les 3 modeles
>   - amelioration possible : couvrir l'ensemble des fonctionnalités, controlleurs et modeles
>- [x]  **integration continue (CI)** des tests et analyses lors de l'integration
>   - amelioration possible : **deploiement continu**

</details>


<br/>


>🕒 Ce projet a été commencé le 15 juillet


 ## 🛠️ Setup
*ℹ️ Ce projet a été développé sous windows avec wsl*
 
 ### Etapes

 - Installer [Docker Desktop](https://www.docker.com/products/docker-desktop) sur la machine.
 - Cloner ce dépôt : <code>git clone 'https://github.com/ALEXISLEGROSNC/test-technique-probesys.git'</code>
 - installer make
    - (windows : <code> choco install make </code>)
    - (linux : <code> sudo apt install make </code>)
 - builder et lancer les conteneurs avec make (<code> make help </code> !)
 - Accéder à la solution <a href="http://localhost:3000">http://localhost:3000</a>
 - Il y a un volume mis en place dans le docker-compose, donc le code peut être modifié sans avoir à "re-build docker" !
 - **Lancer les tournois !**

 ### Versions

> <code>ruby -v</code> ruby 3.4.4 (2025-05-14 revision a38531fd3f) +PRISM [x86_64-linux]

> <code>rails -v</code> Rails 8.0.2

> <code>mysql --version</code> mysql  Ver 15.1 Distrib 10.6.22-**MariaDB**, for debian-linux-gnu (x86_64) using  EditLine wrapper



## 🧰 Stack Technique
<img style="height:50px;" src="https://cdn-icons-png.flaticon.com/512/1216/1216733.png"
alt="HTML5"
title="HTML5"/>
<img style="height:50px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/CSS3_logo.svg/2048px-CSS3_logo.svg.png"
alt="CSS3"
title="CSS3"/>
<img style="height:50px;" src="https://img.icons8.com/color/512/bootstrap--v2.png"
alt="Bootstrap"
title="Bootstrap"/>
<img style="height:50px;" src="https://static.vecteezy.com/system/resources/previews/027/127/463/non_2x/javascript-logo-javascript-icon-transparent-free-png.png"
alt="Javascript"
title="Javascript"/>
<img style="height:50px;" src="https://www.okoone.com/wp-content/uploads/2024/06/Ruby-on-rail-logo-1.png"
alt="Ruby on Rails"
title="Ruby on Rails"/>


## 👨‍💻 Contributeur/ice(s) et contact(s)
<table>
<thead>
<tr>
<th>Nom</th>
<th>Rôle(s)</th>
<th>Contact</th>
</tr>
</thead>
<tbody>
<tr>
<td>Alexis Legros</td>
<td>
<ul><li>Dev Fullstack</li></ul>
</td>
<td>alexislegrosnc@gmail.com</td>
</tr>
</tbody>
</table>
