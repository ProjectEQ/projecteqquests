sub EVENT_SCALE_CALC 
{
        my $guk_wins = $client->GetLDoNWinsTheme(1);
        my $mir_wins = $client->GetLDoNWinsTheme(2);
        my $mmc_wins = $client->GetLDoNWinsTheme(3);
        my $ruj_wins = $client->GetLDoNWinsTheme(4);
        my $tak_wins = $client->GetLDoNWinsTheme(5);
        if($guk_wins > 70)
        {
                $guk_wins = 70;
        }
        
        if($mir_wins > 68)
        {
                $mir_wins = 68;
        }
        
        if($mmc_wins > 76)
        {
                $mmc_wins = 76;
        }
        
        if($ruj_wins > 74)
        {
                $guk_wins = 74;
        }

        if($tak_wins > 78)
        {
                $tak_wins = 78;
        }
        
        my $total = $guk_wins + $mir_wins + $mmc_wins + $ruj_wins + $tak_wins;
        $questitem->SetScale($total/366);
}