sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The blessing of Quellious upon you, $name. Are you on your way to the [estate], or have you come to confront the many dangers of the cauldron?");
  }
  if ($text=~/estate/i) {
    quest::say("Ah, the cursed undead there are truly a wretched bunch. Those grounds were not always that way, you know. Once it was a beacon for hope and worship to my goddess, and I hope to see it as such again. Would you care to hear the [tale] of the estate?");
  }
  if ($text=~/tale/i) {
    quest::say("The estate was originally built by a cleric of Quellious, named Calim Malsiv. It was to be a great outpost for the glory of Quellious. From there Calim was going to spread the word of the goddess to all on Faydwer. Indeed all was going well until that [fateful day].");
  }
  if ($text=~/fateful day/i) {
    quest::say("It all began with a dwarf from Kaladim that found himself in some trouble about the same time that Calim began his construction of Unrest. The dwarf's name was Garanel Rucksif. To all who knew him he was a peaceful and hard working dwarf. He held a prestigious position within the Kaladim mining guild, and had a loving family. No one who knew him would have ever conceived that he would be capable of [what he did].");
  }
  if ($text=~/he do/i || $text=~/he did/i) {
    quest::say("One day, he seemed to completely lose his mind, little is known about what caused this though I personally suspect the hand of Innoruuk was involved. In a fit of blind rage and hatred, he murdered his wife and three children. As news of this horror spread, the citizens of Kaladim were outraged and fearful of the crazed dwarf and began to take up arms, meaning to bring their own [judgment] down upon Garanel for his actions.");
  }
  if ($text=~/judgment/i) {
    quest::say("I can only imagine he was to be put to death by their vengeful hands. That was not what happened though. Garanel must have heard the whispers and even in his rage realized he must leave his homeland or face his own death. He wandered the mountains for some time and eventually found himself by the water of Dagnor's Cauldron. From there it was not long before he found himself on the grounds of the Estate of Unrest. Calim happened upon Garanel, as he sought a place to hide, and heard his confused and twisted tale. With his faith in Quellious and peace, Calim sought to aid the dwarf and took him into the mansion. What [happened] next is almost too terrible to tell.");
  }
  if ($text=~/happened/i) {
    quest::say("Calim and Garanel climbed to the top of the tower, along with several of Calim's own kin. There they began to talk about what had happened and see what they could do to discover the cause of the madness and what could be done about it. Unfortunately before they could overcome the problem, Garanel's madness rose once again. In a fury beyond anything you can dream, Garanel tore through Calim's kin before finally turning on [Calim] himself.");
  }
  if ($text=~/calim/i) {
    quest::say("Calim called upon Quellious for aid in that moment, but was not quick enough. No force could stop Garanel then. The enraged dwarf slaughtered Calim, but as Calim's blood spread on the floor, the attention of Quellious was drawn fully to the estate. Upon seeing the devastation of her loyal followers, Quellious cursed Garanel and the entire estate along with him. It was a terrible curse that endures to this day. However, it is my [mission] to see this curse undone.");
  }
  if ($text=~/mission/i) {
    quest::say("It is my belief that if we could travel through time and undo the deaths of Calim and his kin, that the curse will never come to pass. To this end I have been studying portal spells in hopes of finding a way back to that day. I believe I have finally succeeded, but have discovered a new [snare] in my plans.");
  }
  if ($text=~/snare/i) {
    quest::say("While I believe I can travel back to that fateful day, I doubt I have the power to stop Garanel myself. Wait. . . if you are [willing], we might be able to work together and fulfill my mission.");
  }
  if ($text=~/willing/i) {
    quest::say("Bless you $name. I will activate the portal so that you may use it. Travel back and see to it that Garanel is unable to complete his bloody work.");
    #Assign task 'The Curse Begins'
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 00000 => 1)) { #
    quest::say("");
  }
  elsif (plugin::check_handin(\%itemcount, 00000 => 1)) { #
    quest::say("");
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}