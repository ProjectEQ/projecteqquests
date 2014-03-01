sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Greetings, $name.  Have you come here to test your powers of enchantment?");
	} elsif($text=~/enchantment/i) {
		quest::say("I am most honored to be able to help you. Please choose from one of my instructors. Lelulean or Enderbite.");
	} elsif(($text=~/Enderbite/i) && ($class eq "Enchanter")) {
		quest::say("I will summon him for you then");
		quest::spawn2(71085,0,0,640,1303.2,-766.9,0.4);
		quest::depop_withtimer();
	} elsif(($text=~/lelulean/i) && ($class eq "Enchanter")) {
		quest::say("I will summon him for you then");
		quest::spawn2(71104,0,0,640,1303.2,-766.9,0.4);
		quest::depop_withtimer();
	}
}
#END of FILE Zone:airplane  ID:1249 -- Enchanter_Jolas