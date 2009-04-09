## Changes by Kagehi.
## $Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
## Since we don't want to hand people things that they can't normally get, or
## stuff they haven't earned, we need to track which stage in the quest they
## are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
## 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
## and 7 = Initiate's Cloak.

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Well met. Friend.  May I be of assistance?");
  }
## Fixme for lost stamped certificate.
  if(($text=~/certificate/i) && ($qglobals{Shar_Vahl_Cit}  == 3)){
    quest::say("I suppose I can issue another one. Just give me a second.");
    quest::summonitem(2875);}
}

sub EVENT_ITEM {
  #Certificate of Taxability OR Application for Citizenship
  if(plugin::check_handin(\%itemcount, 2874 => 1)) {
    quest::emote("places his seal on the certificate before returning it to you.");
    quest::say("Ahh, a new taxpayer, wonderful! You must always remember that it is a distinct privilege to contribute to the upkeep of our noble society and not merely a duty or a burden. I look forward to collecting your honorable taxes in the future. May the spirits prosper you, $name.'");

    # Stamped Certificate of Taxability
    quest::setglobal("Shar_Vahl_Cit",3,5,"F");
    quest::summonitem("2875");
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155084 -- Tax_Collector_Khugra


