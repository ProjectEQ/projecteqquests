sub EVENT_SAY {
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/elder spirit sent me/i) {
  quest::say("Shhh! You'll scare them away, fool! Darnit! Do you have any idea at all how rare this fungus is? Any idea at all?");
  }
  if ($text=~/idea/i) {
  quest::say("No kidding. The way you ran up here like a herd of elephants was a dead giveaway. You make enough noise and this fungus disappears into thin air and then I have to wait for it to show itself again. Odd plant really, but very reactive, so keep it down. The spirit must have two pieces of this fungus for its potion and it only grows here. I'd like to see you prove your ability. If by a miracle you should collect two, come and speak to me.");
  quest::spawn2(157118,0,0,700, 670,-251.3, 131.5);
  }
}
if(plugin::check_hasitem($client, 57620) && defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1){
 if($text=~/hail/i) {
    quest::say("Surprising. Didn't think you'd be up to the task and be able to muster the knowledge to figure it out. If you have both with you, hurry along. The spirit is in great need of the potion.");
  }
 }
}

sub EVENT_ITEM {
 plugin::return_items(\%itemcount); 
}