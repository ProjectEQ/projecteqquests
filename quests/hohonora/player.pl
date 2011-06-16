sub EVENT_ENTERZONE {
  if(($class eq "Enchanter") && plugin::check_hasitem($client, 52963)) { #Sullied Gold Filigree
    if(!$entity_list->GetNPCByNPCTypeID(211047) && !defined($qglobals{anthone})) {
      quest::spawn2(211047,0,0,-1853,2479,-110,20); ##Anthone_Chapin
    }
  }
}

sub EVENT_CLICKDOOR {
  if($doorid == 19 || $doorid == 20) {
    if(defined($qglobals{pop_poj_mavuin}) && defined($qglobals{pop_poj_tribunal}) && defined($qglobals{pop_poj_valor_storms}) && defined($qglobals{pop_pov_aerin_dar}) && defined($qglobals{pop_hoh_faye}) && defined($qglobals{pop_hoh_trell}) && defined($qglobals{pop_hoh_garn})) {
      if(quest::has_zone_flag(220) != 1) {
        quest::set_zone_flag(220);
        $client->Message(15, "You have received a character flag!");
      }
    }
  }
}