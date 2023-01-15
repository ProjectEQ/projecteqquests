# items: 13394
sub EVENT_SAY { 
	if ($text=~/hail/i){
		quest::say("Greetings, disciple $name. Feel free to inspect my wares. I am here to serve all necromancers of the Dead. I can also enchant a [Ring of the Dead] if you have one.");
	}
	elsif ($text=~/ring of the dead/i) {
		#:: Match if faction is Kindly or better
		if ($faction <= 3) {
			quest::say("The ring of the Dead is the mark of loyal members of the his house. One can use it to bind his soul to any point, but only once and then the enchantment is gone. It is my duty to enchant the ring of the Dead once it is drained of all power, but only for a loyal member. I believe you to be loyal. I require the drained ring and ten gold coins.");
		}
		else {
			quest::say("When you learn to serve The Dead, then I will find the time to speak of such things.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 13394 - Ring of the Dead and 10 gold pieces
	if (plugin::takeItemsCoin(0, 0, 10, 0, 13394 => 1)) {
		#:: Match if faction is Kindly or better
		if ($faction <=3) {
			quest::say("Here you are, disciple. I have enchanted your ring once more.");
			#:: Ding!
			quest::ding();
			#:: Give a 13394 - Ring of the Dead with 1 charge
			quest::summonitem(13394, 1); # Item: Ring of the Dead
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

#END of FILE Zone:neriakc  ID:42063 -- Xantis_Ixtax
