sub EVENT_ENTERZONE {
  if ($class eq "Bard" || $class eq "Rogue") {
    if (plugin::check_hasitem($client, 52355) && !plugin::check_hasitem($client, 52361)) { #Shakey's Dilapidated Noggin, Reflective Viridian Lightstone
      quest::unique_spawn(127105, 234, 0, 0, 0, -14); #Flighty_Viridian_Wisp
      $client->Message(15, "Out of the corner of your eye, you catch a glimpse of a brightly colored wisp as it darts by. It's moving at an incredible speed.");
    }
  }
}