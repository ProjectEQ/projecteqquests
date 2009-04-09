#Art of Vah Shir Brewing
#Zone:sharvahl  ID:155093 -- Merchant_Ahlam


sub EVENT_SAY {

if($text=~/Hail/i){

quest::say("Hello $name. would you care for a drink?  Or perhaps you're the one they sent to help
 me?  If you've come to help please show me your acrylia slate.");
}


if($text=~/interested/i){
   quest::say("Is that so? I suppose I would be willing to teach you a few things about brewing,
but you'll have to show me one of my seals before I begin your instruction.");
}

if($text=~/purify water/i){
   quest::say("Take a bottle to Gamali in Hollowshade Moor. You'll find her somewhere around
the Grimling fishing huts if I had to guess. She'll fill the bottle with water for you. Take this
water and combine it with the Acrylia sand purifer. That will yield the purest water you ever did
drink.");
}

if($text=~/gravel leaf tea/i){
   quest::say("To make the tea you'll need a flask of crystal clear water and some gravel pit
leaves. Boil the water in a brew barrel and add the leaves when it's hot. That makes for the
strongest dose of the sedative qualities of the tea.");
   quest::summonitem(17099);
}
if($text=~/hollow palm tea/i){
   quest::say("You'll need some Crystal water, just as you do with all of our teas, and some
Hollow palm roots. You can find Hollow palms out in the moors, watch out for the grimlings though.
Once you find the roots just use the strainer to control the flow of water over the leaves. If
you do it correctly you'll create a very potent brew. When you get it right bring the strainer back
to me with a sample of your work.");
}
}

sub EVENT_ITEM {



if(plugin::check_handin(\%itemcount,2877=>1)){

   quest::say("Ah good I was hoping you'd be along soon. I need you to collect some Gravel
tea leaves from below the city. I need these leaves to make some tea for the guards under the
arena. I need 10 of these leaves to brew enough tea for the guards. Take this pouch and fill it
with leaves and return it to me.");
   quest::summonitem(17098);
}

if(plugin::check_handin(\%itemcount,31764=>1)){
   quest::say("Many thanks $name, I'll be going to brew this tea up for the guards now. Take
 this seal as proof of your helping me. You wouldn't happen to know anyone who would be [interested]
 in learning the art of Vah Shir Brewing would you? I could really use the help in these hard times,
 I can barely keep up with all the demand.");
   quest::summonitem(31774);
}

if(plugin::check_handin(\%itemcount,31774=>1)){
   quest::say("Well done, it is now time to start down the path of learning the art of Vah Shir
brewing. You'll need a steady hand if you are to master the brew barrel. The first thing you'll
need to learn is how to purify the water we use for all our finest brews. Take this Acrylia filter
and use it to [purify water]. Bring me 4 flasks of crystal clear water and I'll teach you how to make
the tea from the gravel tea leaves.");
   quest::summonitem(31760);
}

if(plugin::check_handin(\%itemcount,31762=>4)){
   quest::say("Very good $name, this water is perfect for making Gravel leaf tea. I've just
 received a message from Guard Jabbar under the arena needs a shipment of [Gravel leaf tea] to help
 sedate the prisoners. Fill a crate with bottles of Gravel leaf tea and take it to Guard Jabbar.");
}

if(plugin::check_handin(\%itemcount,31775=>1)){
   quest::say("Very good $name, the guards had been waiting for that tea all day. I think you're
ready to move on to something a bit more challenging now. Take this strainer, it will allow you to
create some very potent brews from some of the more rare herbs to be found near the city. You'll
want to start by making some [Hollow palm tea] to get used to how the strainer works.");
   quest::summonitem(31768);
}

if(plugin::check_handin(\%itemcount,31769=>1, 31768=>1)){
   quest::emote("sips the tea. A bit of a glazed look comes across his face.");
   quest::say("Mmmmm, I do so love Hollow palm tea. This is a bit mild for Hollow palm tea
 though, you might want to try adding some spices next time for a bit more flavor. Here's your
 strainer back, I etched some runes into that should add to the potency of your brews. I hear the
 grimlings make a very potent sort of tea from the grimroot out in the forest, but the thought of
 drinking anything made from grimroot makes my stomach churn. At any rate, tinker a bit with that
 strainer and don't be afraid of trying some new brews with it. If you create anything interesting
 that you think I might like bring it to me so I can taste it.");
   quest::summonitem(31771);
}

if(plugin::check_handin(\%itemcount,31772=>1)){
   quest::say("Great job, here is my seal of approval.  Hand that back in along with your stainer
for an upgrade.");
   quest::summonitem(31776);
   
}

if(plugin::check_handin(\%itemcount,31776=>1, 31771=>1)){
   quest::say("Here is the Acrylia Handled Strainer.  Use it with regular water to replace the
crystal clear water.");
   quest::summonitem(31777);
}
}

#END of FILE Zone:sharvahl  ID:155093 -- Merchant_Ahlam

