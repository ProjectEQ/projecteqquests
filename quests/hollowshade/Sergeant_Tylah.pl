sub EVENT_SAY {

if($text=~/Hail/i){

quest::say("Good day to you $name, would you happen to have any boiled rockhopper eggs for sale? I'm so very hungry and they're my favorite food."); }

}

sub EVENT_ITEM {

if($itemcount{3457} == 4){
quest::emote("Sergeant Tylah devours all four of the eggs in the blink of an eye, 'Delicious! May the spirits bless you $name! Here are a few acrylia flakes for your trouble. I'll be happy to pay for more should you find yourself with any extra!");
quest::summonitem("3459");
}
} 