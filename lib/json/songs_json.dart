import 'package:flutter/material.dart';

const List song_type_1 = [
  "Music",
  "Rock",
  "Soul",
  "Classic",
  "Pop",
  "Jazz",
  "Rap",
  "Hip-hop",
  "Punk",
  "Métal",
  "R&B",
  "Folk",
];
const List song_type_2 = [
  "Podcasts",
  "Fait pour toi",
  "Graphiques",
  "Nouvelles versions",
  "Découvrir",
  "Concerts",
];
const List artists = [
  {
    "img": "assets/images/06.jpg",
    "title": "Maitre Gims",
    "description": "Feel good with this positively timeless playlist!",
    "song_count": "100 songs",
    "date": "about 19 hr",
    "songs": [
      {"title": "Intro", "song_url": "songs/1 Intro.mp3", "duration": "1:10"},
      {"title": "Bella", "song_url": "songs/Maître Gims - Bella.mp3", "duration": "3:37"},
      {"title": "J'me tire", "song_url": "songs/Maitre Gims - J'me tire.mp3", "duration": "4:12"},
      {"title": "Hola Senorita", "song_url": "songs/Maitre Gims & Maluma - Hola Senorita.mp3", "duration": "3:26"},
      {"title": "Fuegolando", "song_url": "songs/4 Fuegolando.mp3", "duration": "3:01"},
    ]
  },
  {
    "img": "assets/images/01.jpg",
    "title": "Ninho",
    "description": "Relax and indulge with beautiful piano pieces",
    "song_count": "324 songs",
    "date": "about 14 hr",
    "songs": [
      {"title": "aloledji", "song_url": "songs/aloledji.mp3", "duration": "3:44"},
      {"title": "AZONTO", "song_url": "songs/AZONTO~1.MP3", "duration": "3:50"},
      {"title": "ADEKUN", "song_url": "songs/ADEKUN.mp3", "duration": "3:55"},
      {"title": "Mutant one beat", "song_url": "songs/Mutant one beat.mp3", "duration": "2:55"},
    ]
  },
  {
    "img": "assets/images/02.jpg",
    "title": "Dadju",
    "description": "Beats to relax, study and focus.",
    "song_count": "599 songs",
    "date": "about 21 hr",
    "songs": [
      {"title": "Complique", "song_url": "songs/Dadju - Complique.mp3", "duration": "3:33"},
      {"title": "Reine", "song_url": "songs/Dadju - Reine.mp3", "duration": "3:19"},
      {"title": "Confessions", "song_url": "songs/1-Confessions.mp3", "duration": "4:13"},
      {"title": "Bobo-au-cœur", "song_url": "songs/5-Bobo-au-coeur.mp3", "duration": "3:41"},
      {"title": "Ma-vie", "song_url": "songs/9-Ma-vie.mp3", "duration": "3:28"},
    ]
  },
  {
    "img": "assets/images/05.jpg",
    "title": "Celine Dion",
    "description": "Keep calm and focus with ambient and post-rock music.",
    "song_count": "195 songs",
    "date": "about 10 hr",
    "songs": [
      {"title": "Just walk away", "song_url": "songs/Celine Dion - Just walk away.mp3", "duration": "4:59"},
      {"title": "My heart", "song_url": "songs/Celine Dion - My heart.mp3", "duration": "5:12"},
      {"title": "Adoration-Saint_Esprit,viens", "song_url": "songs/Adoration-Saint_Esprit,viens.mp3", "duration": "3:09"},
      {"title": "INDOU", "song_url": "songs/INDOU.mp3", "duration": "3:48"},
      {"title": "Ihant d'amour ", "song_url": "songs/Ihant d'amour .mp3", "duration": "4:56"},
      {"title": "Almok le mariage", "song_url": "songs/Almok le mariage.mp3", "duration": "3:39"},
    ]
  },
  {
    "img": "assets/images/03.jpg",
    "title": "Niska",
    "description": "The perfect study beats, twenty four seven.",
    "song_count": "317 songs",
    "date": "about 11 hr",
    "songs": [
      {"title": "Reseaux", "song_url": "songs/Reseaux.mp3", "duration": "3:16"},
      {"title": "Sale", "song_url": "songs/Sale.mp3", "duration": "2:50"},
      {"title": "Commando", "song_url": "songs/niska_commando_clip_officiel_aac_46321.m4a", "duration": "3:24"},
      {"title": "Batiment", "song_url": "songs/niska_batiment_clip_officiel_aac_46187.m4a", "duration": "3:47"},
      {"title": "Medicament", "song_url": "songs/niska_medicament_ft._booba_clip_officiel_aac_46259.m4a", "duration": "3:28"},
      {"title": "Diplo-Boom-Bye-Bye-feat", "song_url": "songs/Diplo-Boom-Bye-Bye-feat.-Niska.mp3", "duration": "3:47"},
      {"title": "Tuba-Life", "song_url": "songs/Tuba-Life.mp3", "duration": "3:14"},
    ]
  },
  {
    "img": "assets/images/04.jpg",
    "title": "Lefa",
    "description": "The perfect study beats, twenty four seven.",
    "song_count": "317 songs",
    "date": "about 11 hr",
    "songs": [
      {"title": "Visionnaire", "song_url": "songs/Lefa - Visionnaire.mp3", "duration": "3:11"},
      {"title": "Bi Chwiya [OKLM Radio]", "song_url": "songs/Lefa - Bi Chwiya [OKLM Radio].mp3", "duration": "3:22"},
      {"title": "Self", "song_url": "songs/Celine Dion - Just walk away.mp3", "duration": "4:59"},
      {"title": "Qalo", "song_url": "songs/Celine Dion - My heart.mp3", "duration": "4:35"},
      {"title": "Self", "song_url": "songs/Celine Dion - Just walk away.mp3", "duration": "5:44"},
    ]
  },
];

