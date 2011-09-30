sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 1) {
    quest::say("Belious, I'm working on this new tune I learned on my last trip to Kelethin. It's about Tunare. If you have a free ear, would you care to take a listen?");
	quest::signal(1125,1);
	}
	if($wp == 2) {
    quest::say("Ahem. Tunare and the Pact, sung by Joffrey Clay.");
	plugin::DoAnim(dance);
	quest::say("La da di, la di da.. la da di. la di da..");
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, friend. My name is Joffrey. I'm trying to learn to play the [flute].  I'm also working on a new song I learned while I was visiting [Kelethin].");
}
if($text=~/what kelethin/i){
quest::say("I just got back from a trip to Faydwer. I was over there studying the lore of Tunare, in the beautiful elven city of Kelethin. I highly recommend visiting there as soon as you get a chance."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1131 -- Joffrey_Clay 
