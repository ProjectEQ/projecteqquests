sub EVENT_SPAWN {
quest::settimer("ssrakezh",1);
}

sub EVENT_TIMER {
 if($timer eq "ssrakezh"){
   if(defined $qglobals{ssrakezh}){
      quest::stoptimer("ssrakezh");
      quest::depop();
  }
   if(!defined $qglobals{ssrakezh}){
      quest::stoptimer("ssrakezh");
  }
 }
}

sub EVENT_DEATH {
  quest::setglobal("ssrakezh",1,3,"H71");
}