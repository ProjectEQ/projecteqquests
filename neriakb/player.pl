#There's a gate in the Neriak Commons that is actually three separate doors, but the gates should all lift together as one. This CLICKDOOR script accomplishes that.

sub EVENT_CLICKDOOR {
  if($doorid == 1) {
    quest::forcedooropen(2);
    quest::forcedooropen(49);
  }
  if($doorid == 2) {
    quest::forcedooropen(1);
    quest::forcedooropen(49);
  }
  if($doorid == 49) {
    quest::forcedooropen(1);
    quest::forcedooropen(2);
  }
}

sub EVENT_ENTERZONE {
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($client->GetStartZone()==$zoneid)) {
    $client->Message(15, "A mysterious voice whispers to you, 'Kwilrz Vn`Ycxa has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }
}

#Submitted by Jim Mills