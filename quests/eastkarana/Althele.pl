# #20448 -> Althele to start corruptor/reaver spawns for fleshbound tome
#

my $depop1;
my $depop2;
my $depop3;
my $depop4;
my $depop5;
my $entid1;
my $entid2;
my $entid3;
my $mob1;
my $mob2;
my $mob3;
my $start;
my $moving;
my $depopnpc1;
my $depopnpc2;
my $depopnpc3;
my $depopnpc4;
my $depopnpc5;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, friend. Beautiful is what I would call such a day normally but lately?");
  }
  if ($text=~/your eyes/i) {
    quest::say("Yes. I cannot see any longer, my sight long since lost in the march of years. By the blessings of Tunare and Karana, though, I still make myself useful.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20448 => 1)) {
    quest::emote("looks at the coin and nods gravely at you as she slips it into a fold of her clothing. 'I see. The story of this coin speaks much to me as do the words you have given me. Telin sent word that you would arrive. The tidings you bring are ill indeed. Here, take this amulet and find Sionae. She is nearby. We will speak more on this matter when all are present.'");
    quest::summonitem(20450);
    quest::spawn2(15178,0,0,-1595,-2595,3.2,127); #spawn sionae
  }
  elsif (plugin::check_handin(\%itemcount, 20452 => 1)) {
    quest::emote("hands the book to Tholris who reads through it with lines of concern etched on his face, then whispers into her ear. 'Dire news, indeed. This cannot be allowed. I must keep this book but you, $name, must not allow Innoruuk to seed the land with his hatred and filth. You have only just begun your quest. The path you are guided upon will be difficult, if not impossible, but someone must finish it. Please, take this, read of it, follow its instructions. Tunare bless your path and Karana watch over you.");
    quest::exp(100000);
    quest::summonitem(18959);
    $depop1 = $entity_list->GetMobByNpcTypeID(15178); #despawn the druids
    $depop2 = $entity_list->GetMobByNpcTypeID(15167);
    $depop3 = $entity_list->GetMobByNpcTypeID(15170);
    $depop4 = $entity_list->GetMobByNpcTypeID(15043);
    $depop5 = $entity_list->GetMobByNpcTypeID(15042);
    
    if ($depop1) {
      $depopnpc1 = $depop1->CastToNPC();
      $depopnpc1->Depop();
    }
    if ($depop2) {
      $depopnpc2 = $depop2->CastToNPC();
      $depopnpc2->Depop();
    }
    if ($depop3) {
      $depopnpc3 = $depop3->CastToNPC();
      $depopnpc3->Depop();
    }
    if ($depop4) {
      $depopnpc4 = $depop4->CastToNPC();
      $depopnpc4->Depop();
    }
    if ($depop5) {
      $depopnpc5 = $depop5->CastToNPC();
      $depopnpc5->Depop();
    }
    quest::depop();
  }
  else {
    quest::emote("will not take this item.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_SIGNAL {
  if ($signal == 15178) {
    $start = $entity_list->GetMobByNpcTypeID(15178);
    $moving = $start->CastToNPC();
    $moving->SignalNPC(1);
  }
  elsif ($signal == 15167) {
    $start = $entity_list->GetMobByNpcTypeID(15167);
    $moving = $start->CastToNPC();
    $moving->SignalNPC(1);
  }
  else {
  quest::settimer("prep",90);
  quest::settimer("attack",120);
  quest::settimer("depop",600);
  $start = $entity_list->GetMobByNpcTypeID(15170);
  $moving = $start->CastToNPC();
  $moving->SignalNPC(1);
  }
}

sub EVENT_TIMER {  
  if ($timer eq "prep") { # gives the last druid, teloa, time to walk to the gathering
    quest::stoptimer("prep");    
    quest::say("Great mother of life and father of sky, growth and spirit, Tunare and Karana. Innoruuk once again schemes and we have failed in our duties to protect our land. We give our powers in sacrifice for your help. Heed our call and send us your wisdom.");
    quest::signalwith(15178,99,3);
    quest::signalwith(15167,99,6);
    quest::signalwith(15170,99,9);
    quest::signalwith(15043,99,12);
  }
  elsif ($timer eq "attack") { #dark elves start to make their way to the gathering
    quest::stoptimer("attack");
    quest::emote("snaps her head towards you. 'Innoruuk's brood is upon us. Go, find the spawn of hatred before they reach this point and destroy them!");

    $entid1 = quest::spawn2(15153,0,0,-1353,-760,89.3,130); #corruptor
    $entid2 = quest::spawn2(15150,0,0,-1376,-758,84.4,130); #reaver
    $entid3 = quest::spawn2(15150,0,0,-1399,-756,85.5,130); #reaver
    
    $mob1 = $entity_list->GetMobID($entid1);
    $mob2 = $entity_list->GetMobID($entid2);
    $mob3 = $entity_list->GetMobID($entid3);
    
    my $mob1attack = $mob1->CastToNPC();
    my $mob2attack = $mob2->CastToNPC();
    my $mob3attack = $mob3->CastToNPC();
    
    $mob1attack->AddToHateList($npc, 1);
    $mob2attack->AddToHateList($npc, 1);
    $mob3attack->AddToHateList($npc, 1);
  }
  elsif ($timer eq "depop") { #something might have gone wrong resetting the druids after 10 minutes
    quest::stoptimer("depop");
    $depop1 = $entity_list->GetMobByNpcTypeID(15178);
    $depop2 = $entity_list->GetMobByNpcTypeID(15167);
    $depop3 = $entity_list->GetMobByNpcTypeID(15170);
    
    if ($depop1) {
      $depopnpc1 = $depop1->CastToNPC();
      $depopnpc1->Depop();
    }
    if ($depop2) {
      $depopnpc2 = $depop2->CastToNPC();
      $depopnpc2->Depop();
    }
    if ($depop3) {
      $depopnpc3 = $depop3->CastToNPC();
      $depopnpc3->Depop();
    }
  }
}

# EOF zone: eastkarana ID: 15044 NPC: Althele

