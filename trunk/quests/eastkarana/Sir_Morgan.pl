#############
#Quest Name: Sir Morgan's Armor
#Author: Blaz
#NPCs Involved: 1
#Items Involved: 5 Gold for a random reward
#################
sub EVENT_SAY { 

if($text=~/Hail/i)
{
    quest::say("Hail. traveler!  Might I escort you through to Highpass?  The path ahead is filled with giants and many other hungry beasts. I assure you. you will be safe with me.  I must admit. I am quite experienced in the ways of the warrior.  Do you [wish an escort] or will you [travel alone]?");
}
if($text=~/wish an escort/i)
{
    quest::say("I shall be honored to escort you to Highpass, but you shall have to wait for a spell. I make trips every few hours. I also would be grateful to any who wish to donate gold coins to the upkeep of my armor. The rains in the plains cause much rusting.");
}
if($text=~/travel alone/i)
{
    quest::say("Then, good luck to you! May your faith protect you. Or at the very least, guide you to a grand afterlife.");
}
}
sub EVENT_ITEM 
{
 #Give Sir Morgan 5 gold
   if ($gold == 5){
   quest::say("What a grand donation!! You must be a rich noble to be making such a donation. Here. I am but a simple warrior, but I found this lying on the highway to Highpass Hold. The lifeless corpse next to it had no more need of it.");
   #random reward: Patchwork cloak, Patchwork boots, Rusty Weapons, Silver Earring, Bloodstone, Halfling knife, Bronze Dagger, Belt pouch, Damask cap, Mountain Lion Cape, Highkeep Flask, Snakeskin Mask, Drom's Champagne. 
   $random = quest::ChooseRandom(2106,2112,2041,13944,2307,3829,1331,17002,7012,8306,10006,10019,5013,5019,5021,5022,6011,5023,7007,7008);
   # Guards of Qeynos
   quest::faction("135","3");
   # Karana Residents
   quest::faction("167","3");
   # Priests of Life 
   quest::faction("257","3");
   # Knights of Thunder 
   quest::faction("183","3");
 }
else{
  #do all other handins first with plugin
  plugin::return_items(\%itemcount);
  quest::say("Thank you $name, but I do not need this, you can have it back.");
}

}

#END of FILE Zone:eastkarana  ID:15048 -- Sir_Morgan