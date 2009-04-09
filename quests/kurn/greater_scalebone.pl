sub EVENT_DEATH{
 my $random_result = int(rand(100));
 if ($random_result<=5){
  quest::spawn2(97077,0,0,-223,-98,121,0);
  }else{
  #do nothing
 }
}
