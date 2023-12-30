sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (!quest::istaskcompleted(505746)) {
      quest::say("$name, can't you see how busy I am with [" . quest::saylink("council business") . "]? I clearly don't have time to stand here and chat with you, but I thank you for your interest in the daily business of the Council of the Six, the lords and ladies of Crescent Reach. Good day to you!");
    }
    else {
      quest::say("Well, well $name you are persistent. I like that! You show a genuine interest in how our fine city is being put together. As you can clearly see for yourself this city is not of drakkin origins. I would like you to [" . quest::saylink("learn more") . "] about this city's history before we speak any further.");
    }
  }
  if ($text=~/council business/i) {
    quest::say("What? Didn't I just very politely suggest we chat another time? If you are so interested in the Scions of the Six then why don't you take a look at our [" . quest::saylink("charter") . "]? That should fill you in on the basics of how our city is run. Now if there's nothing else, I will say udra to you. That means 'goodbye!'");
  }
  if ($text=~/charter/i) {
    if (!quest::istaskcompleted(505746)) {
      quest::say("The charter? It's in the library of course! Where else would it be?");
      quest::taskselector(505746); #Getting to Know You: The City Charter
    }
    else {
      quest::say("Sorry $name, I don't have anything for someone with your abilities.");
    }
  }
  if (($text=~/learn more/i) && quest::istaskcompleted(505746)) {
    quest::say("There is a book in a hidden room that you should study. Enter Gekkdar's Haunt on the third level and locate the hidden room. Once you have read the book you will find there return to me and I will have more to say to you. Good day to you, $name.");
    #quest::taskselector(); #Getting to Know You: For Those Gone Before Us - Not yet created
  }
  else {
    quest::say("Sorry $name, I don't have anything for someone with your abilities.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 85088 => 1)) { #Crescent Citizen's Declaration
    quest::say("Ah, so you are interested in gaining favor with the Scions of the Six, the council that stands before the great moontable? Very good. Let us begin!");
  }
  plugin::return_items(\%itemcount);
}