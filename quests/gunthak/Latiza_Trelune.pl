#Latiza_Trelune.pl
#Part of Leviathan Eyes

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		quest::emote("eyes you coolly, taking particular interest in the shining pieces of your array. 'Yes, $name? Is there something in particular that you were looking for?");
		quest::emote("chuckles. 'Do not be taken aback that I know your name. People of my kind have always been a bit more observant than yours.'");
	}
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 54005 => 1)) {#Blue Lotus Petal
    quest::emote("looks delighted and tucks the petal into a lock of her hair. 'How lovely! Here then, a scale you shall have. Do not be surprised if nothing comes of it, but I do thank you for the gift. Best of luck to you, dear mortal.'");
    quest::summonitem(54004);#Shiny Mermaid Scale
  }
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}#Done