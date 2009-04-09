#Acomar_Lothwol.pl
#Beginner Magic Manual
#
#As a note, according to posts at Alla's (not the most reliable source I know, 
#but all I've got right now) the Beginner's quests eat the Planar Traveler's Manual, 
#so that quest must be completed 3 times in order to do all the Beginner's Manual 
#Quests.  This is intended behaviour.


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("It is good to see you. $name.  I trust the people of New Tanaan have treated you well thus far.  It is refreshing to see so many people of different cultures coming together in harmony. don't you think?  So many shared experiences from all corners of the universe provide us with a great benefit of wisdom.  As a teacher, my job is to share the knowledge of all things mystical with eager students.  With my help I can teach you the basics of planar magic if you are [willing to learn].");
  }
  if($text=~/willing to learn/i) {
    quest::say("The use of magic can be a taxing ordeal on the body, and quite often may leave you in a weakened state. Fortunately, I happen to know of a rather rejuvenating meal that will grant new power to your condition. If you are not familiar with the recipe for [Hobgoblin Surprise], I can tell you. What you must do is bring me some as well as your Planar Traveler's Manual. I hope you won't be long, for I am beginning to get quite hungry.");
  }
  if($text=~/hobgoblin surprise/i) {
    quest::say("Don't be put off by the name, it's actually quite tasty. To make Hobgoblin Surprise, get a pie tin, some bread, add some hobgoblin meat and brown gravy. Cook it in the oven and enjoy the results. Mmm mmm, it waters my mouth just thinking about it.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29751 => 1, 28745 => 1)) {#Hobgoblin Surprise, Planar Traveler's Manual
    quest::say("How delicious! You have done well here, I can't remember how long it's been since I've tasted a meal so fine. Take this book, it will certainly help you in your use of the magical arts. When you are ready, Cadelid Etord will give you your next lesson, so be sure to speak to him. Do not lose your book or else he may not appreciate you coming to class unprepared.");
    quest::summonitem(28795); #Beginner Magic Manual
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
    
}#END of FILE Zone:poknowledge  ID:202039 -- Acomar_Lothwol 

