# Epic NPC -- Keeper_of_Souls



sub EVENT_SPAWN {

    quest::settimer("summit",600);

 }



sub EVENT_TIMER {

  if ($timer eq "summit") {

    quest::stoptimer("summit");

    quest::depop();

 }

}



sub EVENT_DEATH

{

   $x = $npc->GetX();

   $y = $npc->GetY();

   $z = $npc->GetZ();

   $sirran= undef;

   
   quest::setglobal("sirran",4,3,"M10");

   quest::spawn(71058,0,0,$x,$y,$z);
} 



#END of FILE  Quest by: Solid11  Zone:airplane  ID:71075 -- Keeper_of_Souls



