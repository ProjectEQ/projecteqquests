sub EVENT_SPAWN {
quest::settimer("champion",1);
  }
   
   
sub EVENT_TIMER { #depop doesn't work well with sub EVENT_SPAWN
$elemrest = $entity_list->GetMobByNpcTypeID(278124);
$furiousmagma = $entity_list->GetMobByNpcTypeID(278123);
$inflamedchamp = $entity_list->GetMobByNpcTypeID(278122);
$protectorfire = $entity_list->GetMobByNpcTypeID(278109);

if ($timer eq "champion") {
if ($elemrest || $furiousmagma || $inflamedchamp || $protectorfire) {
  quest::stoptimer("champion");
  quest::depop();
  } 
   }
    }
   
sub EVENT_DEATH {
  quest::signalwith(278125,90,0);
  }