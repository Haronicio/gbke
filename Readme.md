
# Gameboy Basic Kernel Engine

credit : GBDK-2020

Petit système écrit en C pour la gestion des tâches et de mémoire sur GameBoy(Color)

## Base

Le but est de programmer une bibliothèque permettant de créér un programme sur GB. Pour cela je m'inspire du système de processus de UNIX (V2). La bibliothèque ZGB offre déjà se type de fonctionnalité mais sous forme de moteur de jeu orienté objet, ici c'est plus une sorte de noyau minimal avec une approche objet.

Un noyau (kernel) est en fait un gestionnaire de tâche (ordonnanceur) avec un gestionnaire de mémoire (adressage virtuel), l'utilisation sera la suivante : Un utilisateur peut écrire un programme simple qui éxécute un processus à la fois (pas plusieurs processus pour le moment car trop gourmand), un processus à plusieurs tâches pouvant s'éxécuter en "parallèle" (pour le moment les tâches sont séquentiel mais intérruptible), les tâches pouvant communiquer l'une avec l'autre via une sorte d'adresse virtuelle, d'ailleurs une tâhe à la capacité de partager son code avec une autre tâche, selon le type de tâche, la periode d'éxécution est différente (utilisation d'un ordonnanceur pour l'ensemble des tâches d'évènement et de texture, et d'intérruption pour l'audio et autres IO).
Un processus pourra sauvegarder sont contextes dans la SRAM pour être repris plus tard.

Ce que GBKE n'est pas :

- Un système d'exploitation : même si des fonctionnanlités sont annalogue, GBKE est plus un outil de développement qui offre un mécanisme de gestion de tâche et de mémoire plutôt qu'un système d'exploitation, donc pas de mode U et mode S, pas d'appel système pas de préemption de tâche(pour le moment ?) et pas de structure HMAP compliqué (peut être dans un avenir ou j'arrive a faire un swap RAM vers ROM)
- Un moteur de jeu : Je me suis jeter dedans pour à la base créer un programme de génération de son facile, j'aurais pu le faire avec ZGB qui est très efficace en tout point mais l'approche êtait trop orienté jeu pour moi

Le projet doit s'adapter aux limitations matérielles de la plateforme listé ci-dessous.

## Ordonnanceur

## Gestionnaire de mémoire virtuelle

## Infos

règle d'inclusions stricte a grand renfort d'externe

le compilateur Z80 est aligné à l'octet mais GBDK aligne à la taille du type
la taille d'un pointeur est 2 octets

## TODO après

validertous les exemples de gbdk

choses à faire par la suite (peut être autres libs)

- Audio :
  - Sons (chargement déchargement manipulation lecture écriture)
- Video :
  - Sprite (chargement déchargement manipulation animation optimisation)
  - Background (big map scrolling matasprite palette)
  - OAM
- Mémoire :
  - Banking
  - Swap (RAM -> ROM)
  - RAM -> HIRAM
- Optimiser :
  - assembleur
  - autres tricks

## Makefile

Le makefile, qui vient du template obj de GBDK 2020 permet de compiler tous les fichiers sources, y compris assembleur en fichier objet. Avec les options de compilation, il génère aussi des fichiers suplémentaire comme des linker et des binaires, j'explique les options :

*-W* permet de passer un argument aux autresc ompilateur de la toolchain *a* assembleur *l* linker *m* makebin

* -Wa-l créé un fichier list (*.lst) qui détaille le code assembleur pour l'optimisation
* -Wl-m créé un fichier map (*.map)  qui offre une cartographie de la mémoire
* -W-j créé un fichier NoICE (*.noi) (symbol pour BGB)
* -Wm-yC indique que la rom n'est lisible que par une GBC 
* -debug active --debug pour le préprocesseur, -j et -y pour le linker
* -g créé la table des symboles
* -Wi-e ihx_check traite les warnings d'overlap comme erreur
* -Wf--debug
* -Wl-w
* -Wp--Werror warning comme erreur


## Debug

La plus part des fichiers généré dans le makefile servent enfaite a emulicious pour debugger notre programme en C.
Il a besoin de CDB et de map.

Après aoir configurer dans vscode emulicious et c_cpp_properties on créé launch.json sur la base d'emulicious qui lancera notre rom avec les breakpoint set et on configure task.json pour build

F5 pour lancer debug
Ctrl+F5 pour lancer 
Ctrl+Shift+B pour compiler

## Sources

[ZGB](https://github.com/Zal0/ZGB)
[GBDK](https://gbdk-2020.github.io/gbdk-2020/)
[gbdev.io](https://gbdev.io/)
