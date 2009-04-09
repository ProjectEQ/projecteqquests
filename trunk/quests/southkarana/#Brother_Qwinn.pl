sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("In the name of the [Brotherhood of the Lost Circle] I greet you.");
}
if ($text=~/Brotherhood of the Lost Circle/i){quest::say("The [Monks of the Whistling Fist] are called the Lost Circle by others. We are an ancient league of monks. Long forgotten and few remaining. Within this realm there are only two. I and [Brother Zephyl]. We seek the items stolen from us. I seek the [Code of Zan Fi].");
}
if ($text=~/Monks of the Whistling Fist/i){quest::say("The Monks of the Whistling fist were forged from the ways of the great master , Zan Fi. When the Combine Empire reigned supreme, a single bard grew to learn the ways of the monk. This bard was Zan Fi. The brotherhood was all but destroyed in the times that followed. Now only a few remain to carry on Zan Fi's legacy.");
}
if ($text=~/What is the Code of Zan Fi/i){quest::say("The tome called the Code of the Whistling Fist has been stolen from me. It contains many secrets pertaining to our brotherhood. Thankfully it is magically locked and only a Zan Fi master could unlock it. I quest for a monk to retrieve it. Would you be an [interested monk].");
}
if ($text=~/I am an interested monk/i){quest::say("Then venture into the depths beyond the great Solusek Mining Company. There, living among the Kobolds, will be Targin the Rock. Get the book from him and return here and wait for my reappearance. When we meet again you shall hand me the book and a Purple Headband earned from the Silent Fist Clan. Do so and you shall be closer to joining the brotherhood.");
}
if ($text=~/Who is Brother Zephyl/i){quest::say("Brother Zephyl is searching for one who can return the [Idol of Zan Fi]. I believe he is within the vicinity of the Rathe Mountains.");
}
if ($text=~/What is Idol of Zan Fi/i){quest::say("The Idol of Zan Fi is a sacred totem to our brotherhood. I cannot share it's secrets, but I can tell you that [Brother Zephyl] will offer to you a reward for it's return.");
}
if ($text=~/return the headband/i){quest::say("Then you will return that which was earned or the robe."); }
}
sub EVENT_ITEM { 
if ($itemcount{12316} == 1 && $itemcount{10114} == 1 ){
quest::say("We had an agreement. The proof of a skilled monk, the purple Headband, and the Code of the Whistling Fist.");
quest::say("We thank you for the return of the Code of the Whistling Fist. Take this sewing needle. You shall find it useful should you aid [Brother Zephyl] in his quest. His item, the needle, a swatch of shadow silk and a scroll containing Jonathan's Whistling Warsong. Into a sewing kit they will be going. And into the brotherhood will you. I hope you do not wish me to [return the headband]..");
quest::summonitem("12314");	
quest::exp("200");
}
if ($itemcount{12314} == 1 ){
quest::summonitem("10114");	
}
if ($itemcount{12256} == 1 ){
quest::summonitem("10114");	}
}
#END of FILE Zone:southkarana  ID:436 -- Brother_Qwinn 

