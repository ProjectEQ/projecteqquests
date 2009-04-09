#Rytan's Progressive Fletching Quest
#Zone Shar Vahl  ID:155173 -- Rytan

sub EVENT_SAY {

if($text=~/hail/i){
quest::say("Hello $name, I trust all is well with you today. Come in and have a look around, just
 let me know if you see anything you like. By the way, I am in need of the assistance of an official
Shar Vahl citizen. If you know of any please send them my way.");
}

if($text=~/citizen/i){
quest::say("Wonderful! Please, show me your acrylia slate and I'll disclose my errand.");
}

if($text=~/grimling fang darts/i){
quest::say("A grimling fang combined with a bone shard will make a dart slightly better than the
 xakra tooth dart, which will also sell for slightly more.");
}

if($text=~/grimling fangs/i){
quest::say("The grimlings are the beings who attack our people around the Acrylia mines. They have
 the ability to use magic against us. Be careful if you wish to travel north. We have been waging war
 in that area.");
}

if($text=~/rockhopper talon darts/i){
quest::say("Rockhopper talon darts are slightly better than grimling fang darts and will sell for
a little more. The hooked dart crafting tool and a rockhopper foot will yield one of these darts.")
}

}

sub EVENT_ITEM {

if(plugin::check_handin(\%itemcount,2877=>1)){
quest::summonitem("2877");
quest::summonitem("17231");
quest::say("Here's my dilemma, I am low on darts to sell and I need to replenish my supply.
 I simply cannot break away from the store so I require your help. Fill this bag with xakra
teeth and return the sealed bag to me. With those teeth I can make six darts and I'll give you three.");
}

if(plugin::check_handin(\%itemcount,3461=>1)){
quest::summonitem("3463", 3);
quest::summonitem("3464");
quest::exp(1000);
quest::say("Here are the three darts I promised you and a seal of mine.
 I need more darts desperately, so show me your acrylia slate to take another bag and fill
 it as you are able. Collect four of my seals and show them to me. I will reward you by revealing
 my method of dart construction.");
}

if(plugin::check_handin(\%itemcount,3464=>4)){
quest::summonitem(3467);
quest::exp(1000);
quest::say("I thank you for your continued assistance, $name. Here is a fletching tool that will enable
 you to fashion xakra tooth darts. You will first need to acquire a grimling skeletal femur and place it
 in a fletching kit with the tool. This will result in three bone shafts. Place a bone shaft, a xakra tooth
 and this tool in the fletching kit to make a dart. When your fletching skill no longer increases by making
 these darts you may give me your crafting tool and I will help you to upgrade it.") ;
}

if(plugin::check_handin(\%itemcount,3467=>1)){
quest::summonitem(3467);
quest::summonitem(3471);
quest::say("I assume you are ready to make more challenging darts. Very well, attach this shaft to your
 crafting tool in a fletching kit and you will be able to make grimling fang darts. Keep in mind that
once this is done you will lose the ability to craft xakra tooth darts. When the grimling fang darts become
 trivial you may wish to upgrade your tool again by giving me the grimling dart crafting tool.");
}

if(plugin::check_handin(\%itemcount,3472=>1)){ #Grimling Dart Crafting Tool
quest::summonitem(3472); #Grimling Dart Crafting Tool
quest::summonitem(3473); #Crafting Tool Hook Attachment
quest::say("Your skill is increasing rapidly, $name. Here is a hook to place on the end of your crafting
 tool that will enable you to fashion rockhopper talon darts. Once the tool is modified it will not be able
 to make other types of darts. When creating rockhopper talon darts becomes trivial to you, feel free to
 give it to me for another upgrade.");
}

if(plugin::check_handin(\%itemcount,3474=>1)){
quest::summonitem(3474);
quest::summonitem(3477);
quest::say("Here is a special handle to attach to your crafting tool. This is the final improvement
to your tool and will enable you to craft owlbear feather darts. These darts are superior to even the
 rockhopper darts and are magical. Take your modified tool and combine it with an owlbear feather in your
 fletching kit. May your new skill serve you well, $name.");
}

plugin::return_items(\%itemcount);
}



#END of FILE Zone:sharvahl  ID:155173 -- Rytan
