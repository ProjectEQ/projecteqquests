#Ennixy_Frennor.pl
#Part of Innoruuk Regent

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Unless you have something to tell me about yourself that I could possibly be interested in, be gone!");
	}
	if ($text=~/hate be my guide/i){
		quest::say("Very well.  I know what you seek.  Find Crusader Swiftmoon and slay him!");#text made up
		#Taking a bit of a guess here on the spawn location.  It might need to be tweaked.
		quest::unique_spawn(56150, 0, 0, -836, 1385, -110,0);
}
  if($text=~/wormwood/i) {
    quest::say("Wormwood? Why do you want that? OH nevermind. Here! Take it and leave me alone! You're wasting my valuable time!");
    quest::summonitem(10265);
  }
}

sub EVENT_ITEM{
	quest::say("I don't need this."); #text made up
	plugin::return_items(\%itemcount);
	return 1;
}#END of FILE Zone:steamfont  ID:56099 -- Ennixy_Frennor 

