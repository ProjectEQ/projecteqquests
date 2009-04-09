sub EVENT_CLICKDOOR {
   if($doorid == 8 || $doorid == 264){
      if(plugin::check_hasitem($client, 20511) || plugin::check_hasitem($client, 17274)) {
        quest::forcedooropen(8);
      }
       }
         if($doorid == 10 || $doorid == 266){
            if(plugin::check_hasitem($client, 20513) || plugin::check_hasitem($client, 17274)) {
              quest::forcedooropen(10);
      }
       }
         if($doorid == 11 || $doorid == 267){
            if(plugin::check_hasitem($client, 20512) || plugin::check_hasitem($client, 17274)) {
              quest::forcedooropen(11);
      }
       }
         if($doorid == 35 || $doorid == 291){
            if(plugin::check_hasitem($client, 20515) || plugin::check_hasitem($client, 17274)) {
              quest::forcedooropen(35);
      }
       }
         if($doorid == 40 || $doorid == 296){
            if(plugin::check_hasitem($client, 20514) || plugin::check_hasitem($client, 17274)) {
              quest::forcedooropen(40);
      }
       }
         if($doorid == 46 || $doorid == 302){
            if(plugin::check_hasitem($client, 20516) || plugin::check_hasitem($client, 17274)) {
              quest::forcedooropen(46);
      }
       }
        }