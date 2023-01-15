# items: 63105
my $entid1;
my $mob1;
my $mobnpc1;

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 63105 => 1)) { # Thrice Notched Guja Token
      quest::say("Ah . . .$name . . .yes . . . we've been waiting for you . . . ATTACK!");
	  quest::attack($name);
      $entid1 = quest::spawn2(47206, 0, 0, -235.64, -374.79, -17.91, 0); # Spawn Thugat_the_Champion
	  $mob1 = $entity_list->GetMobID($entid1);
	  $mobnpc1 = $mob->CastToNPC();
	  $mobnpc1->AddToHateList($npc->GetHateTop());
   }
}
