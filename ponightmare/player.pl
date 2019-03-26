sub EVENT_CLICKDOOR {
    if ( $doorid == 59 ) {
        if (   defined( $qglobals{pop_pon_construct} )
            && defined( $qglobals{pop_pon_hedge_jezith} ) )
        {
            if ( quest::has_zone_flag(221) != 1 ) {
                quest::set_zone_flag(221);
                $client->Message( 15, "You have received a character flag!" );
            }
        }
    }
}

sub EVENT_LOOT {
    if ( $class eq "Paladin" && $looted_id == 69951 ) {
        if ( defined( $qglobals{paladin_epic} )
            && $qglobals{paladin_epic} >= 5 )
        {
            if ( !defined( $qglobals{paladin_epic_pon} ) ) {
                quest::setglobal( "paladin_epic_pon", "1", 5, "F" );
                $x = $client->GetX();
                $y = $client->GetY();
                $z = $client->GetZ();
                quest::spawn2( 283157, 0, 0, $x, $y, $z, 0 ); # NPC: a_chest
            }
            return 0;
        }
        else {
            return 1;
        }
    }

    if ( $class eq "Wizard" && $looted_id == 11474 ) {
        if ( defined( $qglobals{wiz_epic} ) && $qglobals{wiz_epic} == 1 ) {
            if ( !defined( $qglobals{wiz_pon_chest} ) ) {
                quest::setglobal( "wiz_pon_chest", "1", 5, "F" );
                $x = $client->GetX();
                $y = $client->GetY();
                $z = $client->GetZ();
                quest::spawn2( 283157, 0, 0, $x, $y, $z, 0 ); # NPC: a_chest
            }
            return 0;
        }
        else {
            return 1;
        }
    }
}

