sub EVENT_SAY {
   my $random_result = int(rand(100));
   if (($text=~/hail/i) && ($random_result <= 50)) {
      quest::say("You're welcome to leave this camp at once!! We are not here to keep you warm and safe from harm!!");
      quest::signal(70006, 5);
   }
   elsif ($text=~/chalice of conquest/i) {
      quest::say("Looking for the chalice, are you? Ha!! I don't know where it is, but I know a [lost soul] who does and he could lead you right to it. He had a taste of it and now he can't get enough. He is sort of under the weather, or do I mean under the ground? Ha!!");
   }
   elsif ($text=~/lost soul/i) {
      quest::say("The orc named Captain Klunga knows where it's buried. Unfortunately, his time on Norrath has passed. I happen to know two things... one, he is buried somewhere in this territory and two, I can [raise Klunga] and he can show you where the chalice is.");
   }
   elsif ($text=~/raise klunga/i) {
      quest::say("I can raise Captain Klunga if I have a portion of his blood, an item he once owned and the most important part, 100 gold coins!! Hehe!! A gnome's got to make a living, you know?");
   }
   else {
      quest::say("What business do you have here?!! Trying to keep safe? Expecting us to fight your battles? Bah!!");
   }
}

sub EVENT_ITEM {
   my $cash = $copper + $silver * 10 + $gold * 100 + $platinum * 1000;

   if (($cash >= 10000) && (plugin::check_handin(\%itemcount, 12280 => 1, 18946 => 1))) {
      quest::say("Biggily boo, biggily borc.. Raise that stinky orc!! Bamm!! Okay!! It's done. Now all you have to do is find him in the spot where his soul left him and give him an orc shovel. Oh!! I didn't mention that? Oh, well. I'm sure you can find one.. somewhere. Now, get lost before I turn you into a toad!");
      quest::faction(91, 25);
      quest::faction(71, -25);
      quest::faction(322, -25);
      quest::faction(115, 25);
      quest::faction(176, 25);
      quest::exp(18000);
      
      #Spawn Captain Klunga at the orc camp firepit
      quest::spawn2(70072, 0, 0, -2133.49, -727.05, 154.86, 0);
   }
   else {
      quest::givecash($copper, $silver, $gold, $platinum);
   }
   
   plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
   quest::say("Ha!! One like that one stands no chance within this realm. The goblins shall skin him alive!!");
   quest::signal(70005, 5);
}