sub EVENT_SAY {
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 2) {
  if ($text=~/elder spirit sent me/i) {
  quest::say("Greetingsss fair sage. It would seem that you have come to aid the spirit who fades like each breath we let pass through our lips. There is not [much time] to dawdle. We must get to work right away. As an alchemist yourself, I will tell you what you must do. You must first make some separate combinations. Do not attempt to do this if you are not a master. You will most certainly fail. Ready for intruction?");
}
}
if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 2) {
  if ($text=~/not much time/i) {
quest::say("How shall I put this in termsss you will understand? Two of the rare items of nature's bounty will join because they live in darkness. The others will join because they share love of light. You must use the medicine bag given to you by my old friend -- and entrepreneur -- Wunshi. When you've successfully worked with those, tell me you have completed the first step.");
}
}
if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 2) {
  if ($text=~/first step/i) {
  quest::say("Nicely done, friend. You have done good work. Now, give me both of those pieces and I will fashion what you need to return to the spirit.");
}
}
}
sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 57550 =>1, 57369 =>1 )) {
   quest::say("Take these and return to the spirit!");
   quest::summonitem(52921);
 } 
 plugin::return_items(\%itemcount);
}