# Pepe's Got a Brand New Bag
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){
	quest::say("I am on the hunt for something, my friend. Think you can [assist] me?");  
}

if($text=~/assist/i){
	quest::say("I have dealt with the natives, selling them some goods. In return they have told me of a way to make an interesting bag to carry goods in, from the Venemous Stonemites that inhabit Vxed, the Crumbling Caverns. If you could [travel there] and bring me back a venom sac from one of those Venemous Stonemites, I would be happy to see if I could make a bag for you.");  
}

if($text=~/travel there/i){
	quest::say("I await your return.");  
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 55570 => 1)) { # Venomous Stonemite Poison Sac
	quest::say("You found the sac! Now what was it they said to do next? Hmm. I believe they said something about not touching the poison. yes now I remember. We shouldn't touch the poison. I believe you should talk to a friend of mine named Rion. He can be found here in the city.' Simmons scribbles something down on a note. Take this note and the venom sac to him. He should be able to help you.");  
	quest::summonitem(55570); # Venomous Stonemite Poison Sac
	quest::summonitem(55576); # Note to Rion
}

if (plugin::check_handin(\%itemcount, 55574 => 1)) { # Prepared Stonemite Sac
	quest::say("Okay, let's see. Simmons begins to craft the sac into the shape of a small bag. He then dips it into some sort of liquid. 'This will preserve your new bag and keep its shape. Here you go, I hope it assists you on your adventures.");  
	quest::exp(500000);
	quest::summonitem(55575); # Treated Stonemite Bag
}
plugin::return_items(\%itemcount);
}

# END of FILE Zone:abysmal  ID:279263 -- Simmons_Duronn.pl

