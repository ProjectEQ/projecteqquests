sub EVENT_CLICKDOOR {
  if ($doorid == 3) { #Frozen Nightmare(mirb) zone in
    my $InInstanceMirB = quest::GetInstanceID("mirb",50);
    if($InInstanceMirB > 0){
      quest::MovePCInstance(237,$InInstanceMirB,607,1503,33);
    } else {
      $client->Message(13, "You are not a part of an instance!");
    }
  }
}