const List genres = [
  {
    "img": "assets/images/rock.jpg",
    "title": "Rock",
    "genres": [
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "8:11"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
    ]
  },
  {
    "img": "assets/images/pop.jpg",
    "title": "Pop",
    "genres": [
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "8:11"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "8:11"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
    ]
  },
  {
    "img": "assets/images/rap.jpg",
    "title": "Rap",
    "genres": [
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "8:11"},
    ]
  },
  {
    "img": "assets/images/jazz.jpg",
    "title": "Jazz",
    "genres": [
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "8:11"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
    ]
  },
  {
    "img": "assets/images/soul.jpg",
    "title": "Soul",
    "genres": [
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
    ]
  },
  {
    "img": "assets/images/hiphop.jpg",
    "title": "Hip-hop",
    "genres": [
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "8:11"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "8:11"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "8:11"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
    ]
  },
  {
    "img": "assets/images/classic.jpg",
    "title": "Classic",
    "genres": [
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde", "duration": "5:11"},
      {"image": "assets/images/04.jpg", "title": "Peur du monde 2", "duration": "8:11"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/01.jpg", "title": "Basique", "duration": "1:58"},
      {"image": "assets/images/02.jpg", "title": "Imagination", "duration": "4:01"},
      {"image": "assets/images/06.jpg", "title": "Bella", "duration": "5:25"},
      {"image": "assets/images/05.jpg", "title": "Au clair de la lune", "duration": "3:40"},
      {"image": "assets/images/03.jpg", "title": "Oh Socrate !", "duration": "1:07"},
    ]
  },
];

const List sliders = [
  {
    "img": "assets/images/1.jpg",
    "text": "Concert Kamikaze - Ce Samedi",
  },
  {
    "img": "assets/images/2.jpg",
    "text": "DJ Arafat VS Cool Black",
  },
  {
    "img": "assets/images/3.jpg",
    "text": "Dames au sommet du monde - Tout les Vendredis",
  },
  {
    "img": "assets/images/4.jpg",
    "text": "Concert chaud Jazz & Pop - Mardi prochain",
  },
  {
    "img": "assets/images/5.jpg",
    "text": "Crie de Joie - Concert VIP le 24 Décembre",
  },
];

