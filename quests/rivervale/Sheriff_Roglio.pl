sub EVENT_SAY{
  if ($text=~/hail/i){
  quest::say("Hail, $name! Stand tall whenever you are speaking to the Sheriff of Rivervale. I command the warriors of this vale. You must be new to the ranks of the Guardians of the Vale, so be sure to report to your squad at once. We must protect our people. The [danger] has come closer to home. If you are not a deputy, then please leave these halls.");
  }
  if ($text=~/What danger/i){
  quest::say("What danger?!! You must be new to the community. The goblins of Clan Runnyeye have been scaling our wall somehow. You must join our forces in exterminating every one of those beasts. Your wages are earned with every four bloody goblin warbead necklaces you return to me. Now be off and fight the good fight.");}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13931 => 4)){
  quest::say("Good work, Deputy $name! We shall soon rid our countryside of the goblin threat. Here are your wages. Eat well tonight!");
  quest::summonitem(13023);
  quest::summonitem(13024);
  quest::faction(133, 1);
  quest::faction(208, 1);
  quest::faction(316, 1);
  quest::faction(218, 1);
  quest::faction(88, -1);
  quest::exp(6400);
  quest::ding();
  quest::givecash(0,8,0,0);}

  else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}

#End of File, Zone:rivervale  NPC:19058 -- Sheriff_Roglio
