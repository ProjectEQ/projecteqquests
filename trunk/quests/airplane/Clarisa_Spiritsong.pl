#Clarisa Spiritsong. Bard Quest NPC
sub EVENT_SPAWN {
  quest::settimer("depop",300);
  }

sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hail and well met $name! I give the second half of the test of songs. If you are ready, choose between the tests of brass, wind, and harmony.");
  }
  if($text=~/brass/i){ #Bard Test of Brass
    quest::say("Then bring back to me an Efreeti War Horn, a Saffron Spiroc Feather, Adamintium Bands, and a Glowing Diamond. Then I will give you the horn of disaster.");
  }
  if($text=~/wind/i){ #Bard Test of Wind
    quest::say("Bring me an imp statuette, a dull stone, and an amulet of woven hair. Then I will give you the fae amulet.");
  }
  if($text=~/harmony/){ #Bard Test of Harmony
    quest::say("Working with the environment to enthrall those that listen to you is of the utmost importance to us. Go out and retrieve an efreeti war spear, some manna nectar, a nebulous emerald, and a nebulous diamond. Return these items to me and receive the harmonic spear as your reward.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20830 => 1, 20961 => 1, 20828 => 1, 20829 => 1)) { #Bard test of Brass using Adamantium Bands, Effreeti War horn, glowing diamond, and saffron spiroc feather
    quest::summonitem(27724); #Denon's Horn of Disaster
    quest::exp(100000);
    quest::say("Well done, $name. Here is your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20953 => 1, 20826 => 1, 20827 => 1)) { #Bard test of Wind using Amulet of woven hair, dull stone, and imp statuette
    quest::summonitem(14565); #Fae amulet
    quest::exp(100000);
    quest::say("Well done, $name. Here is your reward.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20831 => 1, 20968 => 1, 20832 => 1, 20833 => 1)) { #Bard test of harmony using Effreeti war spear, manna nectar, nebulous diamond, and nebulous emerald
    quest::summonitem(10852); #harmonic spear
    quest::exp(100000);
    quest::say("Well done, $name. Here is your reward.");
    quest::depop();
    }
  else {
    quest::say("What am I supposed to do with these?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
} 