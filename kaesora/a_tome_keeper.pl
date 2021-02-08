#The tome keeper will give us one of a few possible tomes, chosen randomly, that will tell us how to proceed on the next part of the Shackle of Tynonnium quest.
# items: 4196

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("shows awareness of you, but ignores you completely.");
 }
 elsif($text=~/peace of mind/i){
  quest::emote("begins to speak to you without movement of his rotted mouth, you realize his words are pouring into your mind. 'You seek peace of mind, and may you have it. First though, your Shackle of Steel. One Shackle for one tome.'");
 }
}



sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 4196 => 1)){
  my $Tome = quest::ChooseRandom(18359,18462,18463,18464,18465,18466,18467,18468,18469,18470);
  quest::emote("drops a tattered tome at your feet and says nothing more. You pick it up and place it among your things.");
  quest::summonitem($Tome);
  quest::ding();
 }
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills