#############
#Quest Name: Alexis' Book Collection
#Author: CrabClaw
#NPCs Involved: Alexis_Dubbani
#Items Involved: All from Angelox's Database
#zone: poknowledge
#Revised CrabClaw v1.0 WIP

###RELATED QUESTS###
#	Curator_Merri: The Collector's Box

sub EVENT_SAY { 
if($text=~/Hail/i){
      quest::say("Why hello there. $name.  I'm so glad you could take the time to see my exhibit.  I am a collector of [books]. and I seek many more volumes of strange and wonderful texts.  Perhaps I could hire your services to help me find some more?");
   }elsif($text=~/books/i){
      quest::say("I am still looking for the following. Please locate a Black Tome with Silver Runes, Tome of the Eternal, Codex of the Warrior, and a Book of Inspiration. Please store them inside a Collector's Box you can get from [Merri] for safekeeping. After you find all the books, be sure to close the box and return it to me. I appreciate your help.");
   }elsif($text=~/merri/i){
      quest::say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
	  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28078 => 1)) {
    #I think there is a 'Collection of Books' item missing from the database at entry 28078.
    quest::say("These will do. Please accept this as a show of my appreciation. Now if you'll excuse me I have much work left to do.");
    quest::summonitem(28240);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge Alexis_Dubbani