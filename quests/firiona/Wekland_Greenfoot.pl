##Could find no text for these so the text is being adapted from another 
##freed slave quest file

sub EVENT_SAY {
  if($text=~/hail/i){
quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
}
if($text=~/justice/i){
quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out the goblin overseers deep within the Mines of Nurga and bring me back three Nurgan Overseer Necklaces. Also I will need the Bone Collar of Henxsa. Do this and you will be well rewarded.");
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62083 =>1, 62082 => 3)) {
    quest::say("Thank you for your assistance.  Here is the reward that you were promised.");
    quest::summonitem(62197);
  }
}