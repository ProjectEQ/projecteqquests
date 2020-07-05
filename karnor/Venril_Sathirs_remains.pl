# pulsing green stone - ranger/druid epic
#
# items: 10295

my $x;
my $y;
my $z;
my $h;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The living fire. I seek the fires of life. Bring them.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10295 => 1)) {
    quest::emote("grasps the glowing sphere of fireflies from your hands. Tendrils of mystical energy begin to flow forth from the swarm of glowing insects like tiny fingers. The glowing tendrils begin to reach into the ribcage of the rotting remains of Venril Sathir, coalescing into the form of an iksar ghost.");
    $x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();
    $h = $npc->GetHeading();
    quest::spawn2(102123,0,0,$x,$y,$z,$h); # NPC: Spirit_of_Venril_Sathir
    quest::depop_withtimer();
  }
}

sub EVENT_SPAWN {
  quest::settimer(1,20);
}
sub EVENT_TIMER {
  if ($entity_list->IsMobSpawnedByNpcTypeID(102112)) {
    quest::stoptimer(1);
    quest::depop_withtimer();
  }
}


# EOF zone: karnor ID: 102099 NPC: Venril_Sathirs_remains

