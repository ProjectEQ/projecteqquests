sub EVENT_TIMER {
   if($timer == 5){
   quest::stoptimer(5);
   $hedge_roamer=undef;
   }
    

}
sub EVENT_SIGNAL {
   
   if($signal == 6){
      $hedge_roamer=undef;
}
    if($signal == 5){
         $hedge_roamer=$hedge_roamer+1;
         }

   if($hedge_roamer == 1){
      quest::spawn2(204016,116,0,-4725,5200,4,0); # NPC: Thelin_Poxbourne
      quest::settimer(5,7200);
      }
   
   }
   
