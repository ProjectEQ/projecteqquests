sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Hail and welcome! If you're here to have me convert a weapon of the High Grimling for you. please give it to me.  If not. please speak to Wygans.  He's in charge of dealing with the tourists this week.  I've got a lot of work to do."); 

}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 7285 => 1)) { # Claw of the High Grimling
quest::summonitem(7286); # Claw of the Grimling Slayer
quest::exp(500);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7295 => 1)) { # Dirk of the High Grimling
quest::summonitem(7296); # Dirk of Grimling Slaying
quest::exp(500);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7289 => 1)) { # Great Sword of the High Grimling
quest::summonitem(7290); # Great Sword of Grimling Slayer
quest::exp(500);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7291 => 1)) { # Hammer of the High Grimling
quest::summonitem(7292); # Hammer of Grimling Slayer
quest::exp(500);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7287 => 1)) { # Short Sword of the High Grimling
quest::summonitem(7288); # Short Sword of Grimling Slayer
quest::exp(500);
quest::faction(132,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7293 => 1)) { # Staff of the High Grimling
quest::summonitem(7294); # Staff of Grimling Slayer
quest::exp(500); 
quest::faction(132,2); # Guardians of Shar Vahl

}

    plugin::return_items(\%itemcount);

}

#END of FILE Zone:sharvahl  ID:155272 -- Alchemist_Kotahl 

