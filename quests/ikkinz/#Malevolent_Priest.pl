sub EVENT_SPAWN {
    $npc->SetHP(25000);
    }
    
sub EVENT_DEATH {
  quest::signalwith(294141,1);
  quest::setglobal("ikkylockout1",1,3,"H17");
}