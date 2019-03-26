sub EVENT_SPAWN {
  quest::settimer(1,6);
}

sub EVENT_AGGRO {
  quest::stoptimer(1);
  quest::stoptimer(3);
  quest::settimer(2,1);
}

sub EVENT_TIMER {
  if(($timer == 2) && ($x < 190)) {
    $npc->GMMove(453,-142,6,384);
  }
  if($timer == 1) {
  $npc->SetHP(165000);
  quest::stoptimer(1);
  quest::settimer(3,6);
  }
  if($timer == 3) {
  $npc->SetHP(3300000);
  quest::stoptimer(3);
  quest::settimer(1,6);
  }
}
sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294596,0,0,519,-247,-50,70); # NPC: a_pile_of_bones
  quest::spawn2(294596,0,0,521,-156,-50,170); # NPC: a_pile_of_bones
  quest::spawn2(294596,0,0,556,-266,-50,486); # NPC: a_pile_of_bones
  quest::spawn2(294596,0,0,618,-232,-50,4); # NPC: a_pile_of_bones
  quest::signalwith(294631,6); #set lockout
  quest::ze(0,"Vrex Xalkak Nixki has been defeated! The whole time you were led to believe that this guardian was just another stone sentinel left as a test by the trusik priests of the past. Congratulations on a most difficult task indeed!");
  	my @nlist = $entity_list->GetClientList();
	foreach my $n (@nlist){
		$n->SendMarqueeMessage(10,510,1,1,6000,"Vrex Xalkak Nixki has been defeated! Congratulations!");
	}
}
