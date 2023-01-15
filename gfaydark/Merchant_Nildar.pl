# items: 2007, 2004, 2006, 2010, 2011
sub EVENT_ITEM{
  if($item1 == 18903){
    quest::say("My brother still lives? Thank you for this news. Please, take this with my deepest thanks.");
    quest::exp(30000);
    quest::ding();
    my $random = int(rand(5));
    if($random == 0){
      quest::summonitem(2007); } #belt
    if($random == 1){
      quest::summonitem(2004); } #tunic
    if($random == 2){
      quest::summonitem(2006); } #cloak
    if($random == 3){
      quest::summonitem(2010); } #gloves
    if($random == 4){
      quest::summonitem(2011); } #leggings
  }
}