#Tower of Frozen Shadow Group-Based Teleporting on key usage by Shin Noir.
sub EVENT_CLICKDOOR {
    if ($client->IsGrouped()) { #This code is purely for grouped members teleporting.
        my $destx = 0;
        my $desty = 0;
        my $destz = 0;
    	my $d_id = ($doorid % 256);
        if ($d_id == 2 || $d_id == 166) { #First Floor Door
            if ($client->KeyRingCheck(20033) || plugin::check_hasitem($client, 20033)) {
                $destx = 660;
                $desty = 100;
                $destz = 40;
            }
        }
        if  ($d_id == 4 || $d_id == 167) { #Second Floor Door
            if ($client->KeyRingCheck(20034) || plugin::check_hasitem($client, 20034)) {
                $destx = 670;
                $desty = 750;
                $destz = 75;
            }
        }
        if  ($d_id == 16 || $d_id == 165) { #Third Floor Door
            if ($client->KeyRingCheck(20035) || plugin::check_hasitem($client, 20035)) {
                $destx = 170;
                $desty = 755;
                $destz = 175;
                $desth = 0;
            }
        }
        if  ($d_id == 27 || $d_id == 169) { #Fourth Floor Door
            if ($client->KeyRingCheck(20036) || plugin::check_hasitem($client, 20036)) {
                $destx = -150;
                $desty = 160;
                $destz = 217;
            }
        }
        if  ($d_id == 34 || $d_id == 168) { #Fifth Floor Door
            if ($client->KeyRingCheck(20037) || plugin::check_hasitem($client, 20037)) {
                $destx = -320;
                $desty = 725;
                $destz = 12;
            }
        }
        if  ($d_id == 1) { #Sixth Floor Door
            if ($client->KeyRingCheck(20039) || plugin::check_hasitem($client, 20039)) {
                $destx = 20;
                $desty = 250;
                $destz = 355;
            }
    	}
    	if ($destx != 0) { #Key trigger found. Teleport nearby group members.
            my $tmpclient = 0;
        	for ($i = 0; $i < 2000; $i++) { #I would use a cycle of $client->GetGroup()->members[] but was having issues with it!
                $tmpclient = $entity_list->GetClientByID($i);
                if (defined($tmpclient)) {
                    if ($tmpclient->GetGroup()->IsGroupMember($client) #Grouped with key holder?
                        && $tmpclient->CalculateDistance($client->GetX(), $client->GetY(), $client->GetZ()) < 40) {
                        $tmpclient->CastToClient()->MovePC(111, $destx, $desty, $destz, 0);
                    }
               }
               undef($tmpclient);
            }
        }
   }
}