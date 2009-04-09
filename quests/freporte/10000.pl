#Orc hand-in NPC for Final Task Rogue

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19930 =>1 )) {
  quest::say("Arg");
  quest::summonitem(19918);
  quest::depop();
    
  }
}