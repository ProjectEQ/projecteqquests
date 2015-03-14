sub EVENT_SCALE_CALC 
{
     if ($zoneid > 228 && $zoneid < 277) {
          $questitem->SetScale(1);
     }

     else {
          $questitem->SetScale(0);
     }
} 