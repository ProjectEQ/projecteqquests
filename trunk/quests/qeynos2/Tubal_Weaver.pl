

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 2) {
    quest::say("Whew. I am parched. I will be back in a few minutes.");
  }
  if($wp == 15) {
    quest::say("Hey sweetheart, I'll have my usual. Could you bring it upstairs for me?");
	quest::signalwith(2083,1,1);
  }
  if($wp == 38) {
    quest::say("Hey, hey, hey! Tubal Weaver open for business!");
  }
}

sub EVENT_SIGNAL {
  if(($x == 372) && ($y == 37) && ($signal == 1)) {
    quest::say("Is he wise to us?");
    quest::signalwith(2083,3, 1);
	
  }
  if($signal == 2) {
quest::say("Well, we won't have to worry about him much longer. I have some friends coming into town who owe me the kind of debt you can't repay with gold.");
    quest::signalwith(2083,4, 1);
	}
  if($signal == 3) {
    quest::say("Don't you worry, sugar, his days are numbered. You better get back before he suspects something. We'll be together soon enough");
    }
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name!  I am Tubal Weaver. humble merchant and retired guardsman of Highkeep.  I make a tidy living dealing with the throngs of adventurers who take it upon themselves to keep Qeynos beetle-free.  If you want some free advice. I recommend that you not deal with any of the merchants in town.  I can offer much lower prices than they because I do not have the overhead of a shop to maintain."); }
}
#END of FILE Zone:qeynos2  ID:2053 -- Tubal_Weaver 

