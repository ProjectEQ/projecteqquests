sub EVENT_ENTERZONE {
  if ($class eq "Bard" || $class eq "Rogue") {
    if (plugin::check_hasitem($client, 52355) && !plugin::check_hasitem($client, 52358)) { #Shakey's Dilapidated Noggin, Shimmering Orange Lightstone
      quest::unique_spawn(100218, 328, 0, 0, 0, 385); #Flighty_Orange_Wisp
      $client->Message(15, "Out of the corner of your eye, you catch a glimpse of a brightly colored wisp as it darts by. It's moving at an incredible speed.");
    }
  }
}