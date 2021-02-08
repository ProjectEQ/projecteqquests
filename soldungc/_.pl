#Elemental Ring Event Counter. NPC 278125 has no name so emotes show up properly. 
  
 my $elemwave = 0; 
 my $elemwavea = 0; 
 my $elemwaveb = 0;
 my $wiz1dot5 = 0;
  
 sub EVENT_SPAWN { 
 $elemwave = 0; 
 $elemwavea = 0; 
 $elemwaveb = 0; 
 } 
  
 sub EVENT_SIGNAL { 
   if ($signal == 90) { 
     $elemwave += 1; 
   } 
   if ($signal == 91) { 
     $elemwavea += 1; 
   } 
   if ($signal == 92) { 
     $elemwaveb += 1; 
   } 
   if ($signal == 93) { 
    quest::spawn2(278124,0,0,0,0,0,0); # NPC: #elemental_reset
    quest::depop_withtimer(); 
   }
   if ($signal == 100 and $elemwave == 0 and $elemwavea == 0 and $elemwaveb == 0)  {
    $wiz1dot5 = 1;
   }
   if ($elemwave == 8) {  
    quest::emote("The room grows warmer as the lava pool begins to steam heavily."); 
    quest::spawn2(278123,0,0,-203,-61,-17.5,390); # NPC: a_furious_magma_guardian
    quest::spawn2(278123,0,0,-207,-124,-17.5,390); # NPC: a_furious_magma_guardian
    quest::spawn2(278123,0,0,-262,-130,-17.5,390); # NPC: a_furious_magma_guardian
    quest::spawn2(278123,0,0,-256,-54,-17.5,390); # NPC: a_furious_magma_guardian
    $elemwave = 0; 
    } 
   if ($elemwavea == 4) {  
    quest::emote("The lava starts to bubble and churn. Dark shapes move beneath the molten rock."); 
    quest::spawn2(278122,0,0,-163,-95,-13.9,0); # NPC: an_inflamed_champion
    quest::spawn2(278122,0,0,-301,-94,-14,0); # NPC: an_inflamed_champion
    $elemwavea = 0; 
    } 
   if ($elemwaveb == 2) {  
    quest::emote("The pool of lava begins to boil furiously. Something large is growing within."); 
    if ($wiz1dot5 == 1) {
	  quest::spawn2(278108,0,0,-230,-94,-16.8,0); #Spawn Wiz 1.5; Pure_Flame_Elemental
	}
	else {
	  quest::spawn2(278109,0,0,-230,-94,-16.8,0); #Protect_of_Fire 
    }
	$elemwaveb = 0;
	$wiz1dot5 = 0;
    } 
}  
