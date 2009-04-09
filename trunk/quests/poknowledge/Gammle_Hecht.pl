#############
#Quest Name: Gammle's Display
#Author: CrabClaw
#NPCs Involved: Gammle_Hecht
#Items Involved: All from Angelox's Database
#zone: poknowledge
#Revised CrabClaw v1.0 WIP

###RELATED QUESTS###
#	Curator_Merri: The Collector's Box

sub EVENT_SAY { 
if($text=~/Hail/i){
      quest::say("Good day $name.  I don't mean to be curt but I have much work to do to be ready for my museum display, and there is not much time left. I expect many young warriors to be visiting here, but it is unfortunate that I do not have the final pieces I am [missing]. They would add to the collection greatly.");
   }elsif($text=~/missing/i){
      quest::say("If you would be willing to help me, I can make it worth your while. I need you to find a Minotaur Battle Axe, Goblin Two-Handed Sword, Chill Dagger, and an Ancient Sensate Shield. When you get these items, put them in a Collector's Box that you can get from [Merri], close it up and bring it to me.");
	  }elsif($text=~/merri/i){
         quest::say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
	  }
}
sub EVENT_ITEM{
   if ($itemcount{28079} == 1){
   #I think there is a 'Collection of Weapons' item missing from the database at entry 28079.
      quest::say("These will do. Please accept this as a show of my appreciation. Now if you'll excuse me I have much work left to do.");
      quest::summonitem(28243);
	  #I would love to put 'Improved Damage II' or "Affliction Haste II" on this 'Fine Antique Poniard' as well to complete the focus effect collection, but not necissary.
  }
}
#END of FILE Zone:poknowledge Gammle_Hecht

