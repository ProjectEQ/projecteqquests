sub EVENT_SAY { 
	if(($text=~/hail/i) && ($faction < 6)) { 
		quest::say("Just another boring day waiting for supplies.  I wonder when they will arrive.");
	} 
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 25106 => 1)){ # Handin: Bekerak's New Spear 
        quest::say("Well, well, I see Wenglawks finally got around to sending me my new spear. I hope it's not as shoddy as the last one. Your payment? Bahaha, did Wenglawks not tell you? Payment was to be a giant icewurm tooth carved into an amulet. Come now, little one. I will find an ice wurm for us to slay together. Then you can pull one of its teeth out for me and I will fashion the talisman for that greedy merchant.");
		quest::spawn2(118164,0,0,-2776,-3011,255.5,65.5); # Spawn: #an_angry_shardwurm (x:-2776 y:-3011 z:255.5 heading:65.5)
	}
	if(plugin::check_handin(\%itemcount, 25191 => 1)){ # Handin: Giant Shard Wurm Tooth
        quest::emote("pulls out a large knife and begins to carve at the tooth. After a few minutes he pulls out a length of rope and fashions it into a very large necklace. 'Here is his payment. Tell him the spear is fine, and that I might reconsider his last offer to me. He will know what I mean.'");
        quest::summonitem(25130); # Summon: Giant Icewurm Talisman
	}
	if(plugin::check_handin(\%itemcount, 25266 =>1)) { # Giant Sack of Supplies
		quest::say("Supplies from Svekk?  Where are the rest of them little one!  There must be more, we are here pushing the Coldain back into their hole in the wall and Svekk sends a $race to deliver a small portion of supplies.  Take this note back to that fool.  Leave quickly before I take my rage out upon you.");
		quest::ding();
		quest::faction(189,10); # Kromzek
		quest::faction(188,10); # Kromrif
		quest::faction(49,-30); # Coldain
		quest::faction(42,-30); # Claws of Veeshan
		quest::exp(250);
		quest::summonitem(25267); # Bekerak's Letter to Svekk
	}
	if(plugin::check_handin(\%itemcount, 25269 =>1)) { # Large Supply Sack for Bekerak
		quest::say("I am in your debt, $race.  These supplies will help our effort to destroy the Coldain.  I wish I had more to give than what I do.'  Bekerak pulls a strange looking totem on a string from one of his pockets and hands it to you.  'May Lord Rallos smile upon you, $name.'");
		quest::ding();
		quest::faction(189,10); # Kromzek
		quest::faction(188,10); # Kromrif
		quest::faction(49,-30); # Coldain
		quest::faction(42,-30); # Claws of Veeshan
		quest::exp(250);
		quest::summonitem(25268); # Kromrif Battle Totem
	}
	plugin::return_items(\%itemcount);	
}


#EOF 