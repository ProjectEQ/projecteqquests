#Bolcen_Tendag.pl
#Willamina's Needles


sub EVENT_SAY {
	if($text=~/Hail/i) {
    quest::emote("coughs and says. 'Hello traveler.  Allow me to introduce myself. I am Bolcen. If you are looking for my master Xelrin. you may find him upstairs.  Careful should you stand too close to me however. I have become ill.'  He coughs again.");
  }
  if($text=~/needles/i) {
    quest::say("I feel just terrible that I haven't been to see Willamina yet. Due to my illness I barely have the energy to stand. If you could aid me in some way, I would greatly appreciate it. Mirao Frostpouch might have an elixir that would help me feel better. Please seek him out and ask for it.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28091 => 1)) {#Curative Potion
    quest::say("Oh thank you so much.' He drinks from the bottle, then reaches in his pocket and produces a set of needles. 'I believe this is what Willamina is in need of. Please take these to her and give her my best.");
    quest::summonitem(28092);#New Sewing Needles
    quest::exp(250);
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202036 -- Bolcen_Tendag 

