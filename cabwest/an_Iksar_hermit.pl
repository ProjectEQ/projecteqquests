# items: 17195, 12886, 4266, 4267
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I am looking for a [great sorcerer]. Are you such a person?");
  }
  elsif (($text=~/great sorcerer/i) && plugin::check_hasitem($client, 4266) && ($ulevel => 35)) {
    quest::say("Are we now? Well then take this. See if you can finish this project that I started so many years ago. It still requires a [whip], a [tassel], and a [lock]. Go and find these items and return to me with what you have already learned and I shall reward you.");
    quest::summonitem(17195); # Item: Flaxen Hilt
  }
  elsif ($text=~/whip/i) {
    quest::say("Many years ago in Dreadlans a drovarg came and ravaged my camp and stole a whip that was given to me by my master. With the loss of the whip I became an outcast to the dark arts.");
  }
  elsif ($text=~/tassel/i) {
    quest::say("You should find a large ghostly tassel, I was on my way to Kaesora to learn about this tassel but my age has hindered this adventure. You should go there and see what you can find.");
  }
  elsif ($text=~/lock/i) {
    quest::say("Only a goblins hair is strong enough to hold this together. Go and slay them till you find a lock of hair strong enough for this.");
  }
  else {
    quest::say("You have many more deeds yet to accomplish.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12886 => 1, 4266 => 1)) {
    quest::emote("takes the flail and vanishes with a brilliant flash!! Within your hands appears a skullcap. You hear a voice echo through the cave. Well done. You are a formidable necromancer. We thank you.");
    quest::depop_withtimer();
    quest::summonitem(4267); # Item: Necromancer Skullcap
    quest::faction(441, 20); # Faction: Legion of Cabilis
    quest::faction(443, 20); # Faction: Brood of Kotiz
    quest::exp(10000);
  }
  else {
    quest::say("All is not complete. A cap and the rest, which was asked for, is required.");
  }
  plugin::return_items(\%itemcount); # return unused items
}
