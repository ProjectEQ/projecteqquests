# on death of Eternal Spirit, two a soul harvester spawn
#

my $x;
my $y;
my $z;
my $h;
my $entid1;
my $entid2;
my $mob1;
my $mob2;
my $mobnpc1;
my $mobnpc2;

sub EVENT_DEATH_COMPLETE {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
  $entid1 = quest::spawn2(71110,0,0,$x+10,$y,$z,$h);
  $entid2 = quest::spawn2(71110,0,0,$x-10,$y,$z,$h);
  $mob1 = $entity_list->GetMobID($entid1);
  $mob2 = $entity_list->GetMobID($entid2);
  $mobnpc1 = $mob1->CastToNPC();
  $mobnpc2 = $mob2->CastToNPC();
  $mobnpc1->AddToHateList($npc->GetHateTop());
  $mobnpc2->AddToHateList($npc->GetHateTop());
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 57081 =>1)) {
    quest::emote("beams and looks at you with pride.");
    quest::say("Greetings, $class. I am both glad to see you and somewhat sad. I know you are here to retrieve my talisman -- which is the reason for my weeping heart. I do understand the importance of taking it for the Ruchu. My heart does warm, though, at the sight of a $class in pursuit of great things. I am envious. Here, take the talisman and protect it with your life. I should like to see it again after all has been set right.");
    quest::summonitem(57083);   
  }
  plugin::return_items(\%itemcount);
}