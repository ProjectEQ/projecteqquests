# The Velium Focus
# Created by Gonner


sub EVENT_SAY {
if($text=~/hail/i) {
	quest::say("Busy, busy, busy. Must get all these tools sharpened before the miners get cranky.");
	}

if($text=~/stonetooth sent me/i) {
	quest::say("You spoke with old Stonetooth? Eeegads man! No one talks to 'im. Legend says he spent so much time down there that he eats nothin' but rocks now and drinks melted velium. Well I guess I should sharpen his axe, but I'll need some velium ore to repair it some. Bring me a chunk o' Velium Ore along with his axe and I'll get to work.");
	}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 1690 => 1,22569 => 1)) { # Small piece of Velium, Norman's Axe V1 5 damage
	quest::say("Excellent! I'll get ta work now. Hakon whistles an unfamiliar tune as he repairs and sharpens the pick axe. Here ye are, $name. Watch that old Stonetooth, he's a few steins short of a keg, if ye know what I mean.");
	quest::faction(49,5); # Coldain
	quest::faction(67,5); # Dain Frostreaver IV
	quest::faction(189,-10); # Kromzek
	quest::faction(188,-10); # Kromrif
	quest::exp(1000);
	quest::summonitem(1691); # Norman's Axe V2 6 Damage
	}

}

#END of FILE zone:thurgadina ID:115134 -- Hakon_Brightsteel.pl

