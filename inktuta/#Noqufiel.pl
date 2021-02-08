#needs live text
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Begone and bother me no more.  How have you made it this far?  Do you [" . quest::saylink("want to die") . "]?");
  }
  if ($text=~/want to die/i) {
    quest::say("Die!");
    quest::spawn2(296053,0,0,-2,-961,-127,498);  #cursecallers
    quest::spawn2(296054,0,0,-7,-852,-127,254); # NPC: #Cursecaller_Kiamquz
    quest::spawn2(296055,0,0,-209,-970,-127,0); # NPC: #Cursecaller_Qibaiz
    quest::spawn2(296056,0,0,-146,-994,-127,2); # NPC: #Cursecaller_Requarak
    quest::spawn2(296057,0,0,-145,-828,-127,248); # NPC: #Cursecaller_Towzaqu
    quest::spawn2(296058,0,0,-218,-853,-127,258); # NPC: #Cursecaller_Xavonique
    quest::spawn2(296017,0,0,$x,$y,$z,$h); #curse trigger
    quest::depop();
  }  
}
