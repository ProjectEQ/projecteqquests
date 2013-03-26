#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#Quest Writer: Shadestrike
#NPC Name: Iago Sabuela
#NPC ID: 114276


sub EVENT_SAY {
  if ($text=~/Hail, Iago Sabuela/i) {
    quest::say("Salutations dragon friend $name. I am Iago Sabuela archeologist, enchanter, and proud member of the [Draconic Loyalist Fellowship]. Please make yourself comfortable and enjoy your visit to Skyshrine.");
  }
  if ($text=~/What Draconic Loyalist Fellowship?/i) {
    quest::say("The Draconic Loyalist Fellowship is people like myself of a non-draconic heritage that have pledged obedience to the dragons and dragon-kin of Skyshrine. We have proven that we can provide valuable services and resources to the dragons and dragon-kin that would otherwise be difficult or impossible for them to obtain. Among the occupations I pursue here in the Skyshrine is the acquisition of lost [draconic artifacts].");
  }
  if ($text=~/What draconic artifacts?/i) {
    quest::say("The dragons and their kin have an ancient and complex culture like any intelligent creature in Norrath. I have spent the majority of my years studying the ancient dragon civilizations of Norrath and recovering lost draconic artifacts. There are several artifacts I am currently searching for and could use the assistance of a capable group of adventurers. Are you interested in [hunting for lost artifacts]?");
  }
  if ($text=~/I am interested in hunting for lost artifacts./i) {
    quest::say("Excellent. With the help of the texts provided me by the dragon-kin here in Skyshrine I have narrowed my search down to a few locations where I believe the artifacts I seek may be hiding. Before the artifacts may be recovered however you will need a special container in which to store them in. They are quite old and who knows what condition they may be in. I am missing some materials that are necessary for the insulation of the container thus it would be appreciated if you could provide me with a [crystalline silk mesh] and two [oily goo secretions] I will finish the construction of the artifact container and provide with the information I have obtained of the lost artifacts.");
  }
  if ($text=~/What crystalline silk mesh/i) {
    quest::say("An experienced tailor must craft the woven crystalline spider silk mesh in a tailoring kit out of four crystalline silks.");
  }
  if ($text=~/What oily goo secretions?/i) {
    quest::say("Tar Goos can be found in the Geonid caves in the Wakening Lands. These Goos secrete a sticky, oily substance that makes for an excellent sealant and insulation.");
  }
  if ($text=~/what platinum dragon scale/i) {
    quest::say("There are tales among the dragon-kin of a platinum dragon scales marked with mystical runes in the ancient dragon script. Whether this scale was crafted from platinum ore, encased in platinum, or is actually from a lost species of dragon is unknown. The last written accounts mentioning the scale place it in the vicinity of the Cobalt Scar. It is my assumption that the magically adepts sirens of Sirens Grotto may now be in possession of the scale.");
  }
  if ($text=~/what crystal dragon eye/i) {
    quest::say("I have uncovered some texts here in the Skyshrine that speak of a crystal carved in the visage of a Dragons eye. The dragon sorcerer, Xervolithax, who was slain by enemies of the Dragons several centuries ago in the Great Divide, crafted this crystal dragon eye. As it was an artifact of some significant undisclosed magical power it believed to now be hidden somewhere in the Labyrinth of the Kromzek Sorcerer, Velketor.");
  }
  if ($text=~/what golden dragon claw/i) {
    quest::say("Draconic legends mention a hollow golden dragon claw artifact that would fit over one of the fore-claws of a dragon. This dragon-crafted jewelry was more than a simple adornment. The legends claim that the dragon that wore this claw had the ability to swiftly carve powerful runes into the surface of any object. These runes were apparently some form ancient spellcrafting art and it is said the dragon, Ulvaxazoviak, who for a time possessed the claw would carve runes of protection and power into his own scales. When Ulvaxazoviak's spirit finally fled this realm he was buried in the Dragon Necropolis, which is where I believe the golden dragon claw has rested to this day.");
  }
  if ($text=~/what dragon scripture tablet/i) {
    quest::say("Certain dragon scholars engraved their writings onto tablets of Velium, believing the magical ice that is found throughout Velious to have been formed by the breath of Veeshan herself. There are accounts of one such tablet that was lost many decades ago in the Eastern Wastes. I have visited the Coldain city of Thurgadin many times during my stay here in Velious and I do not believe that the tablet is in the possession of the dwarves. It may however have fallen into the hands of the Ry'Gorr Clan Orcs that man a keep in the Eastern Wastes.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) { # requires kindly faction
     if (plugin::check_handin(\%itemcount, 11637 => 2, 11636 => 1)) {
      quest::say("Thank you $name. Here is the container that the artifacts must be stored and returned to me in once they have been recovered. The artifacts I seek are a [Crystal Dragon Eye], a [Golden Dragon Claw], a [Dragon Scripture Tablet], and a [Platinum Dragon Scale]. When all the items have been recovered, seal the artifact container and return it to me. You shall be rewarded well for your assistance, I assure you.");
      quest::summonitem(17167);
      quest::faction(42,5);
      quest::faction(362,5);
      quest::faction(189,-10);
      quest::exp(1250)       
     } 
     elsif (plugin::check_handin(\%itemcount, 28057 => 1)) {
     quest::say("You have made good on your word, $name.  This is indeed what I have been seeking, and as promised I will keep my end of the bargain. Take this mask and wear it with pride, it is symbolic of your aid to the The Draconic Loyalist Fellowship.");
      quest::summonitem(12559);
      quest::faction(42,5);
      quest::faction(362,5);
      quest::faction(189,-10);
      quest::exp(1250)       
     }   
     else {
      plugin::return_items(\%itemcount);
    }   
}
}