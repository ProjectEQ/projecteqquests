sub EVENT_SCALE_CALC 
{
        my $value = 0;
        my $item = undef;
        for($for_x = quest::getinventoryslotid("general.begin"); $for_x <= quest::getinventoryslotid("general.end"); $for_x++)
        {
                $item = $client->GetItemAt($for_x);
                if($item)
                {
                        if($item->IsType(1))
                        {
                                $value++;
                                $item = undef;
                        }
                }
        }
        
        if($value == 0)
        {
                $questitem->SetScale(2.5);
        }
        elsif($value == 1)
        {
                $questitem->SetScale(1.79);
        }
        elsif($value == 2)
        {
                $questitem->SetScale(1.3);
        }
        elsif($value == 3)
        {
                $questitem->SetScale(1.0);
        }
        elsif($value == 4)
        {
                $questitem->SetScale(0.74);
        }
        elsif($value == 5)
        {
                $questitem->SetScale(0.4);
        }
        elsif($value == 6)
        {
                $questitem->SetScale(0.25);
        }
        elsif($value == 7)
        {
                $questitem->SetScale(0.1);
        }
        elsif($value == 8)
        {
                $questitem->SetScale(0.0);
        }
}