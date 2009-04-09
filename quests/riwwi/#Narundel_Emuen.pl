# Rarundel's Memory

# Created by Gonner

sub EVENT_SAY {
if($text=~/hail/i){
	quest::say("I have nothing to say to the likes of you. They took her away from me and now I will never get her back. Oh why did they have to take my daughter from me?' Narundel bursts into tears. 'Rarundel, I am so sorry!");	
	}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 67410 => 1)) { # Rarundel's Sealed Memory Box
	quest::say("The pain of losing my daughter has hurt me deeply. While my disapproval of Rasnil made her unhappy, I know that no matter what I decide she will understand and accept it. Please take this to her. Thank you for granting me just a few moments to think about how things used to be.");
	quest::summonitem(67411); # Narundel's Decision
	}
}

#END of FILE zone:Riwwi ID:282056 -- #Narundel_Emuen.pl

