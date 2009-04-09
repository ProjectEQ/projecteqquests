sub EVENT_SAY {
 my $chance = int(rand(100));
 if($text=~/hail/i && $chance == 7){ 
  quest::attack($name);
 }
}
