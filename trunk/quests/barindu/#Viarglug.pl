#BeginFile: barindu\#Viarglug.pl
#Quest file for Barindu - Viarglug (Active): Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_SPAWN {
  quest::settimer("ViarglugDepop",1800); #Despawn after 30 minutes
}

sub EVENT_AGGRO {
  quest::emote("runs for battle in an uncontrollable rage.");
}

sub EVENT_TIMER {
  quest::stoptimer("ViarglugDepop");
  quest::depop();
}

sub EVENT_DEATH {
  quest::emote("'s eyes glisten as it loses itself in the pleasure of pain and death.");
  quest::stoptimer("ViarglugDepop");
}
#EndFile: barindu\#Viarglug.pl (283156)