sub EVENT_SPAWN 
{
    	quest::spawn2(223215,0,0,251,-1124,-2.8,0); #Quarm Pathing
    	quest::spawn2(223994,0,0,20,-1105,-2.8,64); #Quarm
    	quest::signalwith(223111,1005,0); #flavor
    	quest::depopall(223130);
    	quest::depopall(223145);
    	quest::depopall(223002);
    	quest::depopall(223003);
		quest::spawn2(223999, 0, 0, 374.5, -1.3, 3.1, 192);#phase5_flag
}
 
sub EVENT_SIGNAL {
     if($signal == 9909) {
        quest::settimer("quarm",7200); #120 minute time limit        
     }
}

sub EVENT_TIMER 
{
   	if ($timer eq "quarm") 
   	{ #event failure
    		quest::stoptimer("quarm");
    		quest::signalwith(223177,666,0);
    		quest::shout("You have failed to defeat Quarm in time!");
    		quest::depopall(223994);
    		quest::depopall(223993);
    		quest::depopall(223992);
    		quest::depopall(223991);
    		quest::depopall(223112);
    		quest::depop();
	}	
}