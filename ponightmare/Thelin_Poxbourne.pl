sub EVENT_SPAWN {
quest::settimer(1,1);
quest::settimer(2,7200);
}

sub EVENT_DEATH_COMPLETE {
$spawn_mob1 = undef;
$flag = undef;
$dagger = undef;
$spawn_CYCLE = undef;
quest::signalwith(204037, 5, 0);
quest::signalwith(204058, 6, 0);
quest::stoptimer(1);         
quest::stoptimer(2);
}

sub EVENT_TIMER {

if($timer == 2){
$spawn_mob1 = undef;         
$flag = undef;         
$dagger = undef;         
$spawn_CYCLE = undef;         
quest::depop();         
quest::stoptimer(1);         
quest::stoptimer(2);         
}

if($timer == 1){      
if($x == -4800 && $y == 5050  && $spawn_mob1 == undef && $flag == undef){
         quest::pause(10000);
         $spawn_mob1=$spawn_mob1+1;
         }
      if($x == -4827 && $y == 4823 && $spawn_mob1 == 2 && $flag == undef){
         
         quest::pause(10000);
         }

      if($x == -4942 && $y == 4725  && $spawn_mob1 == 4 && $flag == undef){
         
         quest::pause(10000);
         }

      if($x == -4416 && $y == 4592  && $spawn_mob1 == 7 && $flag == undef){
         
         quest::pause(10000);
         }

      if($x == -4150 && $y == 4664  && $spawn_mob1 == 11 && $flag == undef){
         
         quest::pause(10000);
         }

      if($x == -4125 && $y == 5145  && $spawn_mob1 == 16 && $flag == undef){
         
         quest::pause(10000);
         }

      if($x == -4478 && $y ==5407  && $spawn_mob1 == 22 && $flag == undef){
         
         quest::pause(10000);
         }

      if($x == -4549 && $y ==5155  && $spawn_mob1 == 29 && $flag == undef){
        
         quest::pause(10000);
         }
          }

      if($timer == 9){
         quest::depop();
         $spawn_mob1=undef;
         $flag=undef;
         $dagger=undef;
         }

      if($timer == 1){
      if($x == -4800 && $y == 5050 && $spawn_mob1 == 1 && $flag == undef){

         
            
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4740.6,5111.6,4,161.5);
            quest::stoptimer(1);
            $spawn_mob1=$spawn_mob1+1;
            }
      if($x == -4827 && $y == 4823 && $spawn_mob1 == 2 && $flag == undef){

         
            
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4810.1,4750.7,4,245);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4750,4827.9,4,190);
            quest::stoptimer(1);
            $spawn_mob1=$spawn_mob1+2;
            }
   if($x == -4942 && $y == 4725 && $spawn_mob1 == 4 && $flag == undef){

         
            
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4899.1,4718.7,4,192);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4904,4759,4,165);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4912,4667,4,235);
            quest::stoptimer(1);
            $spawn_mob1=$spawn_mob1+3;
            }
   if($x == -4416 && $y == 4592 && $spawn_mob1 == 7 && $flag == undef){

         
            
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4416,4653,4,245);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4484,4658,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4487,4588,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4448,4610,4,190);
            quest::stoptimer(1);
            $spawn_mob1=$spawn_mob1+4;
            }
   if($x == -4150 && $y == 4664 && $spawn_mob1 == 11 && $flag == undef){

         
            
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4208,4656,4,245);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4208,4595,4,245);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4145,4592,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4095,4590,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4092,4657,4,190);
            quest::stoptimer(1);
            $spawn_mob1=$spawn_mob1+5;
            }
   if($x == -4125 && $y == 5145 && $spawn_mob1 == 16 && $flag == undef){

         
            
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4162,5162,4,245);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4088,5192,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4089,5234,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4121,5235,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4165,5236,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4164,5189,4,190);
            quest::stoptimer(1);
            $spawn_mob1=$spawn_mob1+6;
            }
   if($x == -4478 && $y ==5407 && $spawn_mob1 == 22 && $flag == undef){

         
            
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4386,5408,4,245);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4390,5341,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4431,5337,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4486,5343,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4486,5369,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4449,5407,4,190);
            quest::spawn2(quest::ChooseRandom(204059,204066,204060,204061,204062,204063),0,0,-4446,5369,4,190);
            quest::stoptimer(1);
            $spawn_mob1=$spawn_mob1+7;
            }

   if($x == -4549 && $y ==5155 && $spawn_mob1 == 29 && $flag == undef){
            quest::spawn2(204064,0,0,-4546,4974,4,0);
            quest::stoptimer(1);
            }
             }
       if($timer == 6){
            
             $spawn_mob1=undef;
             }
              }



sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 9258 => 1)) {
       $dagger=1;
       quest::spawn2(204065,0,0,-4554,5018,5,130);
       quest::depop();
       $spawn_mob1=undef;
       $spawn_CYCLE = undef;
       $flag=undef;
       $dagger=undef;
       quest::spawn2(204067,0,0,$x,$y,$z,0);
       }
}

sub EVENT_SIGNAL {   
       if($signal == 8){
       quest::settimer(9,600);
       $flag=1;
       }
  
      if($signal == 6 && $spawn_CYCLE == undef){
      quest::spawn2(204016,117,0,$x,$y,$z,0);
      $spawn_CYCLE=$spawn_CYCLE+1;
      quest::depop();
      }
  
     elsif($signal == 6 && $spawn_CYCLE == 1){
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 2){
      quest::spawn2(204016,118,0,$x,$y,$z,0);
      $spawn_CYCLE=$spawn_CYCLE+1;
      quest::depop();
      }
  
     elsif($signal == 6 && $spawn_CYCLE == 3){
      $spawn_CYCLE=$spawn_CYCLE+1;
      }
 
     elsif($signal == 6 && $spawn_CYCLE == 4){
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 5){
      
      quest::spawn2(204016,119,0,$x,$y,$z,0);
      $spawn_CYCLE=$spawn_CYCLE+1;
      quest::depop();
      }

    elsif($signal == 6 && $spawn_CYCLE == 6) {
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

      elsif($signal == 6 && $spawn_CYCLE == 7) {
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

      elsif($signal == 6 && $spawn_CYCLE == 8) {
      

      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 9) {
      
      quest::spawn2(204016,120,0,$x,$y,$z,0);
      $spawn_CYCLE=$spawn_CYCLE+1;
      quest::depop();
      }

     elsif($signal == 6 && $spawn_CYCLE == 10){
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 11)	{
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 12){
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 13){
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 14){
     
      quest::spawn2(204016,121,0,$x,$y,$z,0);
      $spawn_CYCLE=$spawn_CYCLE+1;
      quest::depop();
      }

     elsif($signal == 6 && $spawn_CYCLE == 15) {
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 16){
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 17) {
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 18) {
     
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 19) {
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 20) {
      
      quest::spawn2(204016,122,0,$x,$y,$z,0);
      $spawn_CYCLE=$spawn_CYCLE+1;
      quest::depop();
      }

     elsif($signal == 6 && $spawn_CYCLE == 21){
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 22)	{
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 23) {
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 24) {
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 25) {
      
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

     elsif($signal == 6 && $spawn_CYCLE == 26) {
     
      $spawn_CYCLE=$spawn_CYCLE+1;
      }

      elsif($signal == 6 && $spawn_CYCLE == 27)	{
     
      quest::spawn2(204016,123,0,$x,$y,$z,0);
      $spawn_CYCLE=$spawn_CYCLE+1;
      quest::depop();
      }
       }
