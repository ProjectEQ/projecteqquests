# a Shady Goblin, Warsliks Woods
# Second part of the chardok quest, initiated by Herald Telcha
# Regal Band of Bathezid
# global RegalBandBathezid, needed to be sure players won't jump to the last part of the quest
#   at 1 : you gave the Signet of Service to the goblin traitor

sub EVENT_SAY{
  if ($RegalBandBathezid==1) { # we handed the Signet of Service yet
    # the goblin won't talk to the player unless we did the beginning of the quest
    if ($text=~/hail/i){
      quest::say("If yer not my contact ya best be movin' on. Got no time to waste on ya.");
    }
    if ($text=~/I am your contact/i) {
      quest::say("Are ya? Hum, let me see yer insignia then, and the note Skargus gave ya.");
    }
  }
}

sub EVENT_ITEM{
  if ($RegalBandBathezid==1) { # we handed the Signet of Service yet
    if (plugin::check_handin(\%itemcount,6475=>1,6471=>1)) { # forged note & Drogan Warlord's Insignia
      quest::emote("gapes at the note in puzzlement, obviously a bit concerned by it. The courier looks at the note for more than a minute, then looks at you, and back at the note.");
      quest::say("Errm.. welp, dunno what to make of the note. If I know the right of it, Skargus finally got him some girly to do his writin' for him. Ooooh I bet she's a tasty one, graarr. If I was warlord I know I'd have me a girly too. Gah, take this report and get outta my sight.");
      quest::summonitem(6474); # 6474  Report to Skargus
      quest::depop();
    }
  }
  plugin::return_items(\%itemcount);
}

