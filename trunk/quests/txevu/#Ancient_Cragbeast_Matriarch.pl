# timer 1 checks for different bearers being up

sub EVENT_AGGRO {
  quest::settimer(1,15);
}
sub EVENT_TIMER {
  if($timer == 1) {
    if (!$entity_list->IsMobSpawnedByNpcTypeID(297050)) { #Bearer of Nascency
      } else {
      quest::spawn2(281096,0,0,$x+5,$y,$z,$h);  #mini cragbeast 297210
    }
    if (!$entity_list->IsMobSpawnedByNpcTypeID(297051) || !$entity_list->IsMobSpawnedByNpcTypeID(297143)) { #Bearer of Intensity
      quest::modifynpcstat("max_hit",2025);
    } else {
      quest::modifynpcstat("max_hit",4500);
      }
    if (!$entity_list->IsMobSpawnedByNpcTypeID(297054) || !$entity_list->IsMobSpawnedByNpcTypeID(297172)) { #Bearer of Mending
      quest::modifynpcstat("hp_regen",100);
    } else {
      quest::modifynpcstat("hp_regen",4500);
    }
    if ($entity_list->IsMobSpawnedByNpcTypeID(297191)) { #Bearer of Sheilding
      quest::selfcast(1249);  #bristling armament
    }
    if ($entity_list->IsMobSpawnedByNpcTypeID(297208)) { #Bearer of Projection
      quest::selfcast(1239);  #devouring conflaguration
    }
    if ($entity_list->IsMobSpawnedByNpcTypeID(297052) || !$entity_list->IsMobSpawnedByNpcTypeID(297144)) { #Bearer of Reflection
      quest::selfcast(4741);  #discord reflection
    }
    if (!$entity_list->IsMobSpawnedByNpcTypeID(297142) || !$entity_list->IsMobSpawnedByNpcTypeID(297192)) { #Bearer of Quickening
      quest::modifynpcstat("attack_speed",-22);
    } else {
      quest::modifynpcstat("attack_speed",-40);
    }
    if (!$entity_list->IsMobSpawnedByNpcTypeID(297141) || !$entity_list->IsMobSpawnedByNpcTypeID(297189)) { #Bearer of Resistance
      quest::modifynpcstat("mr",136);
      quest::modifynpcstat("fr",136);
      quest::modifynpcstat("cr",136);
      quest::modifynpcstat("pr",136);
      quest::modifynpcstat("dr",136);
    } else {
      quest::modifynpcstat("mr",236);
      quest::modifynpcstat("fr",236);
      quest::modifynpcstat("cr",236);
      quest::modifynpcstat("pr",236);
      quest::modifynpcstat("dr",236);
    }
    if ($entity_list->IsMobSpawnedByNpcTypeID(297143)) { #Bearer of Absorption
      quest::selfcast(8868);  #needs to mitigate 75% of dmg, best choice is spell based, not ideal
    }
    if (!$entity_list->IsMobSpawnedByNpcTypeID(297055) || !$entity_list->IsMobSpawnedByNpcTypeID(297145) && !$entity_list->IsMobSpawnedByNpcTypeID(297053) && !$entity_list->IsMobSpawnedByNpcTypeID(297190)) { #Bearer of Anger, Rage, Haste
      quest::modifynpcstat("special_attacks",SQUMCNIDf); #sets to normal
      }
      elsif ($entity_list->IsMobSpawnedByNpcTypeID(297055) || $entity_list->IsMobSpawnedByNpcTypeID(297145) && $entity_list->IsMobSpawnedByNpcTypeID(297053) && !$entity_list->IsMobSpawnedByNpcTypeID(297190)) {  #bearer of Anger & Rage up
        quest::modifynpcstat("special_attacks",SQRrUMCNIDf);
      }
      elsif ($entity_list->IsMobSpawnedByNpcTypeID(297055) || $entity_list->IsMobSpawnedByNpcTypeID(297145) && $entity_list->IsMobSpawnedByNpcTypeID(297190) && !$entity_list->IsMobSpawnedByNpcTypeID(297053)) {  #bearer of Anger and Haste up
        quest::modifynpcstat("special_attacks",SQRFUMCNIDf);
      }
      elsif ($entity_list->IsMobSpawnedByNpcTypeID(297053) && $entity_list->IsMobSpawnedByNpcTypeID(297190) && !$entity_list->IsMobSpawnedByNpcTypeID(297055) || !$entity_list->IsMobSpawnedByNpcTypeID(297145)) {  #bearer of Rage and Haste up
        quest::modifynpcstat("special_attacks",SQFrUMCNIDf);
      }
      elsif ($entity_list->IsMobSpawnedByNpcTypeID(297055) || $entity_list->IsMobSpawnedByNpcTypeID(297145) && !$entity_list->IsMobSpawnedByNpcTypeID(297053) && !$entity_list->IsMobSpawnedByNpcTypeID(297190)) { #bearer of Anger only
        quest::modifynpcstat("special_attacks",SQRUMCNIDf);
      }
      elsif ($entity_list->IsMobSpawnedByNpcTypeID(297053) && !$entity_list->IsMobSpawnedByNpcTypeID(297055) || !$entity_list->IsMobSpawnedByNpcTypeID(297145) && !$entity_list->IsMobSpawnedByNpcTypeID(297190)) { #bearer of Rage only
        quest::modifynpcstat("special_attacks",SQrUMCNIDf);
      }
      elsif ($entity_list->IsMobSpawnedByNpcTypeID(297190) && !$entity_list->IsMobSpawnedByNpcTypeID(297055) || !$entity_list->IsMobSpawnedByNpcTypeID(297145) && !$entity_list->IsMobSpawnedByNpcTypeID(297053)) { #bearer of Haste only
        quest::modifynpcstat("special_attacks",SQFUMCNIDf);
      } else {
      quest::modifynpcstat("special_attacks",SQRrFUMNIDf);  #all three up adds rampage, flurry, ae rampage
    }
  }
}
