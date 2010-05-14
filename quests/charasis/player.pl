sub EVENT_CLICKDOOR {
   if($doorid == 8 || $doorid == 264){
      if($client->KeyRingCheck(20511) || $client->KeyRingCheck(17274)){
        quest::forcedooropen(8);
      }
      elsif(plugin::check_hasitem($client, 20511)) {
        quest::forcedooropen(8);
       }
      elsif(plugin::check_hasitem($client, 17274)) {
        $client->KeyRingAdd(17274);
        quest::forcedooropen(8);
       }
   }    
   if($doorid == 10 || $doorid == 266){
         if($client->KeyRingCheck(20513) || $client->KeyRingCheck(17274)){
           quest::forcedooropen(10);
         }
         elsif(plugin::check_hasitem($client, 20513)) {
           quest::forcedooropen(10);
          }
         elsif(plugin::check_hasitem($client, 17274)) {
           $client->KeyRingAdd(17274);
           quest::forcedooropen(10);
          }
   }    
   if($doorid == 11 || $doorid == 267){
            if($client->KeyRingCheck(20511) || $client->KeyRingCheck(17274)){
              quest::forcedooropen(11);
            }
            elsif(plugin::check_hasitem($client, 20512)) {
              quest::forcedooropen(11);
             }
            elsif(plugin::check_hasitem($client, 17274)) {
              $client->KeyRingAdd(17274);
              quest::forcedooropen(11);
             }
   }  
   if($doorid == 35 || $doorid == 291){
         if($client->KeyRingCheck(20515) || $client->KeyRingCheck(17274)){
           quest::forcedooropen(35);
         }
         elsif(plugin::check_hasitem($client, 20515)) {
           quest::forcedooropen(35);
          }
         elsif(plugin::check_hasitem($client, 17274)) {
           $client->KeyRingAdd(17274);
           quest::forcedooropen(35);
          }
   }
   if($doorid == 40 || $doorid == 296){
         if($client->KeyRingCheck(20514) || $client->KeyRingCheck(17274)){
           quest::forcedooropen(40);
         }
         elsif(plugin::check_hasitem($client, 20514)) {
           quest::forcedooropen(40);
          }
         elsif(plugin::check_hasitem($client, 17274)) {
           $client->KeyRingAdd(17274);
           quest::forcedooropen(40);
          }
   } 
   if($doorid == 46 || $doorid == 302){
         if($client->KeyRingCheck(20516) || $client->KeyRingCheck(17274)){
           quest::forcedooropen(46);
         }
         elsif(plugin::check_hasitem($client, 20516)) {
           quest::forcedooropen(46);
          }
         elsif(plugin::check_hasitem($client, 17274)) {
           $client->KeyRingAdd(17274);
           quest::forcedooropen(46);
          }
         }
        }