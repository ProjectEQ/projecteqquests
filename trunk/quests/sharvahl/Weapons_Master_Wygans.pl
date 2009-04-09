sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Hail friend. welcome to our workshop.  This area once housed the arena's armory. but was converted to a weapons workshop during the initial stages of the war against the Horde.  That was a few years before our time. but Kotahl. Saulgan. and I have been here for at least a decade now.  We've been experimenting with new ways to fight against the Horde."); 

}

if($text=~/what horde/i){

quest::say("The Grimling horde erupted from the mines many many years ago. It was like they just came through a hole in the mines or something. Our miners were all slaughtered in a matter of hours. Some of the residents of the mining camp in the forest made it out alive... but only a few. We have been fighting with little sign of progress for decades now, but that was before Kotahl made his discovery!"); 

}

if($text=~/what discovery/i){

quest::say("Kotahl and Saulgan researched the horde and developed a theory about their origin. Kotahl was able to take those theories and find a way of injuring them by altering the magic of their weapons through alchemy. We have perfected the process and only need the weapons at this point."); 

}

if($text=~/what weapons/i){

quest::say("If you meet with our forces in the Grimling Forest and can find a Grimling officer, you may be able to get one of the weapons that we need. Return those weapons to one of us and we can convert its magic to harm its former owner. The weapons come in three styles. I can convert the weapons of the Grunt. Saulgan can convert the weapons of the Horde. Kotahl works on the weapons of the High Grimling. Bring us those weapons and we'll convert them for you."); 

}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 7170 => 1)) { # Claw of the Grunt
quest::summonitem(7171); # Grimling Bane Claw
quest::exp(300); 
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7180 => 1)) { # Dirk of the Grunt
quest::summonitem(7181); # Grimling Bane Dirk
quest::exp(300);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7174 => 1)) { # Great Sword of the Grunt
quest::summonitem(7175); # Grimling Bane Great Sword
quest::exp(300);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7176 => 1)) { # Hammer of the Grunt
quest::summonitem(7177); # Grimling Bane Hammer
quest::exp(300);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7172 => 1)) { # Short Sword of the Grunt
quest::summonitem(7173); # Grimling Bane Short Sword
quest::exp(300);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7178 => 1)) { # Staff of the Grunt
quest::summonitem(7179); # Grimling Bane Staff
quest::exp(300);
quest::faction(132,2); # Guardians of Shar Vahl

	
}
  else{ 

    quest::say("I have no use for this.");

    plugin::return_items(\%itemcount);
}

}

#END of FILE Zone:sharvahl  ID:155274 -- Weapons_Master_Wygans 


