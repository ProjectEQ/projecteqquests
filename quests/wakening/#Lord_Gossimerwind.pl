sub EVENT_SAY {
  # Require better than indifferent faction
  if ($faction < 5) {
    if ($text=~/hail/i) {
      quest::emote("blinks at you a few times then speaks in a strangely musical, draconic voice. 'You vish to azzizt ze count of ze Tunarean Faerie Dragons?");      
    }
    if ($text=~/assist/i) {
      quest::say("I vish to ztop ze Kromzek Foreman from continuing ta deztroy thiz land. Iv you vish to azzizt you can zlay ze Foreman and bring me hiz helm az proof.");
    }
  }
  else {
    # Made text up
    quest::say("You are no friend of the Tunarean Court.  Leave me.");
  }
}

sub EVENT_ITEM {
  # Require better than indifferent faction
  if ($faction < 5) {
    if (plugin::check_handin(\%itemcount, 24873 => 1)) {
      # Made text up
      quest::say("Good, ze Foreman iz dead and now we will be left in peazz.  Take diz az a zign of my friendship.");
      quest::summonitem(24868);
      quest::faction(344, 30); # +Tunarean Court
      quest::exp(100);
    }
    else {
      # Made text up
      quest::say("I have no use for this, $name.");
      plugin::return_items(\%itemcount);
    }
  }
  else {
    # Made text up
    quest::say("I will not aid someone who is not a friend of the Tunarean Court.");
  }
}

# Quest by mystic414