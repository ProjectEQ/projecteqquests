sub EVENT_ITEM{
  if($item1 == 18904){
    quest::say("The slaves...thank you! Here, this will help defend you against those vile orcs.");
    quest::exp(30000);
    quest::ding();
    my $random = int(rand(5));
    if($random == 0){
      quest::summonitem(2012); } #boots
    if($random == 1){
      quest::summonitem(2004); } #tunic
    if($random == 2){
      quest::summonitem(2006); } #cloak
    if($random == 3){
      quest::summonitem(2005); } #shoulderpads
    if($random == 4){
      quest::summonitem(2011); } #leggings
  }
}