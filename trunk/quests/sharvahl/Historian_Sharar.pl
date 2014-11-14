sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("It is a pleasure to meet you, friend. Please let me know if you have trouble finding the book that you seek. If you request something that we do not have available, I can make a note to keep an eye out for it. We are getting in a great variety of interesting new material these days. Speaking of which, I need someone to take a tome to Elder Animist Dumul. He has been frantically researching something or another. I'm sure that you could pry a little and learn more about it if you were to take this book to him. Is that something that you would be interested in doing?");
  }
  if ($text=~/yes/i) {
    quest::say("You have a braver spirit than mine, friend, but I'm glad that someone is available to assist me. Take care and keep alert. The Khati Sha seem to be very troubled by something of late.");
    quest::summonitem(9061);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 8466 => 1)) {
    quest::say("I see that you've found the codger. He really should settle down and come in from the weather. I often find myself worrying about him these days. Adventure takes its toll on everyone. I'd like to see him settle down before the moor takes a final toll from him.");
    quest::say("Well, I can't say that it isn't a pleasure to have his journal. He's documented the moor with such splendid detail. I cannot wait to see what he's written in these last few seasons. It is all so very helpful. Just take a look at these earplugs. They are a product of his last set of notes. He came up with the idea, while hunting owlbear in the moor. They are supposed to keep the sound they make from harming you. You can keep them, if you take this note to General Avilah for me.");
    quest::summonitem(4461);
    quest::summonitem(8467);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155228 -- Historian_Sharar