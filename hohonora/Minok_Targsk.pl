#Minok_Targsk.pl
#Found the missing pieces in the db, no reason for this not to be finished afaik. -Kilelen
sub EVENT_SAY {
   if($text=~/Hail/i)   {
	quest::say("Who defines the lines of being right or wrong? When a good man is under pressure he sometimes makes bad choices. Should this man not be forgiven or should he be judged to be wrong for the rest of his life? It's just not right. [Grenic] should be allowed back into the halls as he once was.");
   }
   if($text=~/grenic/i)   {
	quest::say("Grenic Drere was the man who saved my life. We fought together in the battle of Amm`Oren. Grenic lost sight of our objective for a second and killed innocent people rather than making them prisoners. Mithaniel Marr banished him from the Halls of Honor. Grenic has asked me for a favor to try and find an alternate way into see Mithaniel Marr. I hid pieces of a [map] that I had drawn up around here but the other guards have been keeping a close eye on me.");
   }
   if($text=~/map/i)   {
	quest::say("I had a well drawn map of this place. It was so good that i tore it into four pieces and hid it. If that map fell into the hands of the enemy it could mean destruction. I need help collecting the map. Will you [help] me out $name?");
   }
   if($text=~/help/i)   {
	quest::say("I hid each section in the four corners of the Halls. Collect them and bring them back to me.");
   }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 51628 => 1, 51629 => 1, 51626 => 1, 51627=> 1)) { #Bottom Left Section of a Map, Bottom Right Section of a Map, Top Left Section of a Map, Top Right Section of a Map
    quest::say("Thank you for helping me assemble the map, it was quite detailed and displayed a secondary entrance to Mithainel's temple, which you may use as your entry point.");
    quest::exp(1000);
	# Flag for hohonorb.  Ideally should set a global like pop_hohb_alt, I would assume, but I don't see one anywhere.
	# Since this is alternate access, it just lets you into the zone.  You still have to do trials to get elemental access.
	if(quest::has_zone_flag(220) != 1) {
		quest::set_zone_flag(220);
		$client->Message(15, "You have received a character flag!");
	}  
  }
  plugin::return_items(\%itemcount);
}

#End of File zone:hohonora ID: 211037 -- Minok Targsk
#Started by Kovou, finished by Kilelen