sub EVENT_ITEM{
  if($item1 == 18906){
    quest::say("The slaves...thank you! Here, this will help defend you against those vile orcs.");
    quest::summonitem(23359);
    quest::exp(30000);
    quest::ding();
  }
}