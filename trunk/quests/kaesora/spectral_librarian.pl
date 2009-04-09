# Test of Charm - enchanter epic - Enchanted Diamond
# 

my $x;
my $y;
my $z;
my $mob;
my $mobid;
my $mobattack;

sub EVENT_SAY {
  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10631 => 1)) {
    $x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();
    quest::say("You have no idea what it is like to be trapped in this place. Take your precious little stone and leave this place.");
    quest::summonitem(10618);
    quest::depop();
    $mob = quest::spawn2(88087,0,0,$x,$y,$z,0);
    $mobid = $entity_list->GetMobID($mob);
    $mobattack = $mobid->CastToNPC();
    $mobattack->AddToHateList($client, 1);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF Zone: kaesora ID: 88061 NPC: spectral_librarian

