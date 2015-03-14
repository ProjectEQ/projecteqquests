# Hynid boots
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello. My name is Noita. I just arrived here a day ago. I have come to hopefully work on creating some [new armor designs]."); 
  }
  if ($text=~/armor designs/i) {
    quest::say("Well I work mainly with cloth and animal hides. I have come here to see if there were any new creations I could make. So far I have found one [creature] whose hide has proved to be very durable."); 
  }
  if ($text=~/creature/i) {
    quest::say("I was exploring the beach earlier today, and saw a creature that had a wolf-like appearance, but it was larger than any wolf I have ever seen. The creature proved to be quite vicious, but I was able to dispatch it. The hides I acquired made a very nice pair of boots, suitable for any adventurer. If you could perhaps bring me one boot pattern and three flawless hides from these creatures, I could attempt to make you a pair of these boots."); 
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13812 => 1, 55568 => 3)) { # Boot Pattern, Flawless Hynid Hide
    quest::say("Excellent. Hopefully I can make the same boots I did earlier.' Noita takes out her sewing kit and begins to skillfully sew the hides together. It doesn't take her long before you start to see the hides taking the familiar shape of a pair of boots. 'Here you go. These boots might be even better than the ones I made earlier. I hope they serve you well."); 
    quest::summonitem(55569); # Hynid boots
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279264 -- Noita_Ergarman.pl