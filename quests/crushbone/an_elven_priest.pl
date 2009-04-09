sub EVENT_SAY{
  if($text=~/the king is dead/i){
    quest::say("Dead you say? My goodness! Did you manage to slay the warlord too? If you provide me with proof of his death, I can enchant the mace the dwarf gave you as payment. But, I will require the proof first!");
  }
}

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount,2301 => 1)){
    quest::say("Erollisi be praised! You slew the orc lord! Well, here is a token of my appreciation! Should you wish to have that mace enchanted, just hand me the mace and my token and I shall uphold my end of the bargain!");
    quest::summonitem(1900);
    quest::exp(50000);
    quest::ding();
  }
  
  if(plugin::check_handin(\%itemcount,6315 => 1, 1900 => 1)){
    quest::say("Have you the other item I require?");
    quest::say("Have you the other item I require?");
    quest::summonitem(6305);
    quest::exp(100000);
    quest::ding();
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}