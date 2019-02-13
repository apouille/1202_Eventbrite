##  :gem: Project Title - RAILS/THE EVENT PROJECT


/!\ Malheureusement, pas de lien Heroku (trop la galère...) mais ça marche très bien en local ! :)   


## A quoi ça sert ?

 Créer des évènements et inviter des gens !

## Que faire avant de lancer le localhost ?

  * Rituel habituel du git clone   
  * Utilise tes clés API dans un fichier '.env' à la racine du dossier  
  * Petit 'bundle install'  
  * La série : 'rails db:create // rails db:migrate // rails db:seed'  
  * On lance localhost://3000 !   

## Réaliser des tests en local 
  * Tu peux te connecter via le mail de Maldyn bdoyer@yopmail.com avec le mdp : coucoucou   
  * Tu peux modifier/supprimer les deux événements que tu organises  
  * Tu peux aussi participer à l'événement organisé par Brenda!   

## Créer votre utilisateur ! 

```
  moi = User.create(first_name:"MonPrénom", last_name:"MonNomDeFamille", description:"Je suis Moi", email:"dauphineforever@yopmail.com", password:"coucoutoi...")
```

## Créer votre évènement ! 

```
  party = Event.create(title:"Soirée Pilou Poilu", description:"Promis on se couche tôt et on te fait pas chier", price:5, location:"Manor di Petinisme", start_date:"30/05/2019", duration:20, administrator:moi)
```
## Créer votre participation !

```
  admin = Attendance.create(stripe_customer_id:"999999", event: party, attendee: User.all.sample)
```

## :heart: Built by : 

Viviane de Petigny  
Mélanie Nguon  
