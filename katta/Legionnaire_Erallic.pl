# items: 3881, 3883
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met friend. I am sorry but I musn't converse while I am on duty."); }
}

sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3881 => 1)) {
    quest::say("gasps silently for air and the falls completely still! No one seems to have heard you.");
    quest::summonitem(3883); # Item: Empty Poison Vial
    quest::faction(1503,2); #Validus Custodus
    quest::faction(1502,2); #Katta Castellum Citizens
    quest::faction(1504,2); #Magus Conlegium
    quest::faction(1505,-2); #Nathyn Illuminious
    quest::faction(1506,-2); #Coterie of the Eternal Night
    quest::faction(1483,-2); #Seru
    quest::faction(1484,-2); #Hand of Seru
    quest::faction(1485,-2); #Eye of Seru
    quest::faction(1541,-2); #Hand Legionnaires
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

#By Kovou
#END of FILE Zone:katta  ID:160003 -- Legionnaire_Erallic 

