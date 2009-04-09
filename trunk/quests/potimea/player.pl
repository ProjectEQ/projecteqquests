sub EVENT_CLICKDOOR {
    if($doorid == 8 || $doorid == 264){ #If the player has not recently defeated Quarm, phase 4, or phase 5, then let them in.
           if(($qglobals{quarm_down} != 1 && $qglobals{timepokport} != 1) && ($qglobals{potb_p4_comp_pl} != 1 || $qglobals{potb_p5_comp_pl} != 1 || $qglobals{quarm} != 1)){
             quest::emote("The portal, dim at first, begins to glow brighter.");
             quest::emote("The portal flashes briefly, then glows steadily.");
             quest::movepc(223,-36,1352,496,128);
       }
    }
    if($doorid == 9 || $doorid == 265){
           if(($qglobals{quarm_down} != 1 && $qglobals{timepokport} != 1) && ($qglobals{potb_p4_comp_pl} != 1 || $qglobals{potb_p5_comp_pl} != 1 || $qglobals{quarm} != 1)){
              quest::emote("The portal, dim at first, begins to glow brighter.");
              quest::emote("The portal flashes briefly, then glows steadily.");
              quest::movepc(223,-51,857,496,128);
       }
    }
    if($doorid == 10 || $doorid == 266){
           if(($qglobals{quarm_down} != 1 && $qglobals{timepokport} != 1) && ($qglobals{potb_p4_comp_pl} != 1 || $qglobals{potb_p5_comp_pl} != 1 || $qglobals{quarm} != 1)){
              quest::emote("The portal, dim at first, begins to glow brighter.");
              quest::emote("The portal flashes briefly, then glows steadily.");
              quest::movepc(223,-35,1636,496,128);
       }
    }
    if($doorid == 11 || $doorid == 267){
           if(($qglobals{quarm_down} != 1 && $qglobals{timepokport} != 1) && ($qglobals{potb_p4_comp_pl} != 1 || $qglobals{potb_p5_comp_pl} != 1 || $qglobals{quarm} != 1)){
              quest::emote("The portal, dim at first, begins to glow brighter.");
              quest::emote("The portal flashes briefly, then glows steadily.");
              quest::movepc(223,-55,569,496,128);
       }
    }
    if($doorid == 12 || $doorid == 268){
           if(($qglobals{quarm_down} != 1 && $qglobals{timepokport} != 1) && ($qglobals{potb_p4_comp_pl} != 1 || $qglobals{potb_p5_comp_pl} != 1 || $qglobals{quarm} != 1)){
              quest::emote("The portal, dim at first, begins to glow brighter.");
              quest::emote("The portal flashes briefly, then glows steadily.");
              quest::movepc(223,-27,1103,496,128);
       }
    }
    if($doorid == 13 || $doorid == 269){
           if(($qglobals{quarm_down} != 1 && $qglobals{timepokport} != 1) && ($qglobals{potb_p4_comp_pl} != 1 || $qglobals{potb_p5_comp_pl} != 1 || $qglobals{quarm} != 1)){
              quest::movepc(223,865,-150,395,999);
       }
    }
    elsif ($doorid == 8 || $doorid == 264 || $doorid == 9 || $doorid == 265 || $doorid == 10 || $doorid == 266 || $doorid == 11 || $doorid == 267 || $doorid == 12 || $doorid == 268 || $doorid == 13 || $doorid == 269) {
       $client->Message(0,"You may not enter at this time.");
       }
       $qglobals{timepokport}=undef;
       $qglobals{potb_p2_comp_pl}=undef;
       $qglobals{potb_p3_comp_pl}=undef;
       $qglobals{potb_p4_comp_pl}=undef;
       $qglobals{potb_p5_comp_pl}=undef;
       $qglobals{potb_p2_comp}=undef;
       $qglobals{potb_p3_comp}=undef;
       $qglobals{potb_p4_comp}=undef;
       $qglobals{potb_p5_comp}=undef;
       $qglobals{quarm}=undef;
    }   