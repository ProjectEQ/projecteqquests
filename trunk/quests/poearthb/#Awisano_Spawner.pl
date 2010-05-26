sub EVENT_SPAWN
{
   quest::settimer("depop",60);
}

sub EVENT_TIMER
{
          $check_boss = $entity_list->GetMobByNpcTypeID(222002);#myrmadon_of_stone

          if (!$check_boss && !defined $qglobals{poeb_Awisano} && !defined $qglobals{poeb_warlord}) {
              quest::spawn2(222016,0,0,$x,$y,$z,$h);
              quest::stoptimer("depop");
              quest::depop();
          }
} 