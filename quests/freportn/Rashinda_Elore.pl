sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hello. I am Rashinda Elore. The city Landholder Manager. If you have business to discuss. please direct it to my two clerks downstairs. Good day.");
  }
  if($text=~/What do you know of Zimel's Blades/i){
    quest::say("Ariska Zimel was a human blacksmith, a master when it came to making swords, I hear. He kept to himself a lot. He disappeared about one year ago. A lot of people were disappointed when we had to condemn Zimel's Blades. All the merchandise was handed over to Groflah Steadirt. Mostly charred junk.");
  }
  if($text=~/Who is Groflah Steadirt/i) {
    quest::say("Groflah Steadirt is the dwarven owner of Groflah's Forge which is right near here. He was Ariska Zimel's best friend. They were apparently avid travelers before settling down here in Freeport. I guess it was during their travels that they picked up the fine arts of the forge. You should talk to Groflah about Zimel. He can tell you more than I can.");
  }
  if($text=~/Why was Zimel's Blades condemned/i) {
    quest::say("About a week after Ariska Zimel's disappearance, strange noises were heard from his shop. Loud booms and rumbling as though the earth itself were exploding. When the militia got to the shop, they said the shop was badly burned by an exploding boiler. They had us condemn the building due to its unsafe structure");
  }
}
#END of FILE Zone:freportn  ID:8033 -- Rashinda_Elore

