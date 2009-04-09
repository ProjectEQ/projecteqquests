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