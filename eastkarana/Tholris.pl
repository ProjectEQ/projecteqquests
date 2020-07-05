# Tholris
#
# items: 62618, 62619
my $saydisease;

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::emote("breathes quickly and sweats as he channels his spirit into the sky.");
  }
}

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 62846)) { 
		$client->Message(15,"The crystal glows warm in the presence of Althele and Tholris.");
		$saydisease=0;
  }
}

sub EVENT_SAY {
	if(($text=~/you are diseased/i) && plugin::check_hasitem($client, 62846)) {
		$saydisease=$saydisease+1;
		if($saydisease==1) {
			quest::emote("looks at you indignantly");
		}
		elsif($saydisease==2) {
			quest::emote("kicks dirt at your feet");
		}
		elsif($saydisease==3) {
			$saydisease=0;
			quest::emote("shakes his head. Then he catches a glimpse of the Mind Crystal and looks thoughtful for a moment. Then he reaches into his pocket and produces two unusual crystals and hands them to you.");
			quest::summonitem(62618); # Item: Red Crystal
			quest::summonitem(62619); # Item: Violet Crystal
			quest::signalwith(15044,11111,1); # NPC: Althele
		}
	}
}
# EOF zone: eastkarana ID: 15043 NPC: Tholris

