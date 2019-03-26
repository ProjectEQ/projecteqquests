# spawn 2 rounds of adds during acidic mass encounter
# first round at 66% - 1 ooze
# second round at 33%  - 2 swirling ooze
# after 1 and a half hour he despawns

my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN {
     quest::settimer("depop",5400);
     quest::setnexthpevent(66);
}

sub EVENT_HP {
    if($hpevent == 66) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(48004,0,0,$x - 10,$y,$z,$h); # NPC: an_ooze
        quest::setnexthpevent(33);
    }
    if($hpevent == 33) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(48001,0,0,$x - 10,$y,$z,$h); # NPC: a_swirling_ooze
        quest::spawn2(48001,0,0,$x + 10,$y,$z,$h); # NPC: a_swirling_ooze
    }
}

sub EVENT_TIMER {
       quest::depop();
       quest::stoptimer("depop");
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("depop");
}

# EOF zone: Cazicthule ID: NPC: #an_acidic_mass