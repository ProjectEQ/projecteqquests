# a Goblin Traitor, somewhere in the cave, Frontier Mountains
# Second part of the chardok quest, initiated by Herald Telcha
# Regal Band of Bathezid
# global RegalBandBathezid, needed to be sure players won't jump to the last part of the quest
#   at 1 : you gave the Signet of Service to the goblin traitor

sub EVENT_SAY {
  if  ($faction<=2) {  # need to be warmly or better
    if ($text=~/hail/i) {
      quest::say("Serve the Sarnak do ya? You the one they say they send? I don't know that I believe ya, show a token. Humm show me ya ring if ya got it.");
    }
    if ($RegalBandBathezid==1) { # we handed the Signet of Service yet
      if ($text=~/plan/i) {
        quest::say("Alrighty, listen listen. Skargus used to be a low rankin' nogood. He made a fake story 'bout Gragbar who was the warlord and caused him much trouble with the chief. Gragbar was cast down, chief made Skargus the warlord now. Gragbar is very angry, would take back his position and kill Skargus if he get [evidence] of his treachery.");
      }
      if ($text=~/evidence/i) {
        quest::emote("makes a terrible face, then spits on the ground before continuing.");
        quest::say("Gragbar are workin' with the Iksar, bleh Iksar. He sellin' goblin troops as slaves to Cabilis when he can, sayin' they died in battle at the lake. If we get evidence of that, we get Skargus and kill him. You go to Frontier mountains, find Sarnak there, he knows where we get evidence from. Give him this note from me, and he help ya. Off with ya now, before I get seen with ya.");
        quest::summonitem(6472); # 6472  Traitor's note
      }
    }
  } # end of faction<=3
}

sub EVENT_ITEM{
  if ($faction<=2) {  # need to be warmly or better
    if (plugin::check_handin(\%itemcount,5728=>1)) { # Di'zok Signet of Service
      quest::emote("looks relieved when he sees your signet of service and eyes you with a bit more respect.");
      quest::say("Good! They tell'd me to wait here for ya, can't say I like it but here I sits. It be good to be rid of Skargus though, so I be a happy one, oh yes. Want to know the [plan] then?");
      quest::summonitem(5728); # 5728  Di'zok Signet of Service
      quest::setglobal("RegalBandBathezid",1,5,"Y1");
    }
  }
  plugin::return_items(\%itemcount);
}

