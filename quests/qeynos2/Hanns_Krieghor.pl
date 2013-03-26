sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18708)) { 
		$client->Message(15,"As your eyes adjust to the dark interior of the room, a sly looking man turns towards you. 'Shh! Not too loudly. I am Hanns if you are here to start your training, read the note in your inventory and hand it to me.'");
  }
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::say("Yes, I just got some new information from Prak this evening. He says they found out the spy is working for some bandit in the Karanas named Rujahn Tahslek. You used to work out there. do you recognize the name?");
		quest::signalwith(2085,2,1);
	}
	if($signal == 2) {
		quest::say("Hmmff.. Anyway, send someone to Prak. I want this job done quickly. Let's show these pathetic bandits that they've been nosing around in the wrong places.");
		quest::signalwith(2085,3, 1);
	}
	if($signal == 3) {
		quest::say("Lomarc is already back. He sent word that the guards are on to him, so he's laying low for a bit. He also said the cost for delivery just went up, because he had to pay off the owner of the Mermaid's Lure.");
		quest::signalwith(2033,1,1);
	}
	if($signal == 4) {
		quest::say("Finally, the rat comes out of his hole! Send some men, no no, go yourself, and track him down. Then kill him. I don't care who sees you, or who gets in your way. Finish the job. And bring me whatever you find on his carcass. I'm sure he took some valuables from us when he escaped. And don't worry about Malka, she will keep until you finish Stanos, then she is yours. Shame to waste such talent, but you don't steal from the Circle and live.");
		quest::signalwith(2033,2, 1);
	}
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("My name is Hanns..  Do as I say. and we shall get along just fine.");
	}
	if($text=~/carson has a mole in the highpass/i) {
		quest::say("Arrgg, that Carson can't control anything. Sometimes he's practically useless. Go tell Zannsin that [I want him to send some of his men to Prak in Highpass], to help Carson get back on track.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18708 => 1)) { #Napkin From Crow's
		quest::say("Lucky thing you weren't followed. or you'd be breathing through holes in your back right now. Go find Knargon, maybe you can help run the next [shipment]. Remember, we keep our business quiet, so watch yourself, sewer crawler.");
		quest::summonitem(13501); #Second Hand Tunic*
		quest::ding();
		quest::faction(33,10); #Circle of Unseen Hands
		quest::faction(217,-15); #Merchants of Qeynos
		quest::faction(53,10); #Corrupt Qeynos Guards
		quest::faction(135,-15); #Guards of Qeynos
		quest::faction(164,10); #Kane Bayle
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 28058 => 1)) {
		quest::say("Well done, $name."); #Text made up
		quest::summonitem(7501);
		quest::faction(33,20);
		quest::exp(500000);
		quest::ding();
	}
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
}

#Submitted by Jim Mills