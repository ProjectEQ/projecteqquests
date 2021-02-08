sub EVENT_ENTERZONE { #message only appears in Cities / Pok and wherever the Wayfarer Camps (LDON) is in.  This message won't appear in the player's home city.
  if($ulevel >= 15 && !defined($qglobals{Wayfarer})) {
    if($client->GetStartZone()!=$zoneid && ($zoneid == 1 || $zoneid == 2 || $zoneid == 3 || $zoneid == 8 || $zoneid == 9 || $zoneid == 10 || $zoneid == 19 || $zoneid == 22 || $zoneid == 23 || $zoneid == 24 || $zoneid == 29 || $zoneid == 30 || $zoneid == 34 || $zoneid == 35 || $zoneid == 40 || $zoneid == 41 || $zoneid == 42 || $zoneid == 45 || $zoneid == 49 || $zoneid == 52 || $zoneid == 54 || $zoneid == 55 || $zoneid == 60 || $zoneid == 61 || $zoneid == 62 || $zoneid == 67 || $zoneid == 68 || $zoneid == 75 || $zoneid == 82 || $zoneid == 106 || $zoneid == 155 || $zoneid == 202 || $zoneid == 382 || $zoneid == 383 || $zoneid == 392 || $zoneid == 393 || $zoneid == 408)) {
	  $client->Message(15,"A mysterious voice whispers to you, 'If you can feel me in your thoughts, know this -- something is changing in the world and I reckon you should be a part of it. I do not know much, but I do know that in every home city and the wilds there are agents of an organization called the Wayfarers Brotherhood. They are looking for recruits . . . If you can hear this message, you are one of the chosen. Rush to your home city, or search the West Karanas and Rathe Mountains for a contact if you have been exiled from your home for your deeds, and find out more. Adventure awaits you, my friend.'");
	}
  }
}

sub EVENT_COMBINE_VALIDATE {
	# $validate_type values = { "check_zone", "check_tradeskill" }
	# criteria exports:
	#	"check_zone"		=> zone_id
	#	"check_tradeskill"	=> tradeskill_id (not active)
	if ($recipe_id == 10344) {
		if ($validate_type =~/check_zone/i) {
			if ($zone_id != 289 && $zone_id != 290) {
				return 1;
			}
		}
	}
	
	return 0;
}

sub EVENT_COMBINE_SUCCESS {
    if ($recipe_id =~ /^1090[4-7]$/) {
        $client->Message(1,
            "The gem resonates with power as the shards placed within glow unlocking some of the stone's power. ".
            "You were successful in assembling most of the stone but there are four slots left to fill, ".
            "where could those four pieces be?"
        );
    }
    elsif ($recipe_id =~ /^10(903|346|334)$/) {
        my %reward = (
            melee  => {
                10903 => 67665,
                10346 => 67660,
                10334 => 67653
            },
            hybrid => {
                10903 => 67666,
                10346 => 67661,
                10334 => 67654
            },
            priest => {
                10903 => 67667,
                10346 => 67662,
                10334 => 67655
            },
            caster => {
                10903 => 67668,
                10346 => 67663,
                10334 => 67656
            }
        );
        my $type = plugin::ClassType($class);
        quest::summonitem($reward{$type}{$recipe_id});
        quest::summonitem(67704); # Item: Vaifan's Clockwork Gemcutter Tools
        $client->Message(1,"Success");
    }
}

sub EVENT_CONNECT {
    # the main key is the ID of the AA
    # the first set is the age required in seconds
    # the second is if to ignore the age and grant anyways live test server style
    # the third is enabled
    my %vet_aa = (
        481 => [31536000, 1, 1], ## Lesson of the Devote 1 yr
        482 => [63072000, 1, 1], ## Infusion of the Faithful 2 yr
        483 => [94608000, 1, 1], ## Chaotic Jester 3 yr
        484 => [126144000, 1, 1], ## Expedient Recovery 4 yr
        485 => [157680000, 1, 1], ## Steadfast Servant 5 yr
        486 => [189216000, 1, 1], ## Staunch Recovery 6 yr
        487 => [220752000, 1, 1], ## Intensity of the Resolute 7 yr
        511 => [252288000, 1, 1], ## Throne of Heroes 8 yr
        2000 => [283824000, 1, 1], ## Armor of Experience 9 yr
        8081 => [315360000, 1, 1], ## Summon Resupply Agent 10 yr
        8130 => [346896000, 1, 1], ## Summon Clockwork Banker 11 yr
        453 => [378432000, 1, 1], ## Summon Permutation Peddler 12 yr
        182 => [409968000, 1, 1], ## Summon Personal Tribute Master 13 yr
        600 => [441504000, 1, 1] ## Blessing of the Devoted 14 yr
    );
    my $age = $client->GetAccountAge();
    for (my ($aa, $v) = each %vet_aa) {
        if ($v[2] && ($v[1] || $age >= $v[0])) {
            $client->GrantAlternateAdvancementAbility($aa, 1);
        }
    }
}
