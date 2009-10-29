#BeginFile: eastkarana\Brettaru_Tyco.pl ()
#Quest file for East Karana - Brettaru Tyco

sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(140,2)) { #Task: Bringing Goods to the Plains
      quest::say("Hello, $name.");
      $client->Message(15,"Now wasn't that a rewarding experience? Wasn't it satisfying to expand your horizons and explore the world? Truely, your time spent here is reward in and of itself. Then again, if it's not, you did go see the world on the word of a stranger, so there's no harm in a reward that's a bit more tangible.");
      quest::updatetaskactivity(140,2);
    }
#    elsif(quest::istaskactivityactive(142,2)) { #Task: Bringing Books to the Karanas
#      quest::say("Hello, $name.");
#      $client->Message(15,"Now wasn't that a rewarding experience? Wasn't it satisfying to expand your horizons and explore the world? Truely, your time spent here is reward in and of itself. Then again, if it's not, you did go see the world on the word of a stranger, so there's no harm in a reward that's a bit more tangible.");
#      quest::updatetaskactivity(142,2);
#    }
    else {
      quest::say("Hello, $name.");
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

#EndFile: eastkarana\Brettaru_Tyco.pl ()