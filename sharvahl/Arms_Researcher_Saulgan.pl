# items: 7182, 7183, 7192, 7193, 7186, 7187, 7188, 7189, 7184, 7185, 7190, 7191
sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Saulgan says 'Hail and Well Met! If you are here to get a weapon of the Horde converted, let me see it. If not, please speak to Wygans. Don't worry, he may be tough as nails, but he won't bite you."); 
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 7182 => 1)) { # Claw of the Horde
quest::summonitem(7183); # Claw of Grimling Slaying
quest::exp(400);
quest::faction(1513,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7192 => 1)) { # Dirk of the Horde
quest::summonitem(7193); # Dirk of Grimling Slaying
quest::exp(400);
quest::faction(1513,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7186 => 1)) { # Great Sword of the Horde
quest::summonitem(7187); # Great Sword of Grimling Slaying
quest::exp(400);
quest::faction(1513,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7188 => 1)) { # Hammer of the Horde
quest::summonitem(7189); # Hammer of Grimling Slaying
quest::exp(400);
quest::faction(1513,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7184 => 1)) { # Short Sword of the Horde
quest::summonitem(7185); # Short Sword of Grimling Slaying
quest::exp(400);
quest::faction(1513,2); # Guardians of Shar Vahl

}

elsif (plugin::check_handin(\%itemcount, 7190 => 1)) { # Staff of the Horde
quest::summonitem(7191); # Staff of Grimling Slaying
quest::exp(400); 
quest::faction(1513,2); # Guardians of Shar Vahl

}

    plugin::return_items(\%itemcount);

}


#END of FILE Zone:sharvahl  ID:155273 -- Arms_Researcher_Saulgan 

