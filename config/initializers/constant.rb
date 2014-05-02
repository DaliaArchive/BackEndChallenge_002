#The current player's move is the first half of each combo, and adversary's move is the second half of each combo
# This is how the data construction look like
# RR  => T, RP  => L, RS  => W, RL  => W, RSp  => L
# PR  => W, PP  => T, PS  => L, PL  => L, PSp  => W
# SR  => L, SP  => W, SS  => T, SL  => W, SSp  => L
# LR  => L, LP  => W, LS  => L, LL  => T, LSp  => W
# SpR => W, SpP => L, SpS => W, SpL => L, SpSp => T

# T is tie
# W is Win
# L is Loose

#GAME_RULE = {
#  "RR"  => "T", "RP" => "L", "RS"  => "W", "RL"  => "W", "RSp"  => "L",
#  "PR"  => "W", "PP"  => "T", "PS"  => "L", "PL"  => "L", "PSp"  => "W",
#  "SR"  => "L", "SP"  => "W", "SS"  => "T", "SL"  => "W", "SSp"  => "L",
#  "LR"  => "L", "LP"  => "W", "LS"  => "L", "LL"  => "T", "LSp" => "W",
#  "SpR" => "W", "SpP" => "L", "SpS" => "W", "SpL" => "L", "SpSp" => "T"
#}

GAME_RULE = {
  "RockRock"  => "T", "RockPPaper" => "L", "RockScissors"  => "W", "RockLizard"  => "W", "RockSpock"  => "L",
  "PaperRock"  => "W", "PaperPaper"  => "T", "PaperScissors"  => "L", "PaperLizard"  => "L", "PaperSpock"  => "W",
  "ScissorsRock"  => "L", "ScissorsPaper"  => "W", "ScissorsScissors"  => "T", "ScissorsLizard"  => "W", "ScissorsSpock"  => "L",
  "LizardRock"  => "L", "LizardPaper"  => "W", "LizardScissors"  => "L", "LizardLizard"  => "T", "LizardSpock" => "W",
  "SpockRock" => "W", "SpockPaper" => "L", "SpockScissors" => "W", "SpockLizard" => "L", "SpockSpock" => "T"
}