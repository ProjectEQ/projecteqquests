sub EVENT_SAY {
  if ($text=~/hail/i) {
  quest::emote("screams");
  quest::say("No, don't kill me!' He relaxes slightly and gives you a strange look. 'Have you been afflicted by the curse? Are you mad!? Have you any idea [who Kelekdrix] is? She will be here any moment to destroy you all. Leave now, or there will be dire [consequences]!");
   }
   if ($text=~/consequences/i) {
     quest::say("Very well, $name. You brought this upon yourself.");
     quest::spawn2(296024,0,0,$x,$y,$z,$h);
     quest::spawn2(296025,0,0,334,-662,-2,253);
     quest::spawn2(296026,0,0,369,-660,-2,1);
   }
}
