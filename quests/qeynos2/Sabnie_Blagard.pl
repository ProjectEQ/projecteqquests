

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. thirsty traveler!  I recommend trying Crow's special brew.  It's the brew that put Qeynos on the map!"); }
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 10) {
    quest::say("Did someone order an ale up here?");
	quest::signalwith(2062,1,1)
  }
  if($wp == 18) {
    quest::say("Tubal doesn't suspect a thing.. the poor sap.");
	quest::signalwith(2063, 3, 3);
	
  }
}

sub EVENT_SIGNAL {
  if(($x == 368) && ($y == 82) && ($signal == 1)) {
    quest::say("Um, sure. Be right.. um.. up.");
    quest::signalwith(2063,1,1);
  }
  if($signal == 2) {
quest::say("Yes. Fine. That guy just gives me the creeps is all.");
    quest::signalwith(2063,2, 10);
	
	}
  if($signal == 3) {
	quest::say("No. No. He is clueless. I've missed you so.");
	quest::signalwith(2062,2,1);
	
   }
if($signal == 4) {
    quest::say("Please be careful. I don't know what I would do if anything happened to you.");
	quest::signalwith(2062,3,1);
	
    }
	if($signal == 5) {
    quest::say("No! um.. no. That's ok. He's just a little weird, that's all. Nothing to worry about");
	quest::signalwith(2062,4,1);
    }
  }





#END of FILE Zone:qeynos2  ID:2074 -- Sabnie_Blagard 

