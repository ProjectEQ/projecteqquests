# soulbound hammer - ranger epic
#

my $x;
my $y;
my $z;
my $h;
my $entid1;
my $mob1;
my $mob1attack;

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
  quest::settimer("chatter",10);
}

sub EVENT_EXIT {
  quest::stoptimer("chatter");
}

sub EVENT_TIMER {
  if ($timer eq "chatter") {
    quest::emote("whimpers pathetically as his reflection catches his eye. He turns and stares pitifully at the ceiling.");
    quest::emote("shields his eyes from his reflection in the water, occasionally gibbering as he scratches at a flapping, rotted patch of skin on his sunken face. In his arms he cradles something. He seems to emanate an aura of power.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 17860 => 1)) {
    quest::emote("howls in anger, his body seeming to suck energy from the walls around him as he sees his reflection. He pulls a hammer from the bundle in his arms and swings fiercely at your head.");
    $x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();
    $h = $npc->GetHeading();
    $entid1 = quest::spawn2(39154,0,0,$x,$y,$z,$h);
    $mob1 = $entity_list->GetMobID($entid1);
    $mob1attack = $mob1->CastToNPC();
    $mob1attack->AddToHateList($client, 1);
    quest::depop_withtimer();
    quest::stoptimer("chatter");
    quest::clear_proximity();
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("chatter");
  quest::clear_proximity();
}

# EOF zone: hole ID: 39041 NPC: Jaeil_the_Wretched

