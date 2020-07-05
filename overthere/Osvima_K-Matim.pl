# items: 62084, 62085, 62198
sub EVENT_SAY {
  if($text=~/hail/i){
quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
}
if($text=~/justice/i){
quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out the goblin flame chanters deep within the Mines of Nurga and bring me back three Rings of Flame Chanting. Also I will need the Writ of Flame Chanting. Do this and you will be well rewarded.");
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62084 => 3, 62085 =>1 )) {
    quest::say("Excellent, my revenge has been exacted.  Take this I no longer have need of it.");
    quest::summonitem(62198); # Item: Black Cord of the Virtuous
  }
}