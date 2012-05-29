# an angry goblin, Frontier Mountains
# Second part of the chardok quest, initiated by Herald Telcha
# Regal Band of Bathezid
# global RegalBandBathezid, needed to be sure players won't jump to the last part of the quest
#   at 1 : you gave the Signet of Service to the goblin traitor

sub EVENT_SAY{
  if ($RegalBandBathezid==1) { # we handed the Signet of Service yet
    # the goblin won't talk to the player unless we did the beginning of the quest
    if ($text=~/hail/i){
      quest::say("'Go away, my life is miserable enough!' The angry goblin looks at you more closely, his rage fading for a moment. 'Are you here with the evidence I was promised? Give it to me if you have it.'");
    }
  }
}

sub EVENT_ITEM{
  if ($RegalBandBathezid==1) { # we handed the Signet of Service yet
    if (plugin::check_handin(\%itemcount,6474=>1)) { # receive Report to Skargus from Shady Goblin
      quest::emote("howls in triumph! 'This is just what I needed! Skargus is mine now, wait until he finds out, just wait! His death is close at hand. Follow me and I'll take you to Skargus's chamber, you can wait there while I take this report to the chief!'");
      quest::shout("I have you now Skargus, you traitor! Even now I'm taking this report of slave-trading to the chief! Your days here are at an end!");
      $npc->Depop(1);
      quest::unique_spawn(92185,0,0,$x,$y,$z);
    }
  }
  plugin::return_items(\%itemcount);
}

