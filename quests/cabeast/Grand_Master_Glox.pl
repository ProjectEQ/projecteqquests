sub EVENT_SPAWN {
 $npc -> SetAppearance(1);
}

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote('shows no reaction to your greeting.');
  }
 elsif($text=~/trial of agility/i){
  quest::say('I knew you were not the whiff others claimed you to be, are you sure you are [ready] to be tested in agility?');
  }
 elsif($text=~/ready/i){
  quest::say('We shall spar then, I hope you are as prepared as you think you are.');
  quest::movepc(106,-190.9,1089.8,-25.2);
  }
 }

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18204 => 1)){
  quest::emote('breaks his meditation and quickly grabs your forearms. You feel the raw power in his heavily callused hands. Out of nowhere, his tail sweeps forward and places a shackle upon your wrist. He then points south towards Master Bain and returns to his meditation.');
  quest::summonitem('4190');
 }
  if (plugin::check_handin(\%itemcount, 14788 =>1 )) {
    quest::emote("sits whispering incoherently for a long moment before even regarding the note you dropped in front of him. The Grand Master suddenly snatches up the note from Xlixinar, removes a small charcoal marker from a belt pouch, and scrawls some intructions upon it. He drops the note immediately after finishing and resumes his meditation without a word.");
    quest::summonitem(18980);
  }
  if (plugin::check_handin(\%itemcount, 14782 =>1, 10032 =>1 )) {
   quest::emote("nods slightly");
    quest::summonitem(14783);
    quest::ding();
    quest::exp(10000);
  }
  plugin::try_tome_handins(\%itemcount, $class, 'Monk');
  plugin::return_items(\%itemcount);

}

 #Submitted by: Senzo aka Fatty Beerbelly
 #Item_IDs : taken from : http://eqitems.13th-floor.org/
 #END of FILE : Zone : cabeast : NPC_ID : 2023 : Grand_Master_Glox
