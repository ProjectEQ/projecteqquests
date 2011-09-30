sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 16) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
  if($wp == 43) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
  if($wp == 70) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
}

sub event_death {
quest::faction(33, -20);#Circle Of Unseen Hands
quest::faction(217, 10);#Merchants of Qeynos
quest::faction(53, -20);#Corrupt Qeynos Guards
quest::faction(135, 10);#Guards of Qeynos
quest::faction(164, -20);#Kane Bayle
quest:say("You'll pay for your actions.. my brothers are many, and their daggers swift.. you will welcome death, once they catch up to you.");
}
