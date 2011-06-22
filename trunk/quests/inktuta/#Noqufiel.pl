#needs live text
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Begone and bother me no more.  How have you made it this far?  Do you [want to die]?");
  }
  if ($text=~/want to die/i) {
    quest::say("Die!");
    quest::spawn2(296053,0,0,-2,-961,-127,249);  
    quest::spawn2(296054,0,0,-7,-852,-127,127);  
    quest::spawn2(296055,0,0,-209,-970,-127,0);
    quest::spawn2(296056,0,0,-146,-994,-127,1);  
    quest::spawn2(296057,0,0,-145,-828,-127,124);  
    quest::spawn2(296058,0,0,-218,-853,-127,129);
    quest::spawn2(296017,0,0,$x,$y,$z,$h);
    quest::depop();
  }  
}