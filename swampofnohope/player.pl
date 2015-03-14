sub EVENT_ENTERZONE {
  if ($class eq "Bard" || $class eq "Rogue") {
    if (plugin::check_hasitem($client, 52355) && !plugin::check_hasitem($client, 52360)) { #Shakey's Dilapidated Noggin, Glimmering Violet Lightstone
      quest::unique_spawn(83245, 302, 0, 0, 0, -14); #Flighty_Violet_Wisp
      $client->Message(15, "Out of the corner of your eye, you catch a glimpse of a brightly colored wisp as it darts by. It's moving at an incredible speed.");
    }
  }
}