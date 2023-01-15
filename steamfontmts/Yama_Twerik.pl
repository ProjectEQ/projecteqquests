my $event; #Event state (Not Ready: -1, Ready: 0, Active: 1)
my $slave = 448169; #Inactive_Clockwork (steamfontmts)
my $normal_grid = 544340; #Normal pathing grid (steamfontmts)
my $event_grid = 544341; #Event pathing grid (steamfontmts)
my $player; #ID of player activating event
my $stage; #Event stage (0-5)
my $charge; #Clockwork waiting for charge

sub EVENT_SPAWN {
  RESET_EVENT();
}

sub EVENT_SAY {
  if ($event == 0) { #Event ready, not active
    if (defined($qglobals{wiz_epic_pre}) && ($qglobals{wiz_epic_pre} == 4)) {
      if ($text =~ /hail/i) {
        quest::say("Just in time! Talwyn said he might be sending me someone to help me with this particular predicament. You see, I need help with this guy here. His battery has gone dry and we can't find a way to recharge it. We think the clockworks of Innovation are powered through some kind of magical energy, different from what is stored in normal batteries. I would like you to use your best electrical magics to try and [resurrect his battery].");
      }
      if ($text =~ /resurrect his battery/i) {
        quest::say("Ok good, but here is the thing, we have to be really careful. I don't want to overcharge the battery, and you will have to cast on it while I am holding the correct wires together. If you don't do it at the right time you will either fry me, or it will be a waste and we will have to start completely over. Let me know when you have cleared your mind, regained your magical strength, and are [ready to start].");
      }
      if ($text =~ /ready to start/i) {
        quest::say("Excellent, then I shall begin performing my work.");
        $player = $client->CharacterID();
        $event = 1;
        quest::stop();
        quest::start($event_grid);
        quest::set_data("Yama_Event", "$player", "M20"); #Data bucket to hold player ID for 20 minutes
      }
    }
    else {
      quest::emote("seems to ignore you."); #Text made up
    }
  }
  else {
    quest::emote("seems very busy right now."); #Text made up
  }
}

sub EVENT_SIGNAL {
  if ($event == -1) { #Event not ready
    if ($signal == 0) { #Clockwork ready, reset event
      $event = 0; #Set event ready
    }
  }
  elsif ($event == 0) { #Event ready, not active
    if ($signal == -1) { #Clockwork not ready
      RESET_EVENT();
    }
  }
  elsif ($event == 1) { #Event active
    if ($signal == -1) { #Clockwork not ready
      FAIL_EVENT();
    }
    if ($signal == 3) { #Clockwork charged
      if ($charge == 1) { #Successful charge
        quest::stoptimer("charge");
        $charge = 0;
        if ($stage == 1) {
          $stage = 2;
          quest::say("Great! This appears to be working, I can barely contain my excitement.");
          quest::settimer("stage_2", rand(15) * 1 + 5);
        }
        elsif ($stage == 2) {
          $stage = 3;
          quest::say("Excellent timing, young one.");
          quest::settimer("stage_3", rand(15) * 1 + 5);
        }
        elsif ($stage == 3) {
          $stage = 4;
          quest::say("Excellent timing, young one.");
          quest::settimer("stage_4", rand(15) * 1 + 5);
        }
        elsif ($stage == 4) {
          $stage = 5;
          quest::say("Wonderful, I knew this would work! C'mon, let's see what we can do here.");
          quest::settimer("stage_5", rand(15) * 1 + 5);
        }
      }
      else { #Failed charge
        FAIL_EVENT();
      }
    }
  }
}

sub EVENT_WAYPOINT_ARRIVE {
  if (($event == 1) && ($wp == 1)) {
    quest::stop();
    quest::moveto(-1581, 1285, -108, 114, 1); #Clockwork location (steamfontmts)
    quest::settimer("kneel", 1);
    quest::say("Stay sharp, young wizard, I will give you cue to begin to infuse this creation with your magics. Take care to put just the right amount of effort into the spell, otherwise we may overcharge the battery, or you might cause me harm. If you miss your cue, it will be a waste and we'll have to start over.");
    quest::settimer("stage_1", rand(15) * 1 + 5);
    $stage = 1;
  }
}

sub EVENT_TIMER {
  if ($timer eq "stage_1") {
    quest::stoptimer("stage_1");
    quest::settimer("charge", 5);
    $charge = 1;
    quest::signalwith($slave, 1); #Tell clockwork event active
    quest::say("I'm almost ready for you to make the first charge... Just another second... Ok, wizard, give it your best shot.");
  }
  if ($timer eq "stage_2") {
    quest::stoptimer("stage_2");
    quest::settimer("charge", 5);
    $charge = 1;
    quest::signalwith($slave, 1); #Tell clockwork event active
    quest::say("Alright, give it another shot.");
  }
  if ($timer eq "stage_3") {
    quest::stoptimer("stage_3");
    quest::settimer("charge", 5);
    $charge = 1;
    quest::signalwith($slave, 1); #Tell clockwork event active
    quest::emote("grabs a new wire and attaches it to a small bundle of wires inside the clockwork. After several seconds of making some modifications he says, 'This looks to be working, a couple more blasts like that and we'll be up and running in no time! Go ahead and give me one good, solid charge.");
  }
  if ($timer eq "stage_4") {
    quest::stoptimer("stage_4");
    quest::settimer("charge", 5);
    $charge = 1;
    quest::signalwith($slave, 1); #Tell clockwork event active
    quest::say("This should be the last one, wizard. Put everything you've got into this one and lets see what happens!");
  }
  if ($timer eq "stage_5") {
    quest::stoptimer("stage_5");
    quest::settimer("stand", 1);
    quest::settimer("face", 2);
    quest::say("I appreciate your help there, young wizard. Send Talwyn my thanks for sending such a capable young recruit to help me out here.");
    quest::targlobal("wiz_epic_pre", 5, "F", 0, $player, 0);
  }
  if ($timer eq "charge") {
    quest::stoptimer("charge");
    FAIL_EVENT();
  }
  if ($timer eq "kneel") {
    quest::stoptimer("kneel");
    $npc->SetAppearance(4); #Kneel down
  }
  if ($timer eq "stand") {
    quest::stoptimer("stand");
    $npc->SetAppearance(0); #Stand up
  }
  if ($timer eq "face") {
    quest::stoptimer("face");
    $target = $entity_list->GetClientByCharID($player);
    $npc->FaceTarget($target); #Face player
    quest::settimer("cleanup", 3);
  }
  if ($timer eq "cleanup") {
    quest::stoptimer("cleanup");
    RESET_EVENT();
  }
}

sub FAIL_EVENT {
  quest::settimer("stand", 1);
  quest::emote("mumbles something almost inaudible beneath his breath, 'I can't believe Talwyn would send me some random flunkie to help recover this clockwork! Doesn't he know how important this is to me!? I could have been killed! Perhaps it isn't his fault.' In a swift motion, he sends you on your way, unwilling to accept your help.");
  quest::settimer("cleanup", 5);
}

sub RESET_EVENT {
  quest::stopalltimers();
  $event = -1;
  $player = 0;
  $stage = 0;
  $charge = 0;
  quest::delete_data("Yama_Event");
  quest::signalwith($slave, 2); #Tell clockwork to reset
  quest::signalwith($slave, 0); #Check clockwork status
  quest::stop();
  quest::start($normal_grid);
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}