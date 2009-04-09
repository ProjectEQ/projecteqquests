# EPIC CLERIC (Timorous deep)

sub EVENT_SPAWN {
  quest::settimer("dodepop",300);
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,28018=>1)) { # Lord Gimblox's Signet Ring
    quest::say("Thank you, $name, for your services thus far. The Triumvirate missionaries are, so far, impressed. However, there is yet another threat rising from the Plasmatic Priesthood that may have dire effects on all of Norrath if it is not stopped. An Iksar member of the Triumvirate missionaries has discovered that the Plasmatic Priesthood has somehow convinced the sarnak summoners of Chardok to assit them in summoning Ixilblat Fer to Norrath. Take this shell to Naxot Deepwater in the Burning Woods so that she knows I have sent you. We ask that you return with the Sceptre of Ixiblat Fer as well as evidence to show that the Plasmatic Priesthood is dealing with sarnaks. High Priest Omat will await your return. I Must depart now. I pray for your success."); 
    quest::summonitem(28056); # Ornate Sea Shell (II)
    quest::depop();
  } 
  
  elsif (plugin::check_handin(\%itemcount,28052=>1)) { # Message to natasha, from naxot deeptwater
    quest::emote("lowers her head in mourning and whispers a prayer. 'It is a shame that fate has decided one so young and from such a background should perish, but we must not attempt to change what was destined to be. Priestess Naxot sacrificed herself selflessly so that others may be spared the horrors Ixiblat would have brought to Norrath. May the waters of Norrath forever remember her reflection. I thank you for delivering Naxot's message to me and give you this pearl imbued with the power of the Triumvirate. Should you find Zordak Ragefire, speak with him before all else and hand him this pearl. No mortal enemy of the Triumvirate can resist its enchantments.'");
    quest::summonitem(28054); # shimmering pearl
  }
  else {
    quest::say("I have no need of this, $name.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER {
  if ($timer eq "dodepop") {
    quest::depop();
  }
}

#End of File, Zone:timorous  NPC:51138 -- Natasha Whitewater