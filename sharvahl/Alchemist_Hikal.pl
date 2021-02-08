# items: 10681
sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings friend. If you're in the business for some herbs or shamanistic supplies you've come to the right place. Please take a look around for yourself or if you're looking for something feel free to ask and we may have you need somewhere behind the counter."); 
	}
	if($text=~/sealed medicine/i){
		quest::say("I may have just the thing you are looking for. I recently purchased quite an old and interesting sealed medicine pouch of superb craftsmanship. I will part with it for one-thousand gold pieces.");
	}
}

sub EVENT_ITEM {
	if(plugin::takeGold(1000)) {
		quest::say("Here it is. I am sure you will be quite happy with your purchase, it is quite an interesting old bag it is.");
		quest::ding();
		quest::exp(1000);
		quest::summonitem(10681); # Old Sealed Medicine Pouch
	}
	else {
		quest::say("I have no need for this $name. You can have it back");
		plugin::returnUnusedItems();
	}
}

