sub EVENT_SPAWN {
  quest::settimer("KreshinDepop",120); #Depop after 2 minutes
  quest::say("Thank you for rescuing me. I sense that one of you holds a stone key which allowed you entrance into the courts. Please show it to me.");
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (plugin::check_hasitem($client, 67415) && plugin::check_hasitem($client, 67401)) { #Stone of Entry, Writ of the Magi
      quest::say("Thank you for rescuing me. You should [leave] this place and take the writ to Taminoa.");
    }
    elsif (plugin::check_hasitem($client, 67415)) { #Stone of Entry
      quest::say("Thank you for rescuing me. I sense that you hold a stone key which allowed you entrance into the courts. Please show it to me.");
    }
    else {
      quest::say("Thank you for rescuing me.");
    }
  }
  if ($text=~/leave/i) {
    EVENT_TIMER();
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67415 => 1)) { #Stone of Entry
    quest::say("You have done well to get this far. Please, take this to Taminoa and tell him it is vital that he decipher it. I must stay here to investigate more. Let him know I am safe and thank you again.");
    quest::summonitem(67415); #Stone of Entry
    quest::summonitem(67401); #Writ of the Magi
  }
  else {
    quest::say("This is not what I seek.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER {
  quest::stoptimer("KreshinDepop");
  quest::signalwith(281116,3,0); #Trigger_Qinimi_1
  quest::depop();
}