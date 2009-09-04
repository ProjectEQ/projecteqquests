#Lokar_To-Biath.pl
#Red Wine (Part of Tome of Ages)

sub EVENT_SAY { 
	if($text=~/scribe of Dal/i){
		quest::say("The Scribes of Dal? All of them are long since [dead].. or at least most would say that.");
	}
	if($text=~/dead/i){
		quest::say("Perhaps, perhaps not. I cannot remember, but perhaps Innoruuk would help me remember should you tithe him a bottle of red wine from the Blind Fish.");
	}
	if($text=~/vow/i){
		quest::say("Break the vow? She might. Were you to tithe 70 gold to your god, Innoruuk, he might aid you.");
	}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 13030 => 1)){#Red Wine
		quest::say("Ah, yes, let me pray to our god.. Yes, Innoruuk has given me wisdom. A Scribe of Dal still exists, disguised as a barkeep in the Blind Fish. This information will not help you though, for she has sworn a [vow] of silence and will not speak of the Dal.");
		quest::faction(87, 10);#Dreadguard Inner
		quest::faction(88, 10);#Dreadguard Outer
		quest::faction(69, 10);#Dark Bargainers
	}
	elsif(($copper == 7000) || ($silver == 700) || ($gold == 70) || ($platinum == 7)){#7pp worth of coins
		quest::say("Take this note to the Scribe of Dal, and perhaps she will break her vow.");
		quest::summonitem(18200);#a note (renounce the D'al, Text: TomeOfAges1)
		quest::faction(87, 10);#Dreadguard Inner
		quest::faction(88, 10);#Dreadguard Outer
		quest::faction(69, 10);#Dark Bargainers
	}
	else {
  	quest::say("I don't need this.");#text made up
  	plugin::return_items(\%itemcount);
	}
}

sub EVENT_DEATH {
     quest::say("The death of a Dark Bargainer never goes unnoticed!");
}

#END of FILE Zone:neriakc  ID:42037 -- Lokar_To`Biath	