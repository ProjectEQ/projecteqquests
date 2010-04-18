
## Blane Darkblade
## Created April 17, 2010 by mrhodes
##


sub EVENT_SAY {
   if($text=~/hail/i)
    {
       if(quest::istaskactivityactive(201, 0))
        {
           quest::updatetaskactivity(201, 0);
        }
       quest::say("Hello $name!");      # TODO: update text
    }
}