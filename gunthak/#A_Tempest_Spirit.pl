##A_Tempest_Spirit.pl
#Icewind
# items: 59041, 59008

#This guy does not need to be hanging around, depopping him after 20 minutes of doing nothing, if there was no turn-in.
#Probably not needed, but I like to be tidy.
sub EVENT_SPAWN{
	quest::settimer("despawn", 1200);	
}
sub EVENT_TIMER{
	if ($timer eq "despawn"){
		quest::stoptimer("despawn");
		quest::depop();
	}
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 59041 => 1)) {#Cracked Zraxthril Amulet
    quest::emote("takes the amulet from you and holds it in its watery hand. The wind around you rises and the sea begins to swell. The spirit melts into a swirling pool at your feet. You gaze down into the pool and notice it begin to shrink in circumference. It continues to shrink and spin until finally there is nothing left but a small blue amulet on the ground. You reach to pick it up and hear an echo from the sea. 'Call us and we will aid you.'");
    quest::summonitem(59008); # Item: Spell: Icewind
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}#Done