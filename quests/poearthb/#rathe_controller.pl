sub EVENT_SPAWN { 
   quest::spawn_condition($zonesn,1,0); #Make sure we aren't up yet.
 if (defined $qglobals{poeb_rathe}){
   quest::settimer("rathe",1); #waiting for the global to expire to pop rathe
   }
 if (!defined $qglobals{poeb_rathe}) { 
   quest::spawn_condition($zonesn,1,1); #Rathe pop 
   quest::settimer("avatar",1); 
   } 
} 

sub EVENT_SIGNAL {
  quest::settimer("rathe",1);
}

sub EVENT_TIMER { 
  if ($timer eq "rathe" && !defined $qglobals{poeb_rathe}) {
      quest::stoptimer("rathe");
      quest::spawn_condition($zonesn,1,1); #Rathe pop 
      quest::settimer("avatar",1); #waiting for rathe to go down to pop avatar
  }
  if ($timer eq "avatar" && !defined $qglobals{poeb_rathe}) { 
      $boss = 0; 
      $check_boss = $entity_list->GetMobByNpcTypeID(222008); 
         if($check_boss) { 
            $boss = 1; 
         } 
      $check_boss = $entity_list->GetMobByNpcTypeID(222013); 
         if($check_boss) { 
            $boss = 1; 
         } 
      if($boss == 0) { 
         quest::stoptimer("avatar"); 
         quest::spawn_condition($zonesn,1,0); #Rathe depop 
         quest::spawn2(222014,0,0,2051.1,407.7,-219.2,0); #Avatar of Earth pop 
      } 
   } 
} 
