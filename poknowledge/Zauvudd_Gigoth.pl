#Zauvudd_Gigoth.pl
#Beginner Combat Manual
#
#As a note, according to posts at Alla's (not the most reliable source I know, 
#but all I've got right now) the Beginner's quests eat the Planar Traveler's Manual, 
#so that quest must be completed 3 times in order to do all the Beginner's Manual 
#Quests.  This is intended behaviour.

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name. If you are looking for something in particular, I might be able to help you. I spent many years teaching combat techniques to the finest warriors in Grobb. I came to New Tanaan to further develop my teaching skills; it seems we all have our own lessons to learn. I can teach you a few things if you are looking to be taught. I will teach you the basics of planar combat if you are [willing to learn].");
  }
  if($text=~/willing to learn/i) {
    quest::say("This is good. One of the most important aspects to your battle readiness is your strong willpower and bravery. Years ago I discovered a particular concoction that will very readily put your willpower to the test. Unfortunately I ran out not too long ago and I am in need of some more [Planar Blood Brew]. If you can make some more for my students, it would certainly look favorably upon you in your future teachings. Bring me some along with your Planar Traveler's Manual.");
  }
  if($text=~/planar blood brew/i) {
    quest::say("To make the infamous Planar Blood Brew, you must attain some Nightmare Mephit Blood, Slarghilug Blood, Bubonian Blood, Soda Water, Grapes, a Cask, a Cork, and a Corking Device. Mix them in a Brew Barrel, and if you are skilled enough, the resulting swill should curl the hairs on even the hardiest of traveler's heads!");
  }
}
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28787 => 1, 28745 => 1)) { #Planar Blood Brew, Planar Traveler's Manual
    quest::say("Wow, this is great! Wow! This is may be the best Planar Blood Brew I have ever tasted! You have passed the first test with flying colors. Here, you take this book and learn well from it. When you are ready for your next lesson, speak to Xasri Virek.");
    quest::summonitem(28788); #Beginner Combat Manual
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge  ID:202044 -- Zauvudd_Gigoth