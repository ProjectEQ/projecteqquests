sub EVENT_CLICKDOOR {
  #update zone status
  my $instid = quest::GetInstanceID("tipt",0);
  if($doorid == 3) {
    if($qglobals{$instid.'_tipt_status'} == 9) {
	  if(plugin::check_hasitem($client, 54083)) {
	    #if the zone has to boot from empty, this will let us now to unlock this door (in case the corpse is on the other side).
        quest::setglobal($instid.'_tipt_status',10,7,"H6");
	  }
	}
  }
}

sub EVENT_COMBINE_SUCCESS {
  my $x = $client->GetX();
  my $y = $client->GetY();
  my $z = $client->GetZ();
  my $h = $client->GetHeading();

  if ($recipe_id == 10344) {
    $client->Message(1,"With the final piece in place, the clockwork scout's eyes light up as it comes to life.");
    quest::spawn2(290059,0,0,$x,$y,$z,$h); #Clockwork Scout Model XIII
  }
}