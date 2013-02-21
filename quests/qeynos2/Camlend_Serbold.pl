sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18711)) { 
		$client->Message(15,"As you get your bearings, a healing energy seems to sweep over you and an almost etheral voice seems to echo in your mind. 'Welcome young paladin of Rodcet. I am Guild Master Camlend Serbold. Read the note in your inventory and hand it to me to begin your training.'");
  }
}

sub EVENT_SAY {
	if($faction <= 3) {
		if($text=~/lord grimrot/i) {
			quest::say("You have heard of Lord Grimrot? He is a shadowknight working with the Bloodsabers. We have word he is trying to build an army of undead. Only a powerful knight can rid the lands of Grimrot. So, did you come here to [defend life]?");
		}
		if($text=~/defend life/i) {
			quest::say("Then go to the Plains of Karana. Somewhere there, Lord Grimrot is hatching his little plan for the Bloodsabers. Bring me his evil scythe and his heart. It is said that upon his death, his soul will be absorbed into this weapon of darkness. Do this and be rewarded");
		}
	}
	if($text=~/hail/i) {
		quest::say("I say, good to meet you, $name !  I am Camlend Serbold.  Some call me Serbold the Great.  I am the leader of the righteous order of paladins which serves the Temple of Life.  Together with the clerics of this temple, we defend the will of the great [Rodcet Nife] and smite all who dare to oppose us.");
	}  
	if($text=~/rodcet nife/i) {
		quest::say("Do you feel your heart beating within your chest?  It is Rodcet Nife, the Prime Healer, whose breath keeps it in perfect rhythm.  If you do not pray to His glory then I assure you, someday when your heart begins to slow, you shall be crying out loud to Rodcet Nife.");
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18711 => 1)) { #Tattered Note
		quest::say("Welcome to the Temple of Life. You have much to learn and we have much work to do. Pain, hurt, disease and death lurk everywhere, our job is seemingly endless, but none is more gratifying. Here is our guild tunic, represent us well. Davloran Girionlis will help you to get started. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available for you.");
		quest::summonitem(13506); #Faded Tunic*
		quest::ding();
		quest::faction(257,10); #Priest of Life
		quest::faction(183,10); #Knight of Thunder
		quest::faction(135,10); #Guards of Qeynos
		quest::faction(21,-15); #Bloodsabers
		quest::faction(9,10); #Antonius Bayle
		quest::exp(100);
	}
	elsif($faction <= 3) {  #Require kindly or greater faction 
		if(plugin::check_handin(\%itemcount, 13324 => 1, 13325 => 1)) { # Pestilence Scythe ID: 13324 # Decaying Heart ID: 13325
			quest::ding();
			quest::summonitem(12238); # Aegis of Life ID: 12238
			quest::say("We thank you for your service. With Lord Grimrot's evil soul trapped in this scythe, all but the truly evil shadowknights would be able to wield it. I would like to present you with this as a token of our appreciation. Your devotion to life is supreme. Go now, and serve life.");
			quest::faction(257,30); #Priest of Life
			quest::faction(183,30); #Knight of Thunder
			quest::faction(135,30); #Guards of Qeynos
			quest::faction(21,-55); #Bloodsabers
			quest::faction(9,30); #Antonius Bayle
			quest::exp(1000);
			quest::givecash(0,0,0,9);
		}
		else {
			quest::say("I do not know what these are for.");
		}
	}
	elsif($itemcount{13324} == 1 && $itemcount{13325} == 1){
		quest::say("You have not yet proven yourself.");
	}
	else {
		# Do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos2 ID:2092 -- Camlend_Serbold

