sub EVENT_SAY 
{ 
	if($text=~/Hail/i){
		quest::say("Why. hello there!!  Welcome to the Church of Mischief.  I am Hendi Mrubble. The 'R' is silent.  I am the resident healer of the church. so if you are in [need of healing]. or want me to [cure poison] or [cure disease]. let me know.  If you've got a touch of the crazy brain. I can't do a thing for you.");
	}
	if($text=~/healing/i)
	{
		quest::say("Hmmm.  I would love to help you with that. but you will have to make a donation to the temple.  The Guardians asked me to charge one of the Rivervale piranha teeth.");
	}
	if($text=~/cure disease/i)
	{
		quest::say("Eeww!! Careful. don't touch Hendi.  I figured there must have been something not quite right about you.  Well. now. before we can cast the disease from your body you will have to make a little donation of one gold for the service and eight gold to disinfect this place.  That would be 10 total!!  Let's see it.");
	}
	if($text=~/cure poison/i)
	{
		quest::say("Cure poison. eh?  Before we do that. you must fetch me three bixie stingers."); 
	}
}

sub EVENT_ITEM
   {
   if ($gold == 10)
      {
      quest::say("May the swift and silent spirit of Fizzlethorpe Bristlebane smile upon your frail soul.");
      $npc->CastSpell(213,$userid);
      }
   elsif (plugin::check_handin(\%itemcount, 14029 => 3))
      {
      quest::say("May the swift and silent spirit of Fizzlethorpe Bristlebane smile upon your frail soul.");
      $npc->CastSpell(203,$userid);
      }
   elsif (plugin::check_handin(\%itemcount, 13870 => 1))
      {
      quest::say("May the swift and silent spirit of Fizzlethorpe Bristlebane smile upon your frail soul.");
      $npc->CastSpell(12,$userid);
      }
   plugin::return_items(\%itemcount);
   }
#END of FILE Zone:rivervale  ID:19067 -- Hendi_Mrubble 

