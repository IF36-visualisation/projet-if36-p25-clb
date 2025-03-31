# Proposition de dataset - Analyse de la qualité de différents vins et des conditions météorologiques des régions de production

## Introduction

Ce projet vise à explorer et analyser les données concernant la qualité et de l'appréciation de quatre types de vins provenant du monde entier en fonction de leur prix et des conditions météorologiques lors de la croissance des raisins, avec pour objectif la compréhension des facteurs influençant l'évaluation des différent vins. Nous avons trouvé les données sur le site Kaggle et elles incluent des informations détaillées sur le niveau de précipitations, d'ensoleillement, de température minimale, moyenne et maximale.

### Données

#### Source

Les données que nous avons sélectionnées proviennent du site [Kaggle] (https://www.kaggle.com/datasets/abcd334/wine-growth-weather/data?select=White_Weather.csv). Elles proviennent de quatre fichiers CSV distincts : 'Red_Weather', 'Rose_Weather', 'Sparkling_Weather', 'White_Weather'.

#### Description
Nous avons choisi ces datasets car ils présentent une description très complète de chaque vin, ainsi que des conditions météorologiques de la ville de provenance sur l'année précédant la production du vin, soit lors de la pousse du raisin. De plus, ces datasets sont déjà triés selon le type de vin (Rouge, Rosé, Pétillant, Blanc), ce qui facilite l'exploitation des données.

Les datasets présentent les caractéristiques suivantes : 

- **Red_Weather** : Ce dataset présente les données recueillies concernant les vins rouges. 
  - *Contenu* : 8658 éléments avec 72 caractéristiques
- **Rose_Weather** : Ce dataset présente les données recueillies concernant les vins rosés. 
  - *Contenu* : 394 éléments avec 70 caractéristiques
- **Sparkling_Weather** : Ce dataset présente les données recueillies concernant les vins pétillants. 
  - *Contenu* : 279 éléments avec 70 caractéristiques
- **White_Weather** : Ce dataset présente les données recueillies concernant les vins blancs. 
  - *Contenu* : 3759 éléments avec 72 caractéristiques

#### Format des datasets

Chaque dataset est formaté en CSV. Cela facilite l'importation des données, et l'analyse dans divers outils.

#### Catégories et Sous-groupes

Les vins sont séparés selon la catégorie de vin auxquels ils appartiennent (Rouge, Rosé, Pétillant, Blanc) dans des datasets différents. Dans chacun des datasets on remarque deux catégories d'informations : celles concernant le vin, et celle concernant les conditions météorologiques de la ville de provenance sur l'année précédant la production du vin.

#### Caractéristiques des données

Chacun des datasets contiennent les mêmes champs, à l'exception de 'Red_Weather' et 'White_Weather' qui contiennent deux champs en plus, qui sont en fait une recopie de deux autres champs.

| Champ | Type de donnée | Description |
|--------------------------------|-------------|------------------------|
| Name | string | Nom du vin |
| Country | string | Le pays où le vin a été produit |
| Region | string | Région de production |
| Winery | string | Le producteur ou la cave viticole |
| Rating | decimal | L'évaluation ou la notation attribuée au vin（0-5） |
| NumberOfRatings | integer | Le volume de critiques ou de notations reçues |
| Price | decimal | Le coût du vin |
| Year | integer | Année de production du vin |
| city | string  | Ville de production |
| country | string | Pays de production du vin |
| lat | decimal | Latitude de la ville de provenance |
| lng | decimal | Longitude de la ville de provenance |
| Jan_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de janvier de l'année précédant la production du vin |
| Jan_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de janvier de l'année précédant la production du vin |
| Jan_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de janvier de l'année précédant la production du vin |
| Jan_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de janvier de l'année précédant la production du vin |
| Jan_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de janvier de l'année précédant la production du vin |
| Feb_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de février de l'année précédant la production du vin |
| Feb_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de février de l'année précédant la production du vin |
| Feb_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de février de l'année précédant la production du vin |
| Feb_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de février de l'année précédant la production du vin |
| Feb_tsun | decimal | durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de février de l'année précédant la production du vin |
| Mar_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de mars de l'année précédant la production du vin |
| Mar_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de mars de l'année précédant la production du vin |
| Mar_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de mars de l'année précédant la production du vin |
| Mar_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de mars de l'année précédant la production du vin |
| Mar_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de mars de l'année précédant la production du vin |
| Apr_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois d'avril de l'année précédant la production du vin |
| Apr_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois d'avril de l'année précédant la production du vin |
| Apr_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois d'avril de l'année précédant la production du vin |
| Apr_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois d'avril de l'année précédant la production du vin |
| Apr_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois d'avril de l'année précédant la production du vin |
| May_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de mai de l'année précédant la production du vin |
| May_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de mai de l'année précédant la production du vin |
| May_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de mai de l'année précédant la production du vin |
| May_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de mai de l'année précédant la production du vin |
| May_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de mai de l'année précédant la production du vin |
| Jun_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de juin de l'année précédant la production du vin |
| Jun_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de juin de l'année précédant la production du vin |
| Jun_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de juin de l'année précédant la production du vin |
| Jun_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de juin de l'année précédant la production du vin |
| Jun_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de juin de l'année précédant la production du vin |
| Jul_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de juillet de l'année précédant la production du vin |
| Jul_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de juillet de l'année précédant la production du vin |
| Jul_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de juillet de l'année précédant la production du vin |
| Jul_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de juillet de l'année précédant la production du vin |
| Jul_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de juillet de l'année précédant la production du vin |
| Aug_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois d'août de l'année précédant la production du vin |
| Aug_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois d'août de l'année précédant la production du vin |
| Aug_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois d'août de l'année précédant la production du vin |
| Aug_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois d'août de l'année précédant la production du vin |
| Aug_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois d'août de l'année précédant la production du vin |
| Sep_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de septembre de l'année précédant la production du vin |
| Sep_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de septembre de l'année précédant la production du vin |
| Sep_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de septembre de l'année précédant la production du vin |
| Sep_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de septembre de l'année précédant la production du vin |
| Sep_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de septembre de l'année précédant la production du vin |
| Oct_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois d'octobre de l'année précédant la production du vin |
| Oct_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois d'octobre de l'année précédant la production du vin |
| Oct_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois d'octobre de l'année précédant la production du vin |
| Oct_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois d'octobre de l'année précédant la production du vin |
| Oct_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois d'octobre de l'année précédant la production du vin |
| Nov_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de novembre de l'année précédant la production du vin |
| Nov_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de novembre de l'année précédant la production du vin |
| Nov_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de novembre de l'année précédant la production du vin |
| Nov_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de novembre de l'année précédant la production du vin |
| Nov_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de novembre de l'année précédant la production du vin |
| Dec_tavg | decimal | Température moyenne  en °C dans la ville de provenance au cours du mois de décembre de l'année précédant la production du vin |
| Dec_tmin | decimal | Température minimale en °C dans la ville de provenance au cours du mois de décembre de l'année précédant la production du vin |
| Dec_tmax | decimal | Température maximale en °C dans la ville de provenance au cours du mois de décembre de l'année précédant la production du vin |
| Dec_prcp | decimal | Quantité de précipitations en mm, incluant pluie, averses et chutes de neige dans la ville de provenance au cours du mois de décembre de l'année précédant la production du vin |
| Dec_tsun | decimal | Durée d'ensoleillement en secondes, supérieure à 120 W/m², dans la ville de provenance au cours du mois de décembre de l'année précédant la production du vin |



### Plan d’Analyse

L'analyse des types de données et de leur description nous a amené à nous poser diverses questions, que nous détaillons ci-après. Pour certaines question, il pourra être pertinent de rassembler toutes les données dans une seule et même table.

#### Questions

1. Quel est l'impact des variations de température sur l’appréciation vin rouge/blanc/rosé/pétillant ?
- On peut imaginer que ....
- *_Graphique_* :
- - *_Dataset_* : 
- *_Features_* : 

2.  Comment les précipitations influencent elles la qualité du vin rouge/blanc/rosé/pétillant ?
- On peut imaginer que ....
- *_Graphique_* : 
- *_Dataset_* : 
- *_Features_* : 

3.  Comment l'ensoleillement influence-t-il la qualité du vin rouge/blanc/rosé/pétillant ?
- On peut imaginer que ....
- *_Graphique_* : 
- *_Dataset_* : 
- *_Features_* : 

4. Il y a t’il un pays producteur préféré à l’échelle mondiale ? 
- Nous nous attendons à ce que l'Italie soit le pays producteur dont les vins sont les plus appréciés car c'est le plus gros producteur du monde, mais aussi celui qui subit le moins de conditions météorologiques défavorables.
- *_Graphique_* : Choroplet map ou population chart
- *_Dataset_* : Red_Weather.csv, Rose_Weather.csv, Sparkling_Weather.csv, White_Weather.csv
- *_Features_* : country, rating

5. Les vins produits dans des régions avec des conditions météorologiques similaires ont-ils des notes similaires, indépendamment du type de vin ?
- On peut imaginer que les régions disposant des mêmes conditions météorologiques reçoivent les mêmes notes. Le problème que l'on pourrait rencontrer serait celui de l'influence d'autres facteurs comme le prix, ou la réputation de la région.
- *_Graphique_* : Scatter plot mais faire une seule variable des conditions météorologiques
- *_Dataset_* : Red_Weather.csv, Rose_Weather.csv, Sparkling_Weather.csv, White_Weather.csv
- *_Features_* : Region, Rating, Jan_tavg, Jan_tmin, Jan_tmax, Jan_prcp, Jan_tsun, Feb_tavg, Feb_tmin, Feb_tmax, Feb_prcp, Feb_tsun, Mar_tavg, Mar_tmin, Mar_tmax, Mar_prcp, Mar_tsun, Apr_tavg, Apr_tmin, Apr_tmax, Apr_prcp, Apr_tsun, May_tavg, May_tmin, May_tmax, May_prcp, May_tsun, Jun_tavg, Jun_tmin, Jun_tmax, Jun_prcp, Jun_tsun, Jul_tavg, Jul_tmin, Jul_tmax, Jul_prcp, Jul_tsun, Aug_tavg, Aug_tmin, Aug_tmax, Aug_prcp, Aug_tsun, Sep_tavg, Sep_tmin, Sep_tmax, Sep_prcp, Sep_tsun, Oct_tavg, Oct_tmin, Oct_tmax, Oct_prcp, Oct_tsun, Nov_tavg, Nov_tmin, Nov_tmax, Nov_prcp, Nov_tsun, Dec_tavg, Dec_tmin, Dec_tmax, Dec_prc, Dec_tsun

6. Le climat est-il le facteur principal de l'appréciation du vin ? 
- On peut imaginer que les régions les plus propices à la croissance adéquate des grains de raisins font les vins les plus appréciés. Le problème pourrait être que la renommée du vin ou son prix entrent en compte inconsciemment dans la note du vin (de manière favorable ou défavorable).
- *_Graphique_* : Bar Chart 
- *_Dataset_* : Red_Weather.csv, Rose_Weather.csv, Sparkling_Weather.csv, White_Weather.csv
- *_Features_* : Region, Rating, Year, Price, Winery, Jan_tavg, Feb_tavg, Mar_tavg, Apr_tavg, May_tavg, Jun_tavg, Jul_tavg, Aug_tavg, Sep_tavg, Oct_tavg, Nov_tavg, Dec_tavg

7. Y a-t-il des régions productrices davantage impactées par le changement climatique ? Si oui, cela apparaît-il dans la notation du vin ?
- On peut imaginer que ....
- *_Graphique_* : 
- *_Dataset_* : 
- *_Features_* : 

8. Y a-t-il une corrélation entre les conditions météorologiques et les préférences des consommateurs pour certains types de vin ?
- On peut imaginer que ....
- *_Graphique_* : 
- *_Dataset_* : 
- *_Features_* : 

9. Les notes attribuées au vin sont-elles cohérentes vis à vis des conditions météorologiques ou il y a t’il d’autres facteurs qui entrent en compte ? ( prix, popularité de la région de production, pays de provenance, réputé du vin…)
- On peut imaginer que ....
- *_Graphique_* : 
- *_Dataset_* : 
- *_Features_* : 
   
10. Existe-t-il une relation entre la variabilité interannuelle des conditions météorologiques et la constance de la qualité des vins produits dans une région donnée ?
- Nous nous attendons à observer que dans les régions où le climat varie peu d’une année à l’autre, la qualité du vin (mesurée par la note moyenne) est plus constante. Cela impliquerait que la stabilité climatique joue un rôle dans la régularité de la production vinicole. Le défi ici est de quantifier la variabilité climatique (écart-type sur plusieurs années) et de la corréler avec la variance des notes par région.
- *_Graphique_* : Boxplot des notes par région avec écart-type climatique en couleur ou taille.
- *_Dataset_* : Red_Weather.csv, Rose_Weather.csv, Sparkling_Weather.csv, White_Weather.csv
- *_Features_* :  Region, Rating, Year, Jan_tavg à Dec_tavg (ou variables climatiques globales agrégées par an)

11. Y a-t-il réellement des "bonnes années" où toutes les conditions météorologiques sont idéales pour tous les types de vin ? Les vignes cultivées dans des conditions optimales produisent elles des vins plus appréciés lors des notations ?
- On s’attend à ce que certaines années se démarquent avec des conditions climatiques idéales (températures moyennes modérées, peu de précipitations pendant la floraison et la récolte, bon ensoleillement), et qu’elles soient associées à des notes plus élevées. On pourrait observer un pic global de notes dans ces “bonnes années”. Il faudra agréger les données météo sur l’année, les normaliser, puis les relier aux moyennes de notes par millésime.
- *_Graphique_* : Courbe des notes moyennes par année avec superposition d’un indice climatique "optimal"
- *_Dataset_* : Red_Weather.csv, Rose_Weather.csv, Sparkling_Weather.csv, White_Weather.csv
- *_Features_* : Year, Rating, moyenne climat annuel (température moyenne, ensoleillement, précipitations)

12. Peut-on prédire la popularité future d'un vin en fonction des conditions météorologiques de l'année de production ?
- Nous pensons qu’il est possible de prédire une note approximative à partir des données climatiques de l’année de production. On pourrait utiliser un modèle de régression (linéaire ou non-linéaire) entraîné sur les températures, précipitations et ensoleillement de chaque mois, pour prédire la note. Un bon R² indiquerait que le climat est un prédicteur fiable de la qualité du vin.
- *_Graphique_* : Courbe réelle vs prédite (scatter plot) + métrique de régression (R², MAE)
- *_Dataset_* : Red_Weather.csv, Rose_Weather.csv, Sparkling_Weather.csv, White_Weather.csv
- *_Features_* : Rating (à prédire), Jan à Dec (tavg, tmin, tmax, prcp, tsun)
