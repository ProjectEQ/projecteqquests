##Text adapted from another completed freed slave quest

sub EVENT_SAY {
  if($text=~/hail/i){
quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
}
if($text=~/justice/i){
quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out the goblin spirit chanters deep within the Mines of Nurga and bring me back three Spirit Chanter Jewels. Also I will need the Book of Spirit Chanting. Do this and you will be well rewarded.");
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62088 => 3, 62089 => 1)) {
    quest::say("I am grateful to you for your assistance.  Here take this.");
    quest::summonitem(62200);
  }
}