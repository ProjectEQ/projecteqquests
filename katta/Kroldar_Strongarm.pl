# items: 2691, 31728
sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("I am Governor Kroldar Strongarm of Katta Castellum. It is my duty to command the Validus Custodus in matters of Warfare. The Empire 

of the Loyalist Combine is currently engaged in a long lasting war with the Inquisition Combine of Sanctus Seru and the vile undead of the 

[Coterie of the Eternal Night].");
 }
 elsif($text=~/coterie of the eternal night/i){
  #Start of Vampyre Fang
  quest::say("The Coterie of the Eternal Night are not an enemy to be taken lightly. Our vampyre hunters must be dedicated to the annihilation of 

the undead. These vampyres tend to hold grudges that may last several of our lifetimes and their twisted vengeance may be inflicted on your 

descendents unless every one of the twisted abominations is destroyed. Should you bring me the fangs of four vampyres I will know you have taken 

the first step and are dedicated to the cause.");
 }
}

sub EVENT_ITEM {
 #Handin: 4x Vampyre Fang (2691)
 if(plugin::check_handin(\%itemcount, 2691 => 4)){
  #End of Vamprye Fang
  quest::say("You have dedicated yourself to the war with the Coterie of the Eternal Night. I will continue to reward you for the fangs of every 

four vampyres that you slay. Should you be ambitious and skilled enough to confront the coterie leaders and live I will respectfully grant you 

the honor that you deserve.");
  quest::summonitem('31728'); #Vial of Blessed Water
  quest::faction(1504,10); # +Magus Conlegium
  quest::faction(1502,10); # +Katta Castellum Citizens
  quest::faction(1503,10); # +Validus Custodus
  quest::faction(1505,-10); # -Nathyn Illuminious
  quest::faction(1506,-10); # -Coterie of the Eternal Night
  quest::faction(1483,-10); # -Seru
  quest::faction(1484,-10); # -Hand of Seru
  quest::faction(1485,-10); # -Eye of Seru
  quest::faction(1541,-10); # -Hand Legionnaries
  quest::exp(500);
 }
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}


#Submitted by: Senzo

