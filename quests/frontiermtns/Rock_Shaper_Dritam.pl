##Text is adapted from another completed quest file for the freed slaves
## could find no text on allas

sub EVENT_SAY {
  if($text=~/hail/i){
quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
}
if($text=~/justice/i){
quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out the goblin flame dancers deep within the Mines of Nurga and bring me back three Flame Dancer Beads. Also I will need a Blood Thirsty Rat Hide. Do this and you will be well rewarded.");
}
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62078 => 3, 62079 => 1)) {
    quest::say("Thank you for helping me avenge my time in the mines.  Take this, and I hope that it serves you well.");
    quest::summonitem(62195);
  }
}
