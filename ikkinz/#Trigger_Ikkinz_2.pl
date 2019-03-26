sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from death of Flesh_Hunter
    $counter += 1;
    }
   if($counter == 3) {
     quest::spawn2(294143,0,0,480,-592,-50,128); # NPC: a_pile_of_bones
     quest::spawn2(294144,0,0,476,-640,-50,116); # NPC: a_pile_of_bones
	 quest::ze(0,"The Tri-Fate Hunters have been defeated! Though the legion may send replacements, you have finished what you sought out to do and delayed their progress for a time! Congratulations!");
  	my @nlist = $entity_list->GetClientList();
	foreach my $n (@nlist){
		$n->SendMarqueeMessage(10,510,1,1,6000,"The Tri-Fate Hunters have been defeated! Congratulations!");
	}
  }
}
