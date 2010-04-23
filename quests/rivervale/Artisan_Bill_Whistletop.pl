#Artisan Bill Whistletop
#
#DoN Cultural Armor (Incomplete)
# Edited April 20, 2010 by mrhodes
#To Do:

#Add 4 task assignments and completion text
#Create task: Beholder's Maze (30+)            Working on this - mrhodes
#Create task: The Hole (40+)
#Create task: Karnor's Castle (60+)
#Create task: Stillmoon Temple (70+)
#Give proper level books
#Give Seal of Darkhollow


sub EVENT_SAY {
   if($race eq "Halfling")
   {
      if($text=~/hail/i) {
         quest::say("Hi-oh there, $name. You startled me. I'm busy compiling notes for my compendium; it'll be
            a complete [history] of Rivervale for an entire century. Imagine that!");
      }
      if($text=~/history/i) {
         quest::say("Well, it's not really a history book, not exactly. It's more like I just sit around and
            write about whatever's [going on] in Rivervale at the moment. I've been doing this for thirty
            seven years now, so, um, hey, I'm almost half done!");
      }
      if($text=~/going on/i) {
         quest::say("Yeah, I write down everything: fishing trips, crop yields, new card games I pick up. Hmm,
            I guess it's more of a journal then a history book. . . Oh well, it's still chalk full of
            historical [significance].");
      }
      if($text=~/significance/i) {
         quest::say("Heck yes, I write down everything so some of it has got to be important. For example, I
            copied down all those [armor patterns] and [cultural symbol patterns] that were displayed during
            that spring festival eleven years ago. You know the one where we had that competition to see who
            could make the best suit of armor! Boy, that was a great festival. The apple tarts were amazing.
            I'm glad I wrote down the recipe for those too!");
      }
      if($text=~/armor patterns/i) {
         quest::say("Oh, you're interested in the armor, huh? I guess you do look like the adventuring sort.
            Well, heck, I can make you an armor pattern book if you want? I have all the designs written down
            and recorded somewhere in one of my journals; all I'll need is the materials for the pattern book
            itself. Just bring me a cat skull cap for the cover, a fractured femur for the spine, a minotaur
            horn for the clasp, and a bunch of optic nerves to grind down and make a salve, which will protect
            and preserve the finished product. I hear these items can be found in the Runnyeye Goblin
            territory and the Beholder's Maze, but I'm not really sure? Anyway, once I have those, I can make
            you a pattern book. Hey, then we can go fishing!");
      }
      if($text=~/cultural symbol patterns/i) {
         quest::say("You're interested in the cultural symbol patterns I see. I can give you a book of cultural
            symbol patterns but I will need you to run a few tasks for me before I can give them to you. What do
            you say; would you like to run a few short [tasks] for me?");
      }
      if($text=~/tasks/i) {
         quest::say("I have four tasks that need to be completed. The first is an adventure into [Beholder's
         Maze] where you will clear a path for young Halflings so they can make a safe passage through the maze
         to East Karana. The next you will be tasked with venturing into the heart of [the Hole] where you hunt
         for some ingredients for my drip clock. The third task leads you into [Karnor's Castle] where you will
         collect bone specimen for my collection. The final task you will adventure into [Stillmoon temple] and
         learn about the creatures that inhabit the area.");
      }
      
      if($text=~/beholder's maze/i)
      {
         if($ulevel >= 30)
         {
            quest::taskselector(203);
         }else
         {
            quest::say("I'm sorry, I don't think you are ready for that task yet. Please come back once you've
               gotten a bit more experience.");
         }
      } # if($text=~/beholder's maze/i)      
      if($text=~/the hole/i)
      {
         if($ulevel >= 40)
         {
            quest::taskselector(204);
         }else
         {
            quest::say("I'm sorry, I don't think you are ready for that task yet. Please come back once you've
               gotten a bit more experience.");
         }
      } # if($text=~/the hole/i)      
      if($text=~/Karnor's Castle/i)
      {
         if($ulevel >= 60)
         {
            quest::taskselector(205);
         }else
         {
            quest::say("I'm sorry, I don't think you are ready for that task yet. Please come back once you've
               gotten a bit more experience.");
         }
      } # if($text=~/Karnor's Castle/i)      
      if($text=~/Stillmoon temple/i)
      {
         if($ulevel >= 70)
         {
            quest::taskselector(206);
         }else
         {
            quest::say("I'm sorry, I don't think you are ready for that task yet. Please come back once you've
               gotten a bit more experience.");
         }
      } # if($text=~/Stillmoon temple/i)
   } # if($race eq "Halfling")
   else
   {
      quest::say("Hello $name!  Another fine day here in Rivervale!");
   }
}
   

sub EVENT_ITEM {
   if($race eq "Halfling")
   {
      if(plugin::check_handin(\%itemcount, 12372 => 1, 12373 => 1, 13077 => 1, 14019 => 1)) { #Cat Skull Cap, Fractured Femur, Minotaur Horn, Bunch of Optic Nerves
      quest::say("Oh, hey there, $name. I'm still working on my history book. In fact, I just wrote down the part
         where we first met. Here let me read it for you!' Bill clears his throat, 'Ahem, so I was writing my
         history book when Dryssa comes up to me and says 'Hail.' And so I reply. . .' Bill continues to ramble
         on for many minutes. Finally, he gets to the end of his journal and looks up. He blinks as though
         surprised that you are still here. 'Oh, yeah, the armor pattern book. Sorry, I forgot about that. Here
         you go!");
         quest::summonitem(38447); #Ancestral Halfling Armor
      } elsif(plugin::check_handin(\%itemcount, 5017 => 1))   # Minotaur Battle Axe - Part of Storming the Maze task
      {
         quest::say("Thank you very much $name.");
         
      }else {
         quest::say("I have no use for this, $name.");
         plugin::return_items(\%itemcount);
      }
   } # if($race eq "Halfling")
   else {
         quest::say("I have no use for this, $name.");
         plugin::return_items(\%itemcount);
   }
} # sub EVENT_ITEM 