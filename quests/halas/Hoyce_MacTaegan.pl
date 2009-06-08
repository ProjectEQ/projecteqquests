#BeginFile: halas\Hoyce_MacTaegan.pl
#
#Quest: Field Priest Armor
#
#Note: Work in progress
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings to you brother. Did [Keven] send you?");
  }
  if($text=~/keven sent me/i) {
    quest::say("Very well, then let us begin. We are at home in the wilderness and thus it is important that we learn all we can about our surroundings. Now is the time of your learning. You are to venture out, hunt and learn about Everfrost. Return to me with a White Wolf Skin as proof of your successful hunt. We will then continue your training.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13768 => 1)) { #White Wolf Skin
    quest::say("");
    quest::summonitem(7365); #Field Priest's Bracer
    quest::exp(1000);
    quest::faction(0,0); #+Shamen of Justice 
    quest::faction(0,0); #+Merchants of Halas 
    quest::faction(0,0); #-Coalition of Tradesfolk Ill. 
    quest::faction(0,0); #-Circle of Unseen Hands 
    quest::faction(0,0); #-Ebon Mask 
  }
  elsif(plugin::check_handin(\%itemcount, XXXX => 3, XXXX => 1)) { #Silk Thread x 3, Large Tattered Skullcap
    quest::say("");
    quest::summonitem(7366); #Field Priest's Cap
    quest::exp(1000);
    quest::faction(0,0); #+Shamen of Justice 
    quest::faction(0,0); #+Merchants of Halas 
    quest::faction(0,0); #-Coalition of Tradesfolk Ill. 
    quest::faction(0,0); #-Circle of Unseen Hands 
    quest::faction(0,0); #-Ebon Mask 
  }
  elsif(plugin::check_handin(\%itemcount, XXXX => 4)) { #Ice Goblin Beads x 4
    quest::say("");
    quest::summonitem(7367); #Field Priest's Kilt
    quest::exp(1000);
    quest::faction(0,0); #+Shamen of Justice 
    quest::faction(0,0); #+Merchants of Halas 
    quest::faction(0,0); #-Coalition of Tradesfolk Ill. 
    quest::faction(0,0); #-Circle of Unseen Hands 
    quest::faction(0,0); #-Ebon Mask 
  }
  elsif(plugin::check_handin(\%itemcount, XXXX => 1, XXXX => 1, XXXX => 1)) { #Gnoll Fang, Giant Snake Fang, Hunting Bow
    quest::say("");
    quest::summonitem(7368); #Field Priest's Claw
    quest::exp(1000);
    quest::faction(0,0); #+Shamen of Justice 
    quest::faction(0,0); #+Merchants of Halas 
    quest::faction(0,0); #-Coalition of Tradesfolk Ill. 
    quest::faction(0,0); #-Circle of Unseen Hands 
    quest::faction(0,0); #-Ebon Mask 
  }
  elsif(plugin::check_handin(\%itemcount, XXXX => 1)) { #Wrath Orc Wristbands
    quest::say("");
    quest::summonitem(7369); #Field Priest's Leather
    quest::exp(1000);
    quest::faction(0,0); #+Shamen of Justice 
    quest::faction(0,0); #+Merchants of Halas 
    quest::faction(0,0); #-Coalition of Tradesfolk Ill. 
    quest::faction(0,0); #-Circle of Unseen Hands 
    quest::faction(0,0); #-Ebon Mask 
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:halas  ID:Not_Found -- Hoyce_MacTaegan