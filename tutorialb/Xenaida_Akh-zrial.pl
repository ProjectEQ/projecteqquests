# items: 59955, 59765
sub EVENT_SPAWN
{
	quest::settimer("try_sit", 5);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(1);
	}
}

sub EVENT_DEATH_COMPLETE
{
	quest::stoptimer("try_sit");
}

sub EVENT_SAY {
   if ($text=~/hail/i){
		if(quest::istaskactivityactive(1448,3)) {
		quest::say("Greetings $name. I need some mushrooms to finish my healing potion for the wounded slaves. I marked the location of some mushrooms on your map. Can you bring one to me. I am rather busy here at the moment.");
		quest::popup("Maps", "<br><br>You may bring up your map window by pressing the [ <c \"#00c8f0\"> M </c>] key.  You should see the Gloomingdeep Mushrooms labled on your map. You should also see your current position on the map represented by the Arrow(notice if moves as you move).
		<br><br>
		<c \"#F07F00\"> Use your map to find the Gloomingdeep Mushroom. Pick one by</c> <c \"#00c8f0\"> left clicking </c> <c \"#F07F00\">on it, and deliver it to Xenaida to continue.</c>", 111);
   		}
   }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 59955 => 1) && quest::istaskactivityactive(1448,3)) {
    quest::say("Thanks! Very helpful!"); 
    quest::summonitem(59765); # Item: Shimmering Vial of Vigor
    quest::updatetaskactivity(1448,3);
  }
   elsif (plugin::check_handin(\%itemcount, 59955 => 1)) {
    quest::say("Thanks! Very helpful!"); 
    quest::summonitem(59765); # Item: Shimmering Vial of Vigor
  }
  plugin::return_items(\%itemcount);
}
