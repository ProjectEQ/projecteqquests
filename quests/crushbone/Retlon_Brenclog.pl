sub EVENT_SAY{
  if($text=~/Hail/i){
    quest::say("Oh my word!! A rescuer!! Hurry! Get me out of these chains!! Go find the orc who has the keys!");
  }
}
sub EVENT_ITEM{
  if($copper >= 1 || $item1 != 20015){
    quest::say("No, no!! I do not need this!! Get me key number 15!!");
  }
  if($item1 == 20015){
    quest::say("Good work!! I shall be on my way. Farewell my friend!!");
    quest::givecash(0,3,2,0);
    quest::exp(10000);
    quest::ding();
    quest::faction(176,10);
    quest::faction(91,10);
    quest::faction(115,10);
    quest::faction(322,-20);
    quest::depop_withtimer();
  }
if($item1==1717) {
    quest::say("Ah! A letter from my brother! Mmm... no... no I don't have Tergon's spellbook. The orc's prophet took it and then they locked me in chains! Now why don't you go do something useful and get me key number 15!!");
    quest::faction(91,3);
    quest::faction(71,-3);
    quest::faction(322,-3);
    quest::faction(115,3);
    quest::faction(176,3);
  }
}