sub EVENT_ENTERZONE {
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && (!$race eq "Froglok")) { #non-Froglok
    $client->Message(15, "A mysterious voice whispers to you, 'Nemeen Pekasr has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($race eq "Froglok")) { #Froglok
    $client->Message(15, "A mysterious voice whispers to you, 'Fipnoc Birribit has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }
}