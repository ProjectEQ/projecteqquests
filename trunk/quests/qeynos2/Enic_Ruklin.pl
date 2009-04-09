sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail! These are the sacred grounds of the Temple of Life. Please do not cause any disturbances while on our grounds. I would hate to have to hurt you. In the name of Rodcet Nife, of course. Now excuse me, I have a [problem] to attend to.");
  }
  if ($text=~/What problem/i) {
    quest::say("I have been charged with the duty of protecting the [Pool of Jahnda] and its fish. Now it seems as though a beast by the name of [Frostbite] has slurped up another one of the sacred fish, the [Koalindl]. If I do not get the little corpse of this fish back, I could be in trouble. Any respected member of this temple who aids me will be rewarded greatly.");
  }
  if ($text=~/Pool of Jahnda/i) {
    quest::say("The Pool of Jahnda is not meant for public use. It is a sacred pool created for the [Koalindl]. They say that, every so often, the Prime Healer visits our plane in the guise of a Koalindl. He swims in our pool.");
  }
  if ($text=~/Koalindl/i) {
    quest::say("The fish called Koalindl were a gift to Priestess Jahnda from the Prime Healer. They come from the plane of health. To kill one Koalindl is to bring the wrath of Rodcet Nife and the Priests of Life down upon you.");
  }
  if ($text=~/frostbite/i) {
    quest::say("Frostbite is a dog. He belongs to some barbarian who visits the city every so often. I know not where they are from. I cannot see them coming from Halas. Their visits are too frequent.");
  }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 13383 => 1)) {
      quest::say("Thank you!"); #text made up
      quest::summonitem(quest::ChooseRandom(13297,13296));
      quest::givecash(0,0,2,0);
      quest::exp(400);
   }
plugin::return_items(\%itemcount);
}