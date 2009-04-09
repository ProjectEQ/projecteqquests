sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Hrmm? Oh, hello there, $name. I have to say, Norrath getting closer lately has been pretty to watch, but now that thrill has worn off, it really gets in the way of seeing the stars behind it. Trying to divine the will of spirits from astral patterns and nebular activity is a lot easier without a planet in your face,");
  }
  if ($text=~/drop of moonlight/i) {
    quest::say("'Under normal circumstances I am happy to sell a drop of moonlight- it is one of the few ways for an Astrologer to make any money,' she chuckles. 'Problem right now is that my telescope is out of commission and trying to harness a drop of moonlight without a telescope is rather akin to trying to catch a fish with your bare hands, know what I mean?' Laughing heartily at her own joke, she continues, 'Anyway, if you want, I would be happy to trade you a fresh drop of moonlight for a new reflective shard. You may need to head to the Geerloks in Katta for one though, I do not believe anyone sells them locally.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 16860 =>1 )) {
    quest::say("Here is your moonlight");
    quest::summonitem(5992);
      }
      plugin::return_items(\%itemcount);
}