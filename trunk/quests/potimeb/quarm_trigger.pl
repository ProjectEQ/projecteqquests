sub EVENT_SPAWN {
    quest::delglobal("potb_p4_comp");
    quest::setglobal("potb_p5_comp",1,7,"H2"); #general complete
    quest::settimer("quarm",7200); #120 minute time limit
    quest::spawn2(223215,0,0,251,-1124,-2.8,0); #Quarm Pathing
    quest::spawn2(223994,0,0,20,-1105,-2.8,64); #Quarm
    quest::signalwith(223111,1005,0); #flavor
    quest::depopall(223130);
    quest::depopall(223145);
    quest::depopall(223002);
    quest::depopall(223003);
}
 
 sub EVENT_TIMER {
   if ($timer eq "quarm") { #event failure
    quest::stoptimer("quarm");
    quest::signalwith(223177,666,0);
    quest::shout("You have failed to defeat Quarm in time!");
    quest::depopall(223994);
    quest::depopall(223993);
    quest::depopall(223992);
    quest::depopall(223991);
    quest::depopall(223112);
    quest::setglobal("timepokport",1,3,"M2");
    quest::depop();
}
 }