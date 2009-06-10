sub EVENT_SCALE_CALC 
{
     if ($zoneweather == 1 || $zoneweather == 2) {
          $questitem->SetScale(1);
     }

     else {
          $questitem->SetScale(0);
     }
} 