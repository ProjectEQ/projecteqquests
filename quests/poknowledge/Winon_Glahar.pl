#Winon_Glahar.pl
#Beginner Stealth Manual
#
#As a note, according to posts at Alla's (not the most reliable source I know, 
#but all I've got right now) the Beginner's quests eat the Planar Traveler's Manual, 
#so that quest must be completed 3 times in order to do all the Beginner's Manual 
#Quests.  This is intended behaviour.


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Good day, $name. I see your curiosity of the planes is growing, as you have obtained a manual on planar travel. It is good to see young adventurers interested in planar exploration, but there is one aspect of discovery you must always be prepared for, the struggle for survival. There are very dangerous places to be seen and experienced out there, and it would behoove you to be ready to face what challenges may come. With my help, I can teach you the basics of planar stealth and reflexes if you are [willing to learn].");
  }
  if($text=~/willing to learn/i) {
    quest::say("This is good. Through your trials of planar travel shall your knowledge of stealth techniques grow, and the more you learn, the more you shall produce. In order to prove your newfound knowledge, your first lesson will be to create a special [planar stein] of particular design. Once you have acquired this stein, you must give it to me along with your Planar Traveler's Manual. Once done, new lessons may be opened up to you.");
  }
  if($text=~/planar stein/i) {
    quest::say("To fashion the stein I seek, you must acquire a Block of Tanaan Clay, a Ceramic Lining Sketch, Tainted Planar Essence, a Water Flask, and some Sculpting Tools. Use these items in a pottery wheel to create your base model to work from. Crush some Valor Crystals together with some Glaze Lacquer in a glaze mortar to make Crystalline Valor Glaze. You must then take a Lacquered Peridot, the Crystalline Valor Glaze, a High Quality Firing Sheet, and the base model stein and merge them in a kiln to put the finishing touches on your work. I hope to see you bring me a handsome-looking stein soon. Good luck!");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29168 => 1, 28745 => 1)) {#Planar Peridot Encrusted Stein, Planar Traveler's Manual
    quest::say("How wonderful! You have done well here, I can't remember how long it's been since I've seen a work so fine. Take this book, it will certainly help you in your use of the arts of stealth. When you are ready, Ethoach Trokith will give you your next lesson, so be sure to speak to him. Do not lose your book or else he may not appreciate you coming to class unprepared.");#Adapted text from Beginner Magic Manual quest, I have no other reference
    quest::summonitem(28792); #Beginner Stealth Manual
  }
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
 
    
}#END of FILE Zone:poknowledge  ID:202049 -- Winon_Glahar 

