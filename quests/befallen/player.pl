sub EVENT_ENTERZONE {
  if ($class eq "Bard" || $class eq "Rogue") {
    if (plugin::check_hasitem($client, 52355) && !plugin::check_hasitem($client, 52357)) { #Shakey's Dilapidated Noggin, Pulsing Rose Lightstone
      quest::unique_spawn(36102, 2, 0, 165, -170, -10); #Flighty_Rose_Wisp
      $client->Message(15, "Out of the corner of your eye, you catch a glimpse of a brightly colored wisp as it darts by. It's moving at an incredible speed.");
    }
  }
}