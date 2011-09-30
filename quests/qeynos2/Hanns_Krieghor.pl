#Hanns accepts Stanos' head for yet another alternate ending to the rogue epic quest (the other being to give Stanos' head to General V`ghera and receive the high elf illusion mask).

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
  if (plugin::check_handin(\%itemcount, 28058 => 1)) {
    quest::say("Well done, $name."); #Text made up
    quest::summonitem(7501);
    quest::exp(500000);
    quest::ding();
    quest::faction(33,20);
  }
  else{
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}

#Submitted by Jim Mills