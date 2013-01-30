#despawns Spirit of Radir 1 minute before Radir Fireshower respawns
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