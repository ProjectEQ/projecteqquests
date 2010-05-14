#Bremmus_Mopfoot.pl
#Trinkets for Bremmus

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		quest::emote("Greetings friend. To see one brave the dangers of this forsaken island is suprising. You must be a treasure seeker. Tell me, do you seek [treasure]?");
	}
	if ($text=~/treasure/i){
		quest::emote("Oh that's no good! More competition means less treasure for me. Say, tell you what: If you bring me any trinkets you find, I will reward you depending on their condition.");
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 62002 => 1)) {#Worn Trinket
    quest::say("Ah! This is most excellent. I was looking for this piece. Here, take this for your troubles.");#text made up
    quest::exp(517580);
    quest::givecash(0,0,0,14);#14pp
  }
  elsif(plugin::check_handin(\%itemcount, 62001 => 1)) {#Ruined Trinket
    quest::say("Ah! This is most excellent. I was looking for this piece. Here, take this for your troubles.");#text made up
    quest::exp(558790);
    quest::givecash(0,0,0,7);#7pp
  }
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
  }
}#Done