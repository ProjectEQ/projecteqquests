# pulsing green stone - ranger/druid epic
#

my $x;
my $y;
my $z;
my $h;
my $entid1;
my $mob1;
my $mob1attack;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("So mortals, you seek to end the tainting of Tunare's children? So be it, I have no cares. My death has been caused by this foolishness and I want no more to do with it. Bring me a scroll with the knowledge of resurrection so that I may once again live. I will hand you that which you seek.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 15392 => 1)) {
    quest::say("I am alive! My thanks to you, $name. And now I will aid you in your quest for preserving the forests of norrath. Your carcass will help nurture the soils of the wilderness.");
   
    $x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();
    $h = $npc->GetHeading();
    $entid1 = quest::spawn2(102126,0,0,$x,$y,$z,$h);
    $mob1 = $entity_list->GetMobID($entid1);
    $mob1attack = $mob1->CastToNPC();
    $mob1attack->AddToHateList($client, 1);
    quest::depop();
  }
}

# EOF zone: karnor ID: 102123 NPC: Spirit_of_Venril_Sathir

