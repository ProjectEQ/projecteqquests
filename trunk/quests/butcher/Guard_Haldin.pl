#npc - Butcher Guard Protectors
#zone - Butcher
#by Angelox

sub EVENT_ITEM{
  if($item1 == 18905){
    quest::say("The slaves...thank you! Here, this will help you slaughter those foul orcs!");
    quest::exp(30000);
    quest::ding();
    my $random = int(rand(3));
    if($random == 0){
      quest::summonitem(5037);  }
    if($random == 1){
      quest::summonitem(5029);  }
    if($random == 2){
      quest::summonitem(13313); }
  }
}