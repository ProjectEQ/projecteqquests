# you do not need rallos to get into solrotower so why would he be needed to click up to solro area?
# removed rallos requirement to click up
# rallos was required to get to sol ro, not the zone, on live, that is why he was in here. - Reno

sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
$whimsy_count++;
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}

sub EVENT_CLICKDOOR {
   
   if($doorid == 44 || $doorid == 45 || $doorid == 47 || $doorid == 48 || $doorid == 300 || $doorid == 301 || $doorid == 303 || $doorid == 304){
      if($qglobals{pop_sol_ro_jiva} == 1 && $qglobals{pop_sol_ro_dresolik} == 1 && $qglobals{pop_sol_ro_arlyxir} == 1 && $qglobals{pop_sol_ro_rizlona} == 1 && $qglobals{pop_sol_ro_xuzl} == 1 && $qglobals{pop_tactics_ralloz} == 1) {
            quest::movepc(212,0,-847,244);
      }
      elsif($qglobals{pop_sol_ro_jiva} != 1 || $qglobals{pop_sol_ro_dresolik} != 1 || $qglobals{pop_sol_ro_arlyxir} != 1 || $qglobals{pop_sol_ro_rizlona} != 1 || $qglobals{pop_sol_ro_xuzl} != 1 || $qglobals{pop_tactics_ralloz} != 1) {
            $client->Message(13, "You lack the will to use this object!");
    }
   }
   $qglobals{pop_tactics_ralloz}=undef;
   $qglobals{pop_sol_ro_arlyxir}=undef;
   $qglobals{pop_sol_ro_dresolik}=undef;
   $qglobals{pop_sol_ro_jiva}=undef;
   $qglobals{pop_sol_ro_rizlona}=undef;
   $qglobals{pop_sol_ro_xuzl}=undef;
  }