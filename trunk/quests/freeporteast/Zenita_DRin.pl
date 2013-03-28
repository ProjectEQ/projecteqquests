#########################################################
# Zenita DRin (ID:10153)
# Zone:   Zenita Drin (freporte)
# Quest:  Telescope Lenses
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Greetings. I would love to chat with you, but I just realized something.. I do not waste time with whelps.");
   }
   if($text=~/lens/i){
      quest::say("So you seek the Spare Lens. Yes. I have it. There are only two ways you can obtain it, [fight] the great Zenita or [play a game of chance].");
   }
   if($text=~/play a game of chance/i){
      quest::say("Great. It is rather simple. I have five cards and only one is King Naythox. Find it. In order to get one card all you need to do is buy me a bottle of Innoruuks Kiss of Death from the barkeep in Chops N Hops. One bottle for one card. Return the King Naythox card to me and you shall get the Spare Lens.");
   }
   if($test=~/fight/i){
      quest::say("Darn!! I was hoping not to hear that word, fight. Oh well.");
      quest::attack($name);
   }
}

sub EVENT_DEATH {
   quest::say("You have no idea what a big mistake you made. Either my fellow rogues shall find you or the Freeport Mi.. Unnnghh.");
}

#############################################################
#Handin
#     13121 : Innoruuk's Kiss of Death (from 13th floor)
#Reward
#     22293 : Castle Card (from 13th floor)
#  or
#     22294 : Beggar Card (from 13th floor)
#  or
#     22295 : Joker Card (from 13th floor)
#  or
#     22296 : Wild Card (from 13th floor)
#  or
#     22297 : Queen Card (from 13th floor)
#  or
#     22298 : King Card (from 13th floor)
#  or
#     22299 : Knight Card (from 13th floor)
#############################################################
#Handin
#     22298 : King Card (from 13th floor)
#Reward
#     22293 : Telescope Lens [phiz's lens] (from 13th floor)
#############################################################

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount,13121=>1)) {
      quest::say("Let see what card you pulled.");
      quest::summonitem(quest::ChooseRandom(22293,22294,22295,22296,22297,22298,22299));
   }
   elsif(plugin::check_handin(\%itemcount,22298>=1)) {
      quest::say("Why I will be.. You got it!! I thought I took it out of the deck. Very well. You win the Spare Lens fair and square. Here you are. Now get out of my sight.");
      quest::summonitem(13279); # Phiz's lens
      quest::exp(500);
   }

#not certain if these responses below are correct, need text from live
#she says she has 5 cards, but there are 7 cards in the database that are consecutive.. I assumed they are all hers

   elsif(plugin::check_handin(\%itemcount,22299>=1)) {
      quest::say("Bad luck must be one of your strong suits. You should have been a begger because you sure aren't a very good $class. You lose!");
   }
   elsif(plugin::check_handin(\%itemcount,22297>=1)) {
      quest::say("Bad luck must be one of your strong suits. You should have been a begger because you sure aren't a very good $class. You lose!");
   }
   elsif(plugin::check_handin(\%itemcount,22296>=1)) {
      quest::say("Bad luck must be one of your strong suits. You should have been a begger because you sure aren't a very good $class. You lose!");
   }
   elsif(plugin::check_handin(\%itemcount,22295>=1)) {
      quest::say("I see you have drawn the card that best represnts a $race such as yourself. You lose!");
   }
   elsif(plugin::check_handin(\%itemcount,22294>=1)) {
      quest::say("Bad luck must be one of your strong suits. You should have been a begger because you sure aren't a very good $class. You lose!");
   }
   elsif(plugin::check_handin(\%itemcount,22293>=1)) {
      quest::say("Bad luck must be one of your strong suits. You should have been a begger because you sure aren't a very good $class. You lose!");
   }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:freporte  ID:10153 -- Zenita_DRin
