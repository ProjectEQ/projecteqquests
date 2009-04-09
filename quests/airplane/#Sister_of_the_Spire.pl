sub EVENT_DEATH

{

   $x = $npc->GetX();

   $y = $npc->GetY();

   $z = $npc->GetZ();

   $sirran= undef;


   quest::setglobal(sirran,7,3,"M10");

   quest::spawn(71058,0,0,$x,$y,$z);
} 