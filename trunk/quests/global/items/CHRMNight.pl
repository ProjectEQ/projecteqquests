sub EVENT_SCALE_CALC 
{
     if ($zonetime < 800 || $zonetime > 1999) {
          $questitem->SetScale(1);
     }

     else {
          $questitem->SetScale(0);
     }
} 