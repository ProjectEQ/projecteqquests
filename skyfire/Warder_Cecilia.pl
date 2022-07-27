# items: 17175, 24996, 24997, 12509
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, you have made excellent time. We received word that Zordak was gathering his power here, and we still have little knowledge of his true intentions. Scattered throughout these mountains there are small Pearlescent Shards, binding four of these shards together within a Box of Binding should allow me to create a Seal. This seal, when fused with a Swirling Pearl inside Zordak's heart should allow our seers to divine his true intentions, even after he has been slain. Once you have the seal I will release Zordak, make haste I will not be able to hold him for long.");
	 # If the Player has the Swirling Perl 28059 from Zordak in Sol B.  Then they should be able to 
	 # get a box from Warder Cecilia
	 if (plugin::check_hasitem($client,28059) && !plugin::check_hasitem($client,17175)){
      quest::summonitem(17175); # Item: Zordak's Box of Bindings
    }

  }
}

sub EVENT_ITEM {
  # 24996 :  An Assembled Pearlescent Shard
  if (plugin::check_handin(\%itemcount,24996=>1)) {
    quest::summonitem(24997); # 24997  Pearlescent Seal
    $entid = quest::unique_spawn(91096,0,0,$x,$y,$z); # Zordak_Ragefire, human form, he attacks the cleric
    if($entid) {
      $zordak_mob = $entity_list->GetMobID($entid);
      if($zordak_mob) {
        $mobnpc = $zordak_mob->CastToNPC();
        if($mobnpc) {
          $dead_cleric_mob = $entity_list->GetMob($name);
          if($dead_cleric_mob) {
       	    $mobnpc->AddToHateList($dead_cleric_mob, 1);
       	  }
       	}
      }
    }
    quest::depop_withtimer();
  }
  elsif ($client->GetGlobal("cleric20") >= 2 && plugin::check_handin(\%itemcount, 12509 => 1)) { #Robe of Plasmatic Priesthood
    quest::say("Yes, Omat told me you were coming.  Let me see what I can divine from the robe.'  She holds the robe to her temple and closes her eyes.  You notice a brief glow from behind her eyelids before her eyes shoot open. 'This is truly terrible news.  The Plasmatic Priests are still fighting for the destruction of Norrath.  Fennin Ro's voice is silent to them now.  The remainder of their power faded with the Pantheon's interest in mortal affairs.  In their mad pursuit of power, they have allied themselves with Mata Muram.  They plan on trading their home-world for the promise of power.  Even now their leader is within the Muramite Trials.  Trying to earn a position of rank within the Legion.  Once he completes the trials we may lose our opportunity.  I am afraid you will have to visit the Labyrinth's trials and stop him before he is able to complete them.  Best of luck to you.'");
    quest::setglobal("cleric20_mpg_drop", 1, 5, "F");
  }
  plugin::return_items(\%itemcount);
}

#End of File, Zone:skyfire  NPC:91037 -- Warder_Cecilia

