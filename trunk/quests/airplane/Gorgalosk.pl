sub EVENT_SAY {
   if($text=~/hail/i) {
     quest::say("Greetings, $name. This is my domain and I hope you have a peaceful stay. That is, unless the [lunatic sent you].");
     }
   if($text=~/lunatic sent me/i) {
     quest::say("Oh, I see. I suppose you [want these cursed markers] that lunatic made me hold?");
     }
   if($text=~/cursed markers/i) {
     quest::say("I am afraid that I can not just give them away. The lunatic had them cursed. They make me do [strange things]");
     }
   if($text=~/strange things/i) {
     quest::say("Like ATTACK you!");
     quest::attack($name);
     }
}

sub EVENT_DEATH_COMPLETE {
   $sirran= undef;
   quest::setglobal("sirran",3,3,"M20");
   quest::spawn2(71058,0,0,320,540,-54,128);
}
