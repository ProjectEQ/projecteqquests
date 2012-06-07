#BeginFile: qvic\player.pl

sub EVENT_ENTERZONE {
  if (defined $qglobals{god_qvic_access} && $qglobals{god_qvic_access} == 1 && quest::has_zone_flag(295) == 1) {
    quest::setglobal("god_qvic_access",2,5,"F");
  }
}

sub EVENT_CLICKDOOR {
  if ($doorid == 3) { #Inktu`Ta zone in
    my $InstanceID = quest::GetInstanceID("inktuta",0);
    if($InstanceID > 0){
      quest::MovePCInstance(296,$InstanceID,15,190,-2.8);
    } else {
      $client->Message(13, "You are not a part of an instance!");
    }
  }
}

#EndFile: qvic\player.pl
