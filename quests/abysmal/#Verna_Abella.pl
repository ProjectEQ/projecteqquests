# The Fourteen Great Adventures
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("focuses her attention on $name.");
	quest::emote("seems to be deep in thought. She ignores you at first but eventually turns towards you with a somber look on her face. 'Forgive me. I am not much of a talker these days since Silius left on his journey with Lyndro and the others. Sitting here everyday wishing that they would return has consumed me to the point that I can do nothing else. If only I had some proof of what has happened to Silius. Anything at all would help me in this time of wonder and worry.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67616 => 1)) { # Silius' Writings
    quest::emote("takes the dusty tome from $name's hands.");
    quest::emote("takes the book from your hands instantly recognizing it. 'Does this mean he is . . .' She stops for a second choking back tears as the reality of Silius' passing hits her. 'I thank you for bringing this to me I shall cherish it always. Please help the others who have been suffering like me, bring them the closure you have given to me so that they can get on with their lives. Forgive me but I must be going there is much I must do. If you have already helped everyone please tell De'van that your task is complete and he will reward you.");
    quest::setglobal("writingsi", 1, 5, "F");
  }
  else {
    quest::say("I don't need this.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_SIGNAL {
	quest::say("Well, don't ye look lovely today! Why, I can 'ardly think of what I want ta drink with ye distractin' me. 'ow about a light beer for now. I'll surely be orderin' more as long as yer on duty!");
}

# END of FILE Zone:abysmal  ID:279036 -- #Verna_Abella.pl