#Rigg_Nostra  ID 10128

sub EVENT_SAY {
  if ($text=~/crate of pickheads/i) {
  quest::say("I've heard that a dwarf who calls himself Grendig and has not registered with the Coalition of Tradefolk has recently arrived in Freeport and is staying at the Freeport Inn just inside the South Gate. He has brought to Freeport pick heads from his home city of Kaladim. Find Grendig and 'convince' him to 'donate' a crate of pick heads to the Coalition of Tradefolk as tax for peddling his wares in our city.");
  }
  
  if ($text=~/bundle of hardwood shafts/i) {
  quest::say("There is a halfling named Jimble Woodentoe that occasionally visits Freeport to peddle his woodcrafts. He can be found traveling through the Commonlands from the direction of Rivervale. Find Jimble and 'convince' him to donate a bundle of hardwood shafts to the Coalition of Tradefolk as tax for peddling his wares in our city.");
    }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,  13903=>1 )) {
  quest::say("Excellent I've been waiting for the Coalition to send me some assistance. I have an associate waiting for some supplies that have not yet been collected. I need you to acquire a [crate of pick heads] and a [bundle of hardwood shafts] and bring them to me so that I may prepare them for delivery to my associate.");
    
  }
  if (plugin::check_handin(\%itemcount, 19931 =>1, 19929=>1 )) {
    quest::say("Thanks $name.  Now hand this crate to the fellow behind you.");
    quest::summonitem(19930);
    quest::spawn(10000,0,0,-144,-456,-52);
  }
}