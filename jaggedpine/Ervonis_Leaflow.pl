# Germand's Problem
# Created by Gonner
# items: 55558, 55522, 55536

sub EVENT_SAY {

if($text=~/lost/i && $germand == 1){

quest::say("I was washing its fine blade down by the river when those darned potameids attacked me. I ran but left my axe behind out of pure fear. If you could [find] it, I would be grateful and won't even charge you for some wood."); 
}

if($text=~/find/i && $germand == 1){

quest::say("Great. I would start by checking near the river. Be careful though, those potameids are dangerous!"); 
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 55558 => 1)) { # Note to Ervonis

quest::say("Germand needs some more lumber? Well I would be happy to chop some for you, but unfortunately I [lost] my axe. It was my favorite axe so I will not be chopping any more wood until I get it back."); 
quest::setglobal("germand",1,5,"F");
quest::exp(1000);

}

if (plugin::check_handin(\%itemcount, 55522 => 1 && $germand == 1)) { # Ervonis's Axe

quest::say("I cannot tell you how thankful I am. Just a moment and I will get you some wood.' Ervonis chops some wood for you and ties it into a neat bundle. 'It is a bit heavy, but I think you can handle it. Thanks again!"); 
quest::exp(2000);
quest::summonitem(55536); # Bundle of Wood
}
}


#END of FILE zone:jaggedpine ID:181151 -- Ervonis_Leaflow.pl