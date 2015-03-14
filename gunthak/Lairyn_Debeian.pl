#zone: gunthak NPC: Lairyn_Debeian (224189)
#Started by Angelox, finished by Kilelen
#Frozen Harpoon

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		if ($class eq "Wizard") {
			quest::emote("peers up from his journal and smiles at you warmly, 'Greetings, friend. I was so involved in my research that I did not hear you approaching.' He closes the leather-bound tome and pats it with one slender hand. 'Please forgive my lack of courtesy. I am Lairyn from the order of the Crimson Hands, and this little book here is my life's work. I am currently unraveling the secret of a [new power] that has emerged on Broken Skull Rock.'");
		}
		else{
			quest::emote("stares at you directly in the eyes. 'Greetings, $name.  I suppose you're here like everyone else in search of fame and fortune.  Good luck to you, and good day.  I have many things to attend to.'");
		}
 	}
 	if ($text=~/new power/i){
 		quest::say("The strange beasts known as Luggalds that reside on Broken Skull Rock have an amazing power over the dark waters of the deep. They are able to conjure it up in the form of an immense spear of ice. I have seen them do so with my own eyes, though I was watching from afar, of course. I would not dare venture close enough to anger the foul beasts. Their grasp of this magic is simply breathtaking, and from my observations alone, I am very close to unlocking their methods. Unfortunately, I have run into an obstacle, as I cannot complete my research without something more tangible. If only I were brave enough to get closer, or foolish enough. As you can see, I am more intellectual than adventurer.");
 		quest::emote("chuckles and his spectacles slip a little further down his nose.");
 	}
 	if ($text=~/brave enough/i){
 		quest::emote("gasps in apparent surprise, 'What? Are you certain you wish to put yourself in such a perilous position? Well I certainly can't turn down good help, so I'll tell you what I know. The Luggalds often utilize their spells against creatures in the waters of the harbor. Whether this is for practice, or for sport, or to ward off attackers I am not sure. I would suggest investigating the harbor for further evidence. Take this bag and bring me whatever you can find.'");
 		quest::summonitem(17194);#Small Pouch, this is not the proper container, but is the best I can do -Kilelen
 	} 	
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 58009 => 1)) {#Pouch of Dark Ice
  	#All this text is made up
    quest::emote("looks at you in amazement as you hand the pouch of dark ice him.");
    quest::say("Well then, let's have a look then.  Yes, yes, I see now.");
    quest::emote("scribles on a piece of parchment and thrusts it at you.");
    quest::say("This should serve you well");
    #End of made up text -Kilelen
    quest::summonitem(59021);#Spell: Frozen Harpoon
  }	
  plugin::return_items(\%itemcount);
}#Done