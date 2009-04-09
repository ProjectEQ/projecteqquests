# Part of quest for Bracer of the Reverent

sub EVENT_SAY {
  if($text=~/Regis/i){
    quest::say("Regis was my one true love, but he was [killed] and his soul enslaved by Zahal the Vile.");
  }
  if($text=~/killed/i){
    quest::say("He was killed in the northern tree line to the east in North Karana. If you kill Zahal, Regis' body will rise from the place where he died. If my flute is on the body, please bring it to me.");
  }
}

sub EVENT_ITEM { 
  if($itemcount{13899} == 1){
    quest::say("Thank you for setting his spirit free.  Keep his memory alive with this.");
    quest::summonitem("19010");
  }
}

# Quest by mystic414

