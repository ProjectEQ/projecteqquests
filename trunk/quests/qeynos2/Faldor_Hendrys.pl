#BeginFile qeynos2\Faldor_Hendrys.pl (2140)
#Quest file for North Qeynos - Faldor Hendrys

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("What, $name? Do I look like a merchant to you? Just because all these merchants are in my library, it doesn't mean that I am one. If you are interested in something other than spell scrolls, then, we can talk.");
    #quest::say("What do you want?!! Can't you see I am busy drinking here? You don't even look like you belonging here. You can have my seat when I am good and ready to leave, which won't be for a while yet. If I were you I would get lost before I got myself hurt."); Lost and found text...
  }
}

#EndFile qeynos2\Faldor_Hendrys.pl (2140)