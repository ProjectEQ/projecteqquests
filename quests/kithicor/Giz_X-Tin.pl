# Faelin's Ring -> Giz X`Tin -> Dark Metal Coin
#

my $x;
my $y;
my $z;
my $h;

sub EVENT_ITEM {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();

  if (plugin::check_handin(\%itemcount, 20446 => 1)) {
    $x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();
    $h = $npc->GetHeading();
    quest::emote("flips you a coin after he recognizes the ring. 'It seems we have a mutual 'acquaintance.' The coin repays an old debt. You don't have to worry about what that is. Luckily, Lord Innoruuk has informed me of your coming and your desires. Fortunately, I have all the answers you require right here at the end of my friend's blade. I think I'll be paying my old 'friend' a visit.'");
    quest::summonitem(20447);
    my $reaver = quest::spawn2(20190,0,0,$x+20,$y+20,$z,$h);
    my $attack = $entity_list->GetMobID($reaver);
    my $reaverattack = $attack->CastToNPC();
    $reaverattack->AddToHateList($client, 1);
  }
  else {
    quest::emote("will not take the item.");
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: kithicor ID: 20058 NPC: Giz_X`tin

