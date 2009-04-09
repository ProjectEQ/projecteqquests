sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name!  Welcome to Rivervale!  I hope you plan to stay on and assist us in any way you can.  We all have talents to aid in the prosperity of the hollow.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9475 => 1)) {#rogue 1.5 handin
    quest::say("Ah, thank you. I was a bit parched.' Mayor Gubbin unstops the flask and takes a healthy swig of the brew. He makes a strange face and licks his lips while staring at the bottle. 'Wow, this is delicious. Like no other drink I've ever tried. This is even better than that Spiced Jumjum that Lanena is so fond of. Wait a moment . . . Is this the brew that Deeppockets keeps trying to hawk in my town? Well now, I suppose it's not so bad. Hmm. Why don't you tell him I've changed my mind. Tell Lendel he has my blessing and is welcome to bring in as much of this as he can sell.");
    quest::summonitem(13588);
  }
}


#END of FILE Zone:rivervale  ID:19104 -- Mayor_Gubbin 

