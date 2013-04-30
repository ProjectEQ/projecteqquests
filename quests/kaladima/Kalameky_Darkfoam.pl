sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 18906 => 1)){
    quest::say("The slaves...thank you! Here, this will help defend you against those vile orcs.");
    quest::summonitem(23359);
    quest::exp(30000);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}