#riwwiarena global to determine if event is active
#bic_riw global to determine if event can be started


sub EVENT_SAY {
  if ($text=~/hail/i) {
  if (defined $qglobals{bic_riw} && $qglobals{bic_riw} == 8 && !defined $qglobals{riwwiarena}) {
     quest::say("It's you! The champion everyone has spoken of! Have you come to defy the Muramites?");
     quest::setglobal("riwwiarena",1,5,"H8");
    }
     }
  if ($text=~/hail/i) {
   if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 1) {
       quest::say("You are very strong. If you wish to challenge the Muramites, hand me the item Turlini gave you and I will gain their attention again.");
     }
     }
  if ($text=~/defy/i) {
   if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} >= 1) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
     quest::depop(282096);
     quest::depop(282026);
     quest::unique_spawn(282098,0,0,-174,625,73,129);  #officaitor
     quest::summonitem(52223);   #satchel I

 }
 }
 }
sub EVENT_SIGNAL {
  if($signal == 1) { 
    quest::say("Stand fast and prepare for a fight! They're sending a bloodthirsty beast into the arena to kill you as we speak. If you defeat it, place the head in this sack as proof and return it to Turlini. He is the leader of the resistance and may be able to assist you for helping us.");

} 
}
sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 52085 =>1 )) {
      if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 2) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,1,5);   #officiator
  quest::summonitem(52224);   #satchel II
   }
   }
   if (plugin::check_handin(\%itemcount, 52086 =>1 )) {
      if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 3) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,2,5);   #officiator
  quest::summonitem(52225);   #satchel III
    }
    }
   if (plugin::check_handin(\%itemcount, 52087 =>1 )) {
      if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 4) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,3,5);   #officiator
  quest::summonitem(52226);   #satchel IV
  }
 }
    if (plugin::check_handin(\%itemcount, 52088 =>1 )) {
       if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 5) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,4,5);   #officiator
  quest::summonitem(52227);   #satchel V   
  }
  }
    if (plugin::check_handin(\%itemcount, 52089 =>1 )) {
       if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 6) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,5,5);   #officiator
  quest::summonitem(52228);   #satchel VI   
  }
  }
    if (plugin::check_handin(\%itemcount, 52090 =>1 )) {
       if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 7) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,6,5);   #officiator
  quest::summonitem(52229);   #satchel VII   
  }
  }
    if (plugin::check_handin(\%itemcount, 52091 =>1 )) {
       if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 8) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,7,5);   #officiator
  quest::summonitem(52230);   #satchel VIII   
  }  
  }
    if (plugin::check_handin(\%itemcount, 52092 =>1 )) {
       if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 9) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,8,5);   #officiator
  quest::summonitem(52231);   #satchel IX   
  }  
  }
    if (plugin::check_handin(\%itemcount, 52093 =>1 )) {
       if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 10) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
  quest::signalwith(282098,9,5);   #officiator
  quest::summonitem(52232);   #satchel IX   
  }      
  }
  plugin::return_items(\%itemcount);
}
