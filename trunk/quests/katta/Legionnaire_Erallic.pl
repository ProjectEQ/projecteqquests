sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met friend. I am sorry but I musn't converse while I am on duty."); }
}

sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3881 => 1)) {
    quest::say("gasps silently for air and the falls completely still! No one seems to have heard you.");
    quest::summonitem(3883);
    quest::faction(350,2); #Validus Custodus
    quest::faction(168,2); #Katta Castellum Citizens
    quest::faction(206,2); #Magus Conlegium
    quest::faction(228,-2); #Nathyn Illuminious
    quest::faction(55,-2); #Coterie of the Eternal Night
    quest::faction(284,-2); #Seru
    quest::faction(139,-2); #Hand of Seru
    quest::faction(96,-2); #Eye of Seru
    quest::faction(138,-2); #Hand Legionnaires
    quest::exp(100);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#By Kovou
#END of FILE Zone:katta  ID:160003 -- Legionnaire_Erallic 

