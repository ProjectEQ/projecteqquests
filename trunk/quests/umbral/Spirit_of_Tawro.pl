#despawns Spirit of Tawro 1 minute before Tawro Icequake respawns
sub EVENT_SPAWN
{
   quest::settimer(1, 1140);    
}
 
sub EVENT_TIMER
{
   if($timername == 1)
   {
      quest::depop_withtimer();
   }

}