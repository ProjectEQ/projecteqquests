# items: 3457, 3459
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Good day to you $name, would you happen to have any boiled rockhopper eggs for sale? I'm so very hungry and they're my favorite food.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3457 => 4)) {
    quest::emote("devours all four of the eggs in the blink of an eye, 'Delicious! May the spirits bless you $name! Here are a few acrylia flakes for your trouble. I'll be happy to pay for more should you find yourself with any extra!");
    quest::summonitem(3459); # Item: Acrylia Flakes
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL 
	{
	quest::SetRunning(1);
	quest::shout("Guards, merchants, we cannot win this battle! Grab what you can carry and retreat back to Shar Vahl! Hurry!");
	quest::start(2);
	}

sub	EVENT_WAYPOINT_ARRIVE
	{
	if ($x == 2714)
		{
		# He reached his goal. Spead out
		quest::stop();
		quest::shout("Wait!  Guard the way to Shar Vahl!  We cannot let them advance any further.");
		quest::moveto(2645, 1206, 143.12,360,1);
		}
	}
