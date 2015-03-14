#All text made up

my $wave;

sub EVENT_SPAWN {
  $wave = 0;
  quest::say("Well, well! I was not sure if you would show. I hope you and your friends are strong enough to help me while I search for these new research components.");
  quest::emote("looks around. 'Looks like the way is safe. Let's go before we are noticed by the creatures of the night.'");
  quest::start(124);
}

sub EVENT_WAYPOINT_ARRIVE {
  if (($wp == 4) && ($wave == 0)) {
    $wave1_1 = quest::spawn2(204072,0,0,$x+20,$y+20,$z,$h);
    $wave1_2 = quest::spawn2(204072,0,0,$x-20,$y-20,$z,$h);
    $wave1_3 = quest::spawn2(204072,0,0,$x+20,$y-20,$z,$h);
    $wave1_4 = quest::spawn2(204072,0,0,$x-20,$y+20,$z,$h);
    $wave1_obj1 = $entity_list->GetMobID($wave1_1);
    $wave1_obj2 = $entity_list->GetMobID($wave1_2);
    $wave1_obj3 = $entity_list->GetMobID($wave1_3);
    $wave1_obj4 = $entity_list->GetMobID($wave1_4);
    $wave1_npc1 = $wave1_obj1->CastToNPC();
    $wave1_npc2 = $wave1_obj2->CastToNPC();
    $wave1_npc3 = $wave1_obj3->CastToNPC();
    $wave1_npc4 = $wave1_obj4->CastToNPC();
    $wave1_npc1->AddToHateList($npc,1);
    $wave1_npc2->AddToHateList($npc,1);
    $wave1_npc3->AddToHateList($npc,1);
    $wave1_npc4->AddToHateList($npc,1);
    $wave = 1;
  }
  if (($wp == 10) && ($wave == 1)) {
    $wave2_1 = quest::spawn2(204073,0,0,$x+20,$y+20,$z,$h);
    $wave2_2 = quest::spawn2(204073,0,0,$x-20,$y-20,$z,$h);
    $wave2_obj1 = $entity_list->GetMobID($wave2_1);
    $wave2_obj2 = $entity_list->GetMobID($wave2_2);
    $wave2_npc1 = $wave2_obj1->CastToNPC();
    $wave2_npc2 = $wave2_obj2->CastToNPC();
    $wave2_npc1->AddToHateList($npc,1);
    $wave2_npc2->AddToHateList($npc,1);
    $wave = 2;
  }
  if (($wp == 19) && ($wave == 2)) {
    $wave3_1 = quest::spawn2(204074,0,0,$x+20,$y+20,$z,$h);
    $wave3_2 = quest::spawn2(204074,0,0,$x-20,$y-20,$z,$h);
    $wave3_3 = quest::spawn2(204074,0,0,$x+20,$y-20,$z,$h);
    $wave3_4 = quest::spawn2(204074,0,0,$x-20,$y+20,$z,$h);
    $wave3_obj1 = $entity_list->GetMobID($wave3_1);
    $wave3_obj2 = $entity_list->GetMobID($wave3_2);
    $wave3_obj3 = $entity_list->GetMobID($wave3_3);
    $wave3_obj4 = $entity_list->GetMobID($wave3_4);
    $wave3_npc1 = $wave3_obj1->CastToNPC();
    $wave3_npc2 = $wave3_obj2->CastToNPC();
    $wave3_npc3 = $wave3_obj3->CastToNPC();
    $wave3_npc4 = $wave3_obj4->CastToNPC();
    $wave3_npc1->AddToHateList($npc,1);
    $wave3_npc2->AddToHateList($npc,1);
    $wave3_npc3->AddToHateList($npc,1);
    $wave3_npc4->AddToHateList($npc,1);
    $wave = 3;
  }
  if (($wp == 24) && ($wave == 3)) {
    $wave4_1 = quest::spawn2(204072,0,0,$x+20,$y,$z,$h);
    $wave4_2 = quest::spawn2(204072,0,0,$x-20,$y,$z,$h);
    $wave4_3 = quest::spawn2(204072,0,0,$x,$y-20,$z,$h);
    $wave4_4 = quest::spawn2(204075,0,0,$x+20,$y+20,$z,$h);
    $wave4_5 = quest::spawn2(204075,0,0,$x-20,$y-20,$z,$h);
    $wave4_6 = quest::spawn2(204075,0,0,$x+20,$y-20,$z,$h);
    $wave4_obj1 = $entity_list->GetMobID($wave4_1);
    $wave4_obj2 = $entity_list->GetMobID($wave4_2);
    $wave4_obj3 = $entity_list->GetMobID($wave4_3);
    $wave4_obj4 = $entity_list->GetMobID($wave4_4);
    $wave4_obj5 = $entity_list->GetMobID($wave4_5);
    $wave4_obj6 = $entity_list->GetMobID($wave4_6);
    $wave4_npc1 = $wave4_obj1->CastToNPC();
    $wave4_npc2 = $wave4_obj2->CastToNPC();
    $wave4_npc3 = $wave4_obj3->CastToNPC();
    $wave4_npc4 = $wave4_obj4->CastToNPC();
    $wave4_npc5 = $wave4_obj5->CastToNPC();
    $wave4_npc6 = $wave4_obj6->CastToNPC();
    $wave4_npc1->AddToHateList($npc,1);
    $wave4_npc2->AddToHateList($npc,1);
    $wave4_npc3->AddToHateList($npc,1);
    $wave4_npc4->AddToHateList($npc,1);
    $wave4_npc5->AddToHateList($npc,1);
    $wave4_npc6->AddToHateList($npc,1);
    $wave = 4;
  }
  if ($wp == 25) {
    quest::say("What a tiring evening. Perhaps we should rest here for a while?");
    $npc->SetAppearance(1);
  }
  if (($wp == 26) && ($wave == 4)) {
    $wave5_1 = quest::spawn2(204076,0,0,$x+20,$y+20,$z,$h);
    $wave5_obj1 = $entity_list->GetMobID($wave5_1);
    $wave5_npc1 = $wave5_obj1->CastToNPC();
    $wave5_npc1->AddToHateList($npc,1);
    $wave = 5;
  }
  if ($wp == 27) {
    quest::say("We made it! No doubt I could not have made it without you. Did you find something useful during our trip? May I have it?");
  }
}

sub EVENT_WAYPOINT_DEPART {
  if ($wp == 25) {
    quest::say("We should get moving.");
    $npc->SetAppearance(0);
  }
  if ($wp == 27) {
    quest::say("I must leave this place now.");
    quest::depop();
  }
}

sub EVENT_ITEM {
  if (($x == 1690) && ($y == 285) && ($wave == 5) && plugin::check_handin(\%itemcount, 16261 => 1)) {
    quest::say("Excellent work, $name. That is exactly why I came to this dreadful place. Thank you for your help. Here, take this. I must get back to the Plane of Knowledge. Come and see me when you get a chance.");
    quest::summonitem(16260); #Tiny Gold Fist
    quest::setglobal("AidEinoDone",1,5,"F");
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}