const List myplaylist = [
  {
    "name": "Mes favoris",
    "chansons": "05",
    "songs": [
      {"title": "Mutant one beat", "song_url": "songs/Mutant one beat.mp3", "duration": "2:55"},
      {"title": "My heart", "song_url": "songs/Celine Dion - My heart.mp3", "duration": "5:12"},
      {"title": "ADEKUN", "song_url": "songs/ADEKUN.mp3", "duration": "3:55"},
      {"title": "Sale", "song_url": "songs/Sale.mp3", "duration": "2:50"},
      {"title": "Commando", "song_url": "songs/niska_commando_clip_officiel_aac_46321.m4a", "duration": "3:24"},
    ]
  },
  {
    "name": "Mes Bad Sons",
    "chansons": "04",
    "songs": [
      {"title": "Bobo-au-cœur", "song_url": "songs/5-Bobo-au-cœur.mp3", "duration": "3:41"},
      {"title": "Ma-vie", "song_url": "songs/9-Ma-vie.mp3", "duration": "3:28"},
      {"title": "J'me tire", "song_url": "songs/Maitre Gims - J'me tire.mp3", "duration": "4:12"},
      {"title": "Hola Senorita", "song_url": "songs/Maitre Gims & Maluma - Hola Senorita.mp3", "duration": "3:26"},
    ]
  },
  {
    "name": "Dingueries",
    "chansons": "27",
    "songs": [
      {"title": "Ihant d'amour ", "song_url": "songs/Ihant d'amour .mp3", "duration": "4:56"},
      {"title": "Almok le mariage", "song_url": "songs/Almok le mariage.mp3", "duration": "3:39"},
      {"title": "Just walk away", "song_url": "songs/Celine Dion - Just walk away.mp3", "duration": "4:59"},
      {"title": "My heart", "song_url": "songs/Celine Dion - My heart.mp3", "duration": "5:12"},
      {"title": "Adoration-Saint_Esprit,viens", "song_url": "songs/Adoration-Saint_Esprit,viens.mp3", "duration": "3:09"},
      {"title": "INDOU", "song_url": "songs/INDOU.mp3", "duration": "3:48"},
      {"title": "aloledji", "song_url": "songs/aloledji.mp3", "duration": "3:44"},
      {"title": "AZONTO", "song_url": "songs/AZONTO~1.MP3", "duration": "3:50"},
      {"title": "Complique", "song_url": "songs/Dadju - Complique.mp3", "duration": "3:33"},
      {"title": "Reine", "song_url": "songs/Dadju - Reine.mp3", "duration": "3:19"},
      {"title": "Confessions", "song_url": "songs/1-Confessions.mp3", "duration": "4:13"},
      {"title": "Bobo-au-cœur", "song_url": "songs/5-Bobo-au-cœur.mp3", "duration": "3:41"},
      {"title": "Ma-vie", "song_url": "songs/9-Ma-vie.mp3", "duration": "3:28"},
      {"title": "J'me tire", "song_url": "songs/Maitre Gims - J'me tire.mp3", "duration": "4:12"},
      {"title": "Hola Senorita", "song_url": "songs/Maitre Gims & Maluma - Hola Senorita.mp3", "duration": "3:26"},
      {"title": "aloledji", "song_url": "songs/aloledji.mp3", "duration": "3:44"},
      {"title": "AZONTO", "song_url": "songs/AZONTO~1.MP3", "duration": "3:50"},
      {"title": "Complique", "song_url": "songs/Dadju - Complique.mp3", "duration": "3:33"},
      {"title": "Reine", "song_url": "songs/Dadju - Reine.mp3", "duration": "3:19"},
      {"title": "Confessions", "song_url": "songs/1-Confessions.mp3", "duration": "4:13"},
      {"title": "Bobo-au-cœur", "song_url": "songs/5-Bobo-au-cœur.mp3", "duration": "3:41"},
      {"title": "Ma-vie", "song_url": "songs/9-Ma-vie.mp3", "duration": "3:28"},
      {"title": "J'me tire", "song_url": "songs/Maitre Gims - J'me tire.mp3", "duration": "4:12"},
      {"title": "Hola Senorita", "song_url": "songs/Maitre Gims & Maluma - Hola Senorita.mp3", "duration": "3:26"},
      {"title": "Corazon", "song_url": "songs/30 Corazon.mp3", "duration": "3:46"},
      {"title": "Bonita", "song_url": "songs/17 Bonita.mp3", "duration": "3:33"},
      {"title": "Le Pire", "song_url": "songs/18 Le pire.mp3", "duration": "3:47"},
    ]
  },
];