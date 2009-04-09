# Monk Abysmal Sea armor
# Created by Gonner

sub EVENY_SAY {

if($text=~/hail/i){

quest::say("Greetings $name, I am looking for those calm and worldly people known as [monks]. You wouldn't happen to be one would you?"); 
}

if($text=~/i am a monk/i){

quest::say("Very nice, it does always please me to see a fellow monk. For one such as yourself, I may be able to assist. If you are in need of new equipment such as [cap], [leggings], [tunic], [bracer], [sleeves], [gloves], or [sandals] - let me know."); 
}

if($text=~/what bracer/i){

quest::say("Indeed, I can craft you a bracer. Bring me back Muramite Bracer Armor piece and I will get to work on it. You will also need a section of infused Muramite leather to finish the bracer in a loom. Talk to Nalasrine if you still some help infusing the leather."); 
}

if($text=~/what cap/i){

quest::say("I should be able to reform Muramite Helm Armor into something quite useful to you. Explore these lands until you find some Muramite leather padding. Talk to Nalasrine about infusing it, then bring piece it together with your new helm from me in a loom."); 
}

if($text=~/what gloves/i){

quest::say("I can make some fine gloves for you. Take the time to dig up some Muramite leather and have Nalasrine assist you with infusing it. Bring me Muramite Glove Armor and I can reshape it into something that you can use. Strengthen the gloves by reinforcing them with the infused leather in a loom, and a fine pair shall be yours."); 
}

if($text=~/what leggings/i){

quest::say("I believe I can reform some Muramite greaves into a pair of leggings that would fit you. Bring me a pair of Muramite Greaves and I will get to work on that. To finish your leggings you will also have to obtain two pieces of Muramite leather padding. Speak to Nalasrine about infusing it, then place the leather pieces and leggings in a loom to work them together."); 
}

if($text=~/what tunic/i){

quest::say("I can form you a nice light tunic that will not hinder you in battle. Travel into the hostile areas and bring back two sections of Muramite leather and Muramite Chest Armor. Make sure to speak to Nalasrine about infusing the sections of leather. Bring me the chest piece for reworking, then simply weld together the new chest and leather in a loom."); 
}

if($text=~/what sandels/i){

quest::say("Bring me back Muramite Boot Armor and I believe I can rework them into something quite fine for you. Once I've reworked them, you will need to take a section of infused Muramite leather along with the new boots and reinforce them in a loom. If you need help in the infusing process, just talk to Nalasrine."); 
}

if($text=~/what sleeves/i){

quest::say("Sleeves are quite simple. Venture into these strange lands and find some Muramite Sleeve Armor. Bring the armor piece to me and I will work on refitting it for you. Once you have a piece of Muramite leather padding, talk to Nalasrine about infusing the it. The new sleeve from me can be easily stitched up in a loom with the infused Muramite leather."); 
}


}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer

quest::summonitem(54205); # reworked Bracer
}

elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # cap

quest::summonitem(54203); # reworked cap
}

elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves

quest::summonitem(54206); # reworked gloves
}

elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # leggings

quest::summonitem(54208); # reworked leggings
}

elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # tunic

quest::summonitem(54209); # reworked tunic
}

elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # Sandals

quest::summonitem(54207); # reworked sandals
}

elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # Sleaves

quest::summonitem(54204); # reworked sleaves
}

else{     
quest::say("I have no use for this.");    
plugin::return_items(\%itemcount);
}
}

#END of FILE zone:abysmal ID:279023 -- Sakar_Pressl.pl

