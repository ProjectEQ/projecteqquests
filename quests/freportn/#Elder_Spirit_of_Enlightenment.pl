sub EVENT_SAY {

if(plugin::check_hasitem($client, 10651)){
    if ($text=~/hail/i) {
    quest::say("Ah, yes. You are not only a shaman, but one who has passed the tests of the heyokah. There are many problems that face us now and I grow weaker by the day. If you feel you are ready to bear a great burden and help all of those like us, including the immortals that charge our essence and consciousness, say [it is so].");
    quest::setglobal("shaman_epic",1,5,"F");
    }
    }
    elsif ($class eq "shaman"){
    quest::say("It Appears you are not yet ready for the great tasks that I require to be done. There are Others lesser than me that can guide you and prepare you to walk a greater path should you choose. You should seek them out. You can Perhaps seek knowledge from your elders and peers.");
    quest::setglobal("shaman_pre",1,5,"F");
  }
    else{
    quest::emote("eyes you with an ageless wisdom."); 
    quest::say("Ah, your spirit shines brightly. Should I know you?");
    }
   if (defined $qglobals{shaman_pre} && $qglobals{shaman_pre} == 3) { 
  if ($text=~/shaman/i) {
    quest::say("Ah, yes. You are not only a shaman, but one who has passed the tests of the heyokah. There are many problems that face us now and I grow weaker by the day. If you feel you are ready to bear a great burden and help all of those like us, including the immortals that charge our essence and consciousness, say [it is so].");
    quest::delglobal("shaman_pre");
    quest::setglobal("shaman_epic",1,5,"F");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/it is so/i) {
    quest::say("To have you here, believing in us and our existence does give me warmth, but my length of time here and others like me may be at an end. The spirits are troubled and a darkness washes through our existence that we seem helpless to prevent. That is why I talk to you now -- to help us. Without the help of mortals, we may [blow away] with the winds.");
  }
  }
    if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/blow away/i) {
     quest::say("You have heard of the darkness in Taelosia that came from another place. You may have even seen the world that is overshadowed by the dark influence of Discord. That seeping ill that is not touchable by claw or paw has wormed its way into the [streams of the spirit world] and the more it does, the more we, and I weaken.");
     }
     }
     if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/streams of the spirit world/i) {
     quest::say("Yes, it is true. I feel myself fading more with each turn of time. You are familiar with the ways of herbs and potions and you can aid me, should you [find the will]. With strength to keep me before you in the mortal realm, I can guide you so that you may aid us all. There is much to tell you that I will not reveal yet, lest you be tempted to take advantage -- which has happened before.");
     }
     }
     if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/find the will/i) {
     quest::say("Very well. You will not find this an easy task. There are several things you must do and other heyokah you must find that have helped us in the past. Where there is glitter upon the setting of Ro, you will find an agent of the spirits. In the deep waters where the megalodon is said to hunt, there is another. And where the wonders of nature rise in the dark, another ally awaits. Look for light in the denseness of entwined shadows. One will greet you with all you have learned. She is doing research in a bustling labyrinth of creatures and can educate you where I cannot. Tell them all of me and they will give you audience");
     }
     }
    $qglobals{shaman_pre}=undef;
    $qglobals{shaman_epic}=undef;
    }
    