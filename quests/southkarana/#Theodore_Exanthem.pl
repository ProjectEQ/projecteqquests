# #Theodore_Exantham in south karana

my $count = 0;

sub EVENT_SPAWN {
  $count = 0;
}

sub EVENT_SAY {
  if($text=~/take us to the location/i) {
    $count++;
    if ($count == 1) {
      quest::emote("reels back, his eyes wide with shock. 'Ow,' he says nervously.");
      quest::signalwith(14050,5,3000);
    }
    if ($count == 2) {
      quest::emote("winces and says, 'Oh. Yeah right. Like I'm afraid of that moron or something.'");
      quest::emote("glances nervously over at you.");
      quest::signalwith(14050,6,3000);
    }
    if ($count == 3) {
      quest::say("Fine follow me creeps.");
      quest::signalwith(14050,8,3000);
      quest::moveto(-3256,-6036,0);
    }
  }
}

sub EVENT_SIGNAL {
  if ($signal == 2) {
    quest::say("I think you've been breathing the air in the Northern Plains of Karana for too long. I will most certainly not tell you anything about their whereabouts, much less lead you right to them. You are not right in the head.");
    quest::signalwith(14050,3,3000);
  }
  if ($signal == 4) {
    quest::say("What a joke! I'm not telling you a thing. You don't look like you could scare a moss snake. I'm not afraid of you!");
  }
  if ($signal == 9) {
    quest::depop();
  }
}

sub EVENT_ATTACK {
  quest::settimer(7,5);
}

sub EVENT_TIMER {
  if ($timer == 7) {
    quest::say("Sweet father of rot, alright already! Stop hitting me and tell me what you want me to do!");
    quest::stoptimer(7);
    $npc->WipeHateList();
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 2344 => 1)) {
    quest::summonitem(2395);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}