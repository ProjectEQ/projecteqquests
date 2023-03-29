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
    );
    my $age = $client->GetAccountAge();
    for (my ($aa, $v) = each %vet_aa) {
        if ($v[2] && ($v[1] || $age >= $v[0])) {
            $client->GrantAlternateAdvancementAbility($aa, 1);
        }
    }
}