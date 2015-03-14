sub EVENT_DEATH_COMPLETE {
  quest::emote("writhes in pain as his body falls to the floor. Your valiant efforts have resulted in the rescue of Kreshin.");
   quest::signalwith(281116,2,0);
  quest::spawn2(281124,0,0,-1741,-1079,-14.5,128); #Kreshin_Silentcog
  
}