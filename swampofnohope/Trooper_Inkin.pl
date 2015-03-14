sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Many frogloks in here. Beware! They can be a sneaky bunch. I hear tales of a froglok village nearby.");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("I have been expecting this. Oh, well... Can't argue with the Baron or he will have both our heads. Keeping that in mind, I will make you a deal. I will sign the order if you bring me one of those grand skipping stones these Frogloks are said to have. Bring me the stone and the order and I shall sign.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18243 => 1, 12425 => 1)) { #Legion Order (3 signed), Skipping Stone
    quest::say("So smooth. I shall be the skipping stone champion! Here. You may have my autograph.");
    quest::summonitem(18244); #Legion Order (4 signed)
    quest::exp(500);
    quest::givecash(7,0,0,0);
  }
  elsif (plugin::check_handin(\%itemcount, 18243 => 1)) {
    quest::say("No deal! You bring me the legion order and the froglok skipping stone.");
    quest::summonitem(18243);
  }
  elsif (plugin::check_handin(\%itemcount, 12425 => 1)) {
    quest::say("No deal! You bring me the legion order and the froglok skipping stone.");
    quest::summonitem(12425);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:swampofnohope  ID:83063 -- Trooper_Inkin