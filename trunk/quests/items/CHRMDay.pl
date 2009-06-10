sub EVENT_SCALE_CALC 
{
     if ($zonetime > 799 && $zonetime < 2000) {
          $questitem->SetScale(1);
     }

     else {
          $questitem->SetScale(0);
     }
} 