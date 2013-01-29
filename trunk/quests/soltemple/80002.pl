my $engaged =  0;

sub EVENT_SPAWN {
  if (($zonehour < 9) || ($zonehour > 21)) { #9AM to 9PM
    quest::depop_withtimer();
  }
  else {
    quest::settimer("seeker_depop", 30);
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    $engaged = 1;
  }
  else {
    $engaged = 0;
  }
}

sub EVENT_TIMER {
  if (!$engaged && (($zonehour < 9) || ($zonehour > 21))) {
    quest::stoptimer("seeker_depop");
    quest::depop_withtimer();
  }
}

sub EVENT_DEATH {
  quest::stoptimer("seeker_depop");
}
 
sub EVENT_SAY {
  if ($text=~/solusek ro/i) {
    quest::say("Solusek Ro is the Master of Fire and the Keeper of Power.");
  }
  if ($text=~/plasmatic priest/i) {
    quest::say("You speak of things that should not be spoken! It would be in your best interest to leave this temple at once and return to lands less consumed by flame!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28051 => 1)) { #Coral Statue of Tarew
    quest::emote("shakes violently as his hand closes on the coral statue and flames dance in the depths of his eyes! The statue begins to emit a reddish glow then shatters in a burst of fire and smoke! The flames in the plasmatic priest's eyes vanish with the explosion and only madness remains!");
    quest::say("The Triumvirate thinks that destroying my spirit of flame will stop me?!! I will kill you all now, the goblins will continue to war, and when my spirit is restored I will ensure that Ixiblat Fer consumes all of Norrath in his flames!!");
    $priest = quest::spawn2(80042,0,0,$x,$y,$z,0); #a_plasmatic_priest
    $attack = $entity_list->GetMobID($priest);
    $priestattack = $attack->CastToNPC();
    $priestattack->AddToHateList($client, 1);
    quest::depop_withtimer();
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#End of File, Zone:soltemple  NPC:80002 -- a_seeker (quest)