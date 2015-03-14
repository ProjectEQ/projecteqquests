# Spirit Wracked Cord

sub EVENT_SAY{
  if ($faction==1) { # Only if you are ally with Sarnaks
    if ($text=~/hail/i) {
      quest::say("Hail, minion! It is good to see a member of a lesser race striving to improve themself through service to the Dizok. We are feeling especially generous as of late, and if you would do us a [service], we shall reward you handsomely.");
    }
    if ($text=~/service/i) {
      quest::say("We are not sure you are worthy, but shall assign you this task in hopes you prove mighty enough to resolve it. Gather your broodlings about you, and journey to Charasis. There you shall find a Urn of spirits. We require this, as well as [additional components].");
    }
    if ($text=~/additional components/i) {
      quest::say("Very well, if you feel you are up to it, lead your broodlings to fallen Sebilis and return to us with a portion of undead dragon sinew. Bring us the Sinew, the Urn, and your Regal Band of Bathezid as proof of service, and a worthy reward shall be yours.");
    }
  } # end faction=1
}

sub EVENT_ITEM{
  if ($faction==1) { # Ally faction
    # 6477 spirit wracked urn
    # 6478 undead dragon sinew
    # 5727 regal band of bathezid
    if (plugin::check_handin(\%itemcount,6477=>1,6478=>1,5727=>1)) {
      quest::say("Amazing! You have returned the trophies I asked for, against impossible odds. Here is your reward, worthy minion, may it serve you well.");
      quest::summonitem(5727); # 5727 We get Regal Band of Bathezid back
      quest::summonitem(5723); # 5723  Spirit Wracked Cord, final reward
      quest::exp(100000);
      quest::faction(281,50);
      quest::faction(384,-30);
    }
  } # end faction=1
  
  plugin::return_items(\%itemcount);
}


