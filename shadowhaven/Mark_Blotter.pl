sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Hail friend! Feel free to browse my selection of scrolls and scroll accessories but be careful when handling them, some of them are quite old and the parchment has seen better days.");
	}
	if($text=~/golden seal tube/i){
		quest::say("Ah hah! You are in luck. I just received a sealed golden scroll tube the other day that I think you will find quite acceptable. It seems to be quite old and the craftsmanship is superb! I will part with it for no less than one-thousand gold pieces.");
	}
}

sub EVENT_ITEM {
	if(plugin::takeGold(1000)) {
		quest::say("Here it is, I am sure you will be very satisfied with this purchase!");
		quest::ding();
		quest::exp(1000);
		quest::summonitem(10671); # Sealed Golden Scroll Tube
	}
	else {
		quest::say("I have no need for this $name. You can have it back");
		plugin::returnUnusedItems();
	}
}