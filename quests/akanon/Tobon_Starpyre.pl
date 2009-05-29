#########################################################
# Tobon_Starpyre (ID:55130)
# Zone:   Ak'Anon (akanon)
# Quest:  Gnome Wizard Newbie Note hand-in
# Quest:  Tradeskill books
# Quest:  Telescope Lenses
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("It is good to see the young show an interest in the ways of magic. Its circles can be used in tandem with our unique ways of tinkering. Have you [joined the Eldritch Collective] or are you [merely curious]?");
   }
   if($text=~/joined the Eldritch Collective/i) {
      quest::say("Very good. Would you like to [go on a little mission] or are you busy studying?");
   }
   if($text=~/merely curious/i) {
      quest::say("Please look around. We have much knowledge within these halls. May you soon find your place among our members. Good day.");
   }
   if($text=~/go on a little mission/i) {
      quest::say("Fabulous! Here is a list of the observers outside of Ak'Anon. Go and ask each for a [spare telescope lens]. Each should give you one. We have need of them.  I await your return as does your reward, either Fire Bolt or Fingers of Fire.  Meant for a skilled wizard of the eighth trial.");
      quest::summonitem(18868);# Observer List
   }
   if($text=~/who is Yendar/i) {
      quest::say("Oh, he is my older brother. Used to be the leader of the Eldritch Collective. Then he founded the Observers, a pretty good piece of work. Went off his rocker a long while back, though. Became obsessed with Innoruuk and the Teir'Dal. Stays away for days at a time, nobody knows where he has been. Mother still worries about him, asked me to keep an eye on him. But he is a grown gnome, and with his mastery of the art, has little to fear in this world or others. But if you are seeking him, I would look outside Ak'Anon, in the Steamfonts. That is where he makes his home these days.");
   }
   if($text=~/What trades/i) {
      quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
      quest::summonitem(51121);# Tradeskill Basics: Volume I
   }
   if($text=~/second book/i) {
      quest::say("Here is the second volume of the book you requested, may it serve you well!");
      quest::summonitem(51122);# Tradeskill Basics: Volume II
   }
}

#############################################################
#Handin
#     18774 : Registration Letter (from 13th floor)
#Reward
#     13523 : Soot Stained Gold Robe* (from 13th floor)
#############################################################
#Handin
#     13275 : Telescope Lens [Trudo's Lens] (from 13th floor)
#     13276 : Telescope Lens [Bidl's Lens] (from 13th floor)
#     13277 : Telescope Lens [Fodin's Lens] (from 13th floor)
#     13279 : Telescope Lens [Phiz's Lens] (from 13th floor)
#Reward
#     15380 : Spell: Column of Frost (from 13th floor)
#  or
#     15477 : Spell: Fire Bolt (from 13th floor)
#  or
#     15656 : Spell: Shock of Ice (from 13th floor)
#############################################################

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount,18774=>1)) {
      quest::say("Ah..  Welcome, friend!  I am Tobon Starpyre, Master Wizard of Library Mechanimagica.  This is our tunic - wear it with pride.  Study hard, master your skills, and make us proud. Once you are ready to begin your training please make sure that you see Xalirilan, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
      quest::summonitem(13523);
      quest::exp(100);
      quest::faction(91,1);  # +Eldritch Collective
      quest::faction(115,1); # +Gem Choppers
      quest::faction(176,1); # +King AkAnon
      quest::faction(210,1); # +Merchants of AkAnon
      quest::faction(71,-1); # -Dark Reflection
      quest::faction(322,-1);# -The Dead
   }
   elsif(plugin::check_handin(\%itemcount,13275>=1,13276=>1,13277>=1,13279>=1)) {
      quest::say("Thank you for your work. I heard news of the troubles you encountered. Besides these troubles you still completed your mission. We are grateful. And as I once stated, your reward awaits.");
      quest::summonitem(quest::ChooseRandom(15380,15477,15656));
      quest::exp(500);
      quest::givecash(0,0,0,1);
   } else {
     plugin::return_items(\%itemcount);
     quest::say("I don't need that, friend.");
   }
}

#END of FILE Zone:akanon  ID:55130 -- Tobon_Starpyre 