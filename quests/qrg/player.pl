sub EVENT_ENTERZONE {
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($client->GetStartZone()==$zoneid)) {
    $client->Message(15, "A mysterious voice whispers to you, 'Narwkend Falgon has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }
}