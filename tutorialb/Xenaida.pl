# items: 59955, 59765
sub EVENT_SPAWN {
  quest::settimer("try_sit", 5);
}

sub EVENT_TIMER {
  if ($timer eq "try_sit") {
    quest::stoptimer("try_sit");
    $npc->SetAppearance(1);
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name.  I need some mushrooms to finish my healing potion for the wounded slaves.  I marked the location of some mushrooms on your map.  Can you bring one to me?  I'm rather busy here at the moment.");
    #mark map with 'X'?
    quest::popup("Maps", "<br>You may bring up your map window by pressing the <c \"#00F0F0\">[M]</c> key.  You should see the Gloomingdeep Mushrooms labeled on your map.  You should also see your  current position on the map represented by the Arrow (notice it moves as you move).<br><br><c \"#F07F00\">Use your map to find the Gloomingdeep Mushroom. Pick one by <c \"#00F0F0\">left clicking</c> on it, and deliver it to Xenaida to continue.</c>", 111);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 59955 => 1)) {
    quest::say("Thanks!  Very helpful!"); 
    #quest::summonitem(59765); # Item: Shimmering Vial of Vigor -- This doesn't happen on Live
    quest::updatetaskactivity(1448, 4);
  }
  plugin::return_items(\%itemcount);
}