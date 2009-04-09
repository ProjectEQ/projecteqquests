# key to jaled dar's tomb - Neb
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::signalwith(123105,99,1000);
  }
  if ($text=~/chetari/i) {
    quest::say("Rika sa vi na Chetari aga val rak Zlandicar. The Chetari are an evil breed, shaped by Zlandicar. Asila sa vi ne Paebala ika so takina. They enslave the Paebala. Canti ri va ni makata ra Paebala. The Paebala revolted years ago. Mishi ro ka rilla vi ne graka sal ogoo mashan rina, villi rassa rassa ke! They are powerful in the ways of death, but they fear our goo friends, and our teeth are sharp! Rika re rika so malti fe isha kora, Chetari fa rish na
Paebala. But the Chetari will not rest until we are all dead or slaves. Villi rassa rassa ke, korta ne riki sa vena. Our teeth are sharp, but we can not win. Wilta fa unala kisha Zlandicar maka re, villa rasssa, moa Chetari isa rolak. Zlandicar has the sharpest teeth, and the Chetari do his bidding.");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 101) {
    quest::say("Chika val na vi Paebala Neb'ri. I am Neb of the Paebala.
Aknila sa rik nor valkuta aknila. Start no trouble, there will be no
trouble. Nish ala ro tak na re Chetari, skas vena ral. Avoid the
Chetari, they will kill you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 26033 => 1, 26009 => 1)) {
    quest::say("Ika Paebala ma ri skasha, Neb`ri mi re skashi! The Paebala
are joyful, Neb is joyful! Misu na tona Vaniki esa Zlandicar, no re Paebala soka mora Chetari, ika tu. With the death of Vaniki and Zlandicar, the Paebala can conquer the Chetari, and rule! Mika na so kaka rika, ug boro Neb`ri, ek val Vaniki ushta. Take this, it is Neb's fighting bone, and here, this key I took from Vaniki.");
    quest::summonitem(26040);
    quest::summonitem(28060);
    quest::exp(250000);
    quest::faction(244,50); #paebala
    quest::faction(32,-150); #chetari
    quest::faction(365,-150); #zlandicar
  }
  if (plugin::check_handin(\%itemcount, 69341 => 1)) {
  quest::say("Ika vora isa, viia solta ian raka. Thank you for this concoction. Loka vula riluua zlandicar. We will use this on Zlandicar's allies. Wurna so vi re drikinavi wo isa maka. This will aide us greatly in our struggle against them. Wula vaa ria muta nish ala aknila nexona. Here is a sealed note to give to Nexona as proof of this delivery. Val na vi paebala yi no sa saka! All of the paebala thank you, tallone!"); #For Assist Nexona Quest
  quest::summonitem(69344);
  quest::exp(10000);    
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: necropolis ID: 123045 NPC: Neb

