library(tidyverse)
library(tibbletime)
#library(tidyquant)
library(lubridate)
library(png)
library(shiny)
library(DT)
library(shinydashboard)

##Create Categories For Reporting

`5v5_info` <- c("GameDate",
                "id",
                "SL_id",
                "Team",
                "Opponent", 
                "Outcome", 
                "TOI_5v5")

`5v4_info` <- c("GameDate",
                "id",
                "SL_id",
                "Team",
                "Opponent", 
                "Outcome", 
                "TOI_5v4")


`4v5_info` <- c("GameDate",
                "id",
                "SL_id",
                "Team",
                "Opponent", 
                "Outcome", 
                "TOI_4v5")

`Goalie` <- c("GameDate",
              "id",
              "SL_id",
              "Team",
              "Opponent", 
              "Outcome", 
              "TOI_5v5",
              "TOI_5v5")

Categories <- c("Expected Goals",
                "Shooting",
                "Creating Scoring-Chances",
                "Limiting Scoring-Chances Against",
                "Powerplay",
                "Penalty Kill",
                "Creating OZ Possession-Time",
                "Limiting OZ Possession-Time Against",
                "Puck Management",
                "Goaltending")

#Name Categories of Metrics to be put together
`Expected Goals` <- c("5v5ExpectedGoalsFor",
                      "5v5ExpectedGoalsAgainst"
)

"ESActualtoExpectedGoalsFor",

"SH Expected Goals Against",
"SH Actual to Expected Goals Against"

`Shooting`<-c("5v5ShotAttemptsFor",
              "5v5ShotAttemptsAgainst",
              "5v5OutsideShotsOnNet",
              "5v5%ShotAttemptsOnNet",
              "5v5NoPressureShotAttempts",
              "5v5%ofShotAttemptsWithNoPr5v5sure",
              "5v5AveragePressureDistanceonPr5v5suredShotAttempts",
              "5v5ScreenedShotsOnNet",
              "5v5%ofShotsOnNetThatAreScreened",
              "5v5%Face-OffsWonR5v5ultinginShotOnNet",
              "5v5GoalsScored")


`Creating Scoring-Chances`<-c("5v5ExpectedGoalsFor",
                              "5v5ShotAttemptsFromSlotFor",
                              "5v5InnerSlotShotAttemptsFor",
                              "5v5ShotsOnNetFromSlot",
                              "5v5InnerSlotShotsOnNetFor",
                              "5v5SlotDrivingPlays",
                              "5v5PassestotheSlotFor",
                              "5v5NoPressureShotAttemptsFromSlot",
                              "5v5%ofShotAttemptsFromSlotWithNoPressure",
                              "5v5ShotAttemptsFromSlotOfftheCycle",
                              "5v5ShotsOnNetFromSlotOfftheCycle",
                              "5v5ShotAttemptsFromSlotOfftheRush",
                              "5v5ShotsOnNetFromSlotOfftheRush",
                              "5v5OddManRushes",
                              "5v5ShotAttemptsFromSlotOfftheForecheck",
                              "5v5ShotsOnNetFromSlotOfftheForecheck",
                              "5v5ReboundsCausedFromOutsideShots",
                              "5v5%OZReboundsRecovered",
                              "5v5OZReboundsRecovered",
                              "5v52ndChance(Rebound)ShotAttemptsFromSlot",
                              "5v5%Face-OffsWonResultinginShotAttemptFromSlot",
                              "5v5ShotAttemptsFromSlotOffofOZPlay",
                              "5v5ShotsOnNetFromSlotOffofOZPlay")

`Creating Scoring-Chances_60`<-c("5v5ExpectedGoalsFor",
                                 "5v5ExpectedGoalsFor_60",
                                 "5v5ShotAttemptsFromSlotFor",
                                 "5v5ShotAttemptsFromSlotFor_60",
                                 "5v5InnerSlotShotAttemptsFor",
                                 "5v5InnerSlotShotAttemptsFor_60",
                                 "5v5ShotsOnNetFromSlot",
                                 "5v5ShotsOnNetFromSlot_60",
                                 "5v5InnerSlotShotsOnNetFor",
                                 "5v5InnerSlotShotsOnNetFor_60",
                                 "5v5SlotDrivingPlays",
                                 "5v5SlotDrivingPlays_60",
                                 "5v5PassestotheSlotFor",
                                 "5v5PassestotheSlotFor_60",
                                 "5v5NoPressureShotAttemptsFromSlot",
                                 "5v5NoPressureShotAttemptsFromSlot_60",
                                 "5v5%ofShotAttemptsFromSlotWithNoPressure",
                                 "5v5ShotAttemptsFromSlotOfftheCycle",
                                 "5v5ShotAttemptsFromSlotOfftheCycle_60",
                                 "5v5ShotsOnNetFromSlotOfftheCycle",
                                 "5v5ShotsOnNetFromSlotOfftheCycle_60",
                                 "5v5ShotAttemptsFromSlotOfftheRush",
                                 "5v5ShotAttemptsFromSlotOfftheRush_60",
                                 "5v5ShotsOnNetFromSlotOfftheRush",
                                 "5v5ShotsOnNetFromSlotOfftheRush_60",
                                 "5v5OddManRushes",
                                 "5v5OddManRushes_60",
                                 "5v5ShotAttemptsFromSlotOfftheForecheck",
                                 "5v5ShotAttemptsFromSlotOfftheForecheck_60",
                                 "5v5ShotsOnNetFromSlotOfftheForecheck",
                                 "5v5ShotsOnNetFromSlotOfftheForecheck_60",
                                 "5v5ReboundsCausedFromOutsideShots",
                                 "5v5ReboundsCausedFromOutsideShots_60",
                                 "5v5%OZReboundsRecovered",
                                 "5v5OZReboundsRecovered",
                                 "5v5OZReboundsRecovered_60",
                                 "5v52ndChance(Rebound)ShotAttemptsFromSlot",
                                 "5v52ndChance(Rebound)ShotAttemptsFromSlot_60",
                                 "5v5%Face-OffsWonResultinginShotAttemptFromSlot",
                                 "5v5ShotAttemptsFromSlotOffofOZPlay",
                                 "5v5ShotAttemptsFromSlotOffofOZPlay_60",
                                 "5v5ShotsOnNetFromSlotOffofOZPlay",
                                 "5v5ShotsOnNetFromSlotOffofOZPlay_60")




`Limiting Scoring-Chances Against` <- c("ES Shot Attempts From Slot Against",
                                        "ES Shots On Net From Slot Against",
                                        "ES% of Opposition Shot Attempts Blocked",
                                        "ES Inner Slot Shots On Net Against",
                                        "ES Pass to Slot Against",
                                        "ES No Pressure Shot Attempts From Slot Against",
                                        "ES% of Shot Attempts From Slot With No Pressure Against",
                                        "ES No Pressure Shot Attempts Against",
                                        "ES% of Shot Attempts With No Pressure Against",
                                        "ES Average Pressure Distance on Pressured Shot Attempts Against",
                                        "ES DZ Middle Ice Pass Preventions",
                                        "ES% DZ Rebounds Recovered",
                                        "ES 2nd Chance (Rebound) Shot Attempts From Slot Against",
                                        "ES Shot Attempts From Slot Off the Cycle Against",
                                        "ES Shots On Net From Slot Off the Cycle Against",
                                        "ES Shot Attempts From Slot Off the Rush Against",
                                        "ES Shots On Net From Slot Off the Rush Against",
                                        "ES Shot Attempts From Slot Off the Forecheck Against",
                                        "ES Shots On Net From Slot Off the Forecheck Against",
                                        "ES Odd Man Rushes Against",
                                        "ES% DZ Face-Offs Lost Resulting in Shot Against",
                                        "ES% DZ Face-Offs Lost Resulting in Shot From Slot Attempt Against",
                                        "ES Shot Attempts From Slot Off of OZ Play Against",
                                        "ES Shots On Net From Slot Off of OZ Play Against")

`Powerplay`<-c ("5v4GoalsScored",
                "5v4ExpectedGoalsFor",
                "5v4ActualtoExpectedGoalsFor",
                "5v4%OZZoneTime",
                "5v4%ShotAttemptsOnNet",
                "5v4ShotAttemptsFromSlotFor",
                "5v4ShotsOnNetFromSlotFor",
                "5v4InnerSlotShotsOnNetFor",
                "5v4%OZShotAttemptsRecovered",
                "5v4OZShotAttemptsRecovered",
                "5v4%OZReboundsRecovered",
                "5v42ndChance(Rebound)ShotAttemptsFromSlot",
                "5v4ReboundsCausedFromOutsideShots",
                "5v4NoPressureShotAttempts",
                "5v4%ofShotAttemptsWithNoPressure",
                "5v4NoPressureShotAttemptsFromSlot",
                "5v4%ofShotAttemptsFromSlotWithNoPressure",
                "5v4ScreenedShotsOnNet",
                "5v4%ofShotsOnNetThatAreScreened",
                "5v4TrueShooting%(Goals/ShotAttempts)",
                "5v4SlotDrivingPlays",
                "5v4PassestoSlot",
                "5v4ControlledEntrySuccess%",
                "5v4Dump-InRate",
                "5v4OZDump-InRecoveries",
                "5v4%OZDump-InsRecovered",
                "5v4OZTurnover%",
                "5v4OZFace-OffsWin%",
                "5v4%Face-OffsWonResultinginShotOnNet",
                "5v4%Face-OffsWonResultinginShotAttemptFromSlot"
)

`Powerplay_60`<-c ("5v4GoalsScored",
                   "5v4GoalsScored_60",
                   "5v4ExpectedGoalsFor",
                   "5v4ExpectedGoalsFor_60",
                   "5v4ActualtoExpectedGoalsFor",
                   "5v4%ShotAttemptsOnNet",
                   "5v4ShotAttemptsFromSlotFor",
                   "5v4ShotAttemptsFromSlotFor_60",
                   "5v4ShotsOnNetFromSlotFor",
                   "5v4ShotsOnNetFromSlotFor_60",
                   "5v4InnerSlotShotsOnNetFor",
                   "5v4InnerSlotShotsOnNetFor_60",
                   "5v4OZShotAttemptsRecovered",
                   "5v4OZShotAttemptsRecovered_60",
                   "5v4%OZShotAttemptsRecovered",
                   "5v4%OZReboundsRecovered",
                   "5v42ndChance(Rebound)ShotAttemptsFromSlot",
                   "5v42ndChance(Rebound)ShotAttemptsFromSlot_60",
                   "5v4ReboundsCausedFromOutsideShots",
                   "5v4ReboundsCausedFromOutsideShots_60",
                   "5v4NoPressureShotAttempts",
                   "5v4NoPressureShotAttempts_60",
                   "5v4NoPressureShotAttemptsFromSlot",
                   "5v4NoPressureShotAttemptsFromSlot_60",
                   "5v4%ofShotAttemptsWithNoPressure",
                   "5v4%ofShotAttemptsFromSlotWithNoPressure",
                   "5v4ScreenedShotsOnNet",
                   "5v4ScreenedShotsOnNet_60",
                   "5v4%ofShotsOnNetThatAreScreened",
                   "5v4TrueShooting%(Goals/ShotAttempts)",
                   "5v4%OZZoneTime",
                   "5v4SlotDrivingPlays",
                   "5v4SlotDrivingPlays_60",
                   "5v4PassestoSlot",
                   "5v4PassestoSlot_60",
                   "5v4ControlledEntrySuccess%",
                   "5v4Dump-InRate",
                   "5v4OZDump-InRecoveries",
                   "5v4OZDump-InRecoveries_60",
                   "5v4%OZDump-InsRecovered",
                   "5v4OZTurnover%",
                   "5v4OZFace-OffsWin%",
                   "5v4%Face-OffsWonResultinginShotOnNet",
                   "5v4%Face-OffsWonResultinginShotAttemptFromSlot"
)


`PenaltyKill`<-c("4v5GoalsFor",
                 "4v5ExpectedGoalsAgainst",
                 "4v5ActualtoExpectedGoalsAgainst",
                 "4v5ShotAttemptsFromSlotAgainst",
                 "4v5InnerSlotShotsOnNetAgainst",
                 "4v5NoPressureShotAttemptsFromSlotAgainst",
                 "4v5%ofShotAttemptsFromSlotWithNoPressureAgainst",
                 "4v5NoPressureShotAttemptsAgainst",
                 "4v5%ofShotAttemptsWithNoPressureAgainst",
                 "4v5ScreenedShotsOnNetAgainst",
                 #"4v5%ofShotsOnNetAgainstThatAreScreened",
                 "4v5GoalsAgainst",
                 "4v5DZMiddleIcePassPreventions",
                 "4v5PassestotheSlotAgainst",
                 "4v5%ofOppositionShotAttemptsBlocked",
                 "4v5%DZReboundsRecovered",
                 "4v5DZEntryDenialSuccess%",
                 "4v5Dump-InRecoveryExitSuccess%",
                 "4v5%DZZoneTime",
                 "4v5DZTrueTurnover%",
                 "4v5DZTrueTakeaway%",
                 "4v5Dump-OutRate",
                 "4v5Dump-OutSuccess%",
                 "4v5DZLoosePuckRecoveries",
                 "4v5%OppositionShotAttemptsRecoveredbyOpposition",
                 "4v5OppositionShotAttemptsRecoveredbyOpposition",
                 "4v5DZFace-OffsWin%",
                 "4v5%DZFace-OffsWonResultinginCleanDZExit",
                 "4v5%DZFace-OffsLostResultinginaShotAgainst"
                 #"4v5%DZFace-OffsLostResultinginaShotFromSlotAttemptAgainst"
)


`PenaltyKill_60`<-c("4v5GoalsAgainst",
                    "4v5GoalsAgainst_60",
                    "4v5ExpectedGoalsAgainst",
                    "4v5ExpectedGoalsAgainst_60",
                    "4v5ActualtoExpectedGoalsAgainst",
                    "4v5ActualtoExpectedGoalsAgainst_60",
                    "4v5ShotAttemptsFromSlotAgainst",
                    "4v5ShotAttemptsFromSlotAgainst_60",
                    "4v5InnerSlotShotsOnNetAgainst",
                    "4v5InnerSlotShotsOnNetAgainst_60",
                    "4v5NoPressureShotAttemptsFromSlotAgainst",
                    "4v5NoPressureShotAttemptsFromSlotAgainst_60",
                    "4v5%ofShotAttemptsFromSlotWithNoPressureAgainst",
                    "4v5NoPressureShotAttemptsAgainst",
                    "4v5NoPressureShotAttemptsAgainst_60",
                    "4v5%ofShotAttemptsWithNoPressureAgainst",
                    "4v5ScreenedShotsOnNetAgainst",
                    "4v5ScreenedShotsOnNetAgainst_60",
                    #"4v5%ofShotsOnNetAgainstThatAreScreened",
                    "4v5GoalsFor",
                    "4v5GoalsFor_60",
                    "4v5DZMiddleIcePassPreventions",
                    "4v5DZMiddleIcePassPreventions_60",
                    "4v5PassestotheSlotAgainst",
                    "4v5PassestotheSlotAgainst_60",
                    "4v5%ofOppositionShotAttemptsBlocked",
                    "4v5%DZReboundsRecovered",
                    "4v5DZEntryDenialSuccess%",
                    "4v5Dump-InRecoveryExitSuccess%",
                    "4v5%DZZoneTime",
                    "4v5DZTrueTurnover%",
                    "4v5DZTrueTakeaway%",
                    "4v5Dump-OutRate",
                    "4v5Dump-OutSuccess%",
                    "4v5DZLoosePuckRecoveries",
                    "4v5DZLoosePuckRecoveries_60",
                    "4v5OppositionShotAttemptsRecoveredbyOpposition",
                    "4v5OppositionShotAttemptsRecoveredbyOpposition_60",
                    "4v5%OppositionShotAttemptsRecoveredbyOpposition",
                    "4v5DZFace-OffsWin%",
                    "4v5%DZFace-OffsWonResultinginCleanDZExit",
                    "4v5%DZFace-OffsLostResultinginaShotAgainst"
                    #"4v5%DZFace-OffsLostResultinginaShotFromSlotAttemptAgainst"
)







`Creating OZ Possession-Time` <- c("ES OZ Possession Time",
                                   "ES% OZ Zone Time",
                                   "ES OZ Face-Offs Wins",
                                   "ES OZ Face-Offs Win%",
                                   "ES% OZ Face-Offs Lost Resulting in Clean DZ Exit by Opposition",
                                   "ES OZ True Turnover%",
                                   "ES Dump-In Rate",
                                   "ES OZ Dump-In Attempts",
                                   "ES OZ Dump-In Recoveries",
                                   "ES% OZ Dump-Ins Recovere",
                                   "ES% OZ Dump-Ins that are Rim Dumps",
                                   "ES% OZ Rim Dump-Ins Recovered",
                                   "ES% OZ Dump-Ins that are Cross-Ice Dumps",
                                   "ES% OZ Cross-Ice Dump-Ins Recovered",
                                   "ES% OZ Dump-Ins that are Same Side Dumps",
                                   "ES% OZ Same Side Dump-Ins Recovered",
                                   "ES% OZ Dump-Ins that are Soft Dumps",
                                   "ES% OZ Soft Dump-Ins Recovered",
                                   "ES% OZ Rim Dump-In Opp Goalie Recoveries",
                                   "ES Pressure OZ Dump-Ins",
                                   "ES% OZ Dump-Ins with Pressure",
                                   "ES% Pressure OZ Dump-Ins Recovered on Forecheck",
                                   "ES Controlled Entry Attempts",
                                   "ES Successful Controlled Entries",
                                   "ES Controlled Entry Success%",
                                   "ES Forechecking Success% (Opposition Does Not Reach NZ)",
                                   "ES Successful Forechecking Plays",
                                   "ES OZ Takeaways (Def Loose Puck Recoveries)",
                                   "ES Total OZ Loose Puck Recoveries",
                                   "ES% OZ Shot Attempts Recovered",
                                   "ES OZ Shot Attempts Recovered",
                                   "ES Breakout Exit Success% (with OZ Possession)",
                                   "ES Zone Exit Success% (with OZ Possession)",
                                   "ES OZ Contested Loose Puck Recovery Win%")


`Limiting OZ Possession-Time Against` <- c("ES Opposition OZ Possession Time",
                                           "ES DZ True Turnover%",
                                           "ES Average Gap on Entries Against",
                                           "ES Average Gap on Dump-Ins Against",
                                           "ES Dump-In Attempts Against",
                                           "ES Dump-In Rate Against",
                                           "ES DZ Dump-In Recoveries",
                                           "ES% DZ Dump-In Recovery & Exit",
                                           "ES Successful Dump-In Recoveries by Opposition",
                                           "ES% DZ Dump-Ins that are Rim Dump-Ins",
                                           "ES% DZ Rim Dump-In Recovery & Exit",
                                           "ES% DZ Dump-Ins that are Cross-Ice Dump-Ins",
                                           "ES% DZ Cross-Ice Dump-In Recovery & Exit",
                                           "ES% DZ Dump-Ins that are Same-Side Dump-Ins",
                                           "ES% DZ Same-Side Dump-In Recovery & Exit",
                                           "ES% DZ Dump-Ins that are Soft Dump-Ins",
                                           "ES% DZ Soft Dump-In Recovery & Exit",
                                           "ES% DZ Rim Dump-In Goalie Recoveries",
                                           "ES Pressure DZ Dump-In Recoveries",
                                           "ES% DZ Dump-In Recoveries Under Pressure",
                                           "ES% Pressure DZ Dump-In Recoveries with 1st Play Successful",
                                           "ES% Pressure DZ Dump-In Recoveries with Clean Exit",
                                           "ES Team Entry Denial Success%",
                                           "ES Successful Controlled Entries Against",
                                           "ES% Opposition Shot Attempts Recovered by Opposition",
                                           "ES Opposition Shot Attempts Recovered by Opposition",
                                           "ES DZ Takeaways (Def Loose Puck Recoveries)",
                                           "ES DZ Takeaway%",
                                           "ES DZ Contested Loose Puck Recovery Win%",
                                           "ES DZ Face-Off Losses",
                                           "ES DZ Face-Off Win%",
                                           "ES% DZ Face-Offs Won Resulting in Clean DZ Exit",
                                           "ES Forechecking Success% (Opposition Does Not Reach Your DZ)",
                                           "ES Forechecking Success% (Opposition Does Not Establish OZ Possession)",
                                           "ES NZ Takeaways (Def Loose Puck Recoveries)",
                                           "ES NZ Loose Puck Recoveries",
                                           "ES NZ Defensive Plays",
                                           "ES% Lost NZ Face-Offs with Recovery",
                                           "ES Lost NZ Face-Offs with Recovery")

`Puck Management` <- c("ES NZ True Turnover%",
                       "ES Regroups",
                       "ES Regroup Quick-Up%",
                       "ES Regroup to OZ Possession%",
                       "ES Regroup Resulting in Shot On Net%",
                       "ES Regroup Resulting in Scoring Chance%",
                       "ES Regroup Resulting in Dump-In%",
                       "ES Regroup Resulting in DZ or NZ Turnover%",
                       "ES Regroup Resulting in Clean OZ Entry%",
                       "ES Flip Dump-Outs",
                       "ES Flip Dump-Outs%",
                       "ES Same-Side Breakout%",
                       "ES Same-Side Breakout Against%",
                       "ES Breakout Success% (Reaches NZ)",
                       "ES Breakout Success% (Reaches OZ)",
                       "ES Zone Exit Success% (Reaches NZ)",
                       "ES Zone Exit Success% (Reaches OZ)",
                       "ES Successful Stretch Passes",
                       "ES Dump-Out Rate",
                       "ES Dump-Out Success%",
                       "ES Icings",
                       "ES NZ North Pass Completion%",
                       "ES Outlet Pass Completion%",
                       "ES D2D Pass Completion%")

`Goaltending`<-c("5v5ExpectedGoalsAgainst",
                 "5v5ShotAttemptsAgainst",
                 "Goalie5v5Save%",
                 "5v5ScreenedShotsOnNetAgainst",
                 "5v5%ShotsOnNetAgainstThatAreScreened",
                 "5v5ShotsOnNetFromSlotAgainst",
                 "5v5InnerSlotShotsOnNetAgainst",
                 #"GoalieInnerSlotSave%",
                 "5v5NoPressureShotAttemptsAgainst",
                 "5v5%ofShotAttemptsWithNoPressureAgainst",
                 "5v5NoPressureShotAttemptsFromSlotAgainst",
                 "5v5%ofShotAttemptsFromSlotWithNoPressureAgainst",
                 #"5v5AveragePressureDistanceonPressuredShotAttemptsAgainst",
                 "5v52ndChance(Rebound)ShotAttemptsFromSlotAgainst",
                 "5v5ShotAttemptsFromSlotOfftheCycleAgainst",
                 "5v5ShotsOnNetFromSlotOfftheCycleAgainst",
                 "5v5ShotAttemptsFromSlotOffofOZPlayAgainst",
                 "5v5ShotsOnNetFromSlotOffofOZPlayAgainst",
                 "5v5ShotAttemptsFromSlotOfftheRushAgainst",
                 "5v5ShotsOnNetFromSlotOfftheRushAgainst",
                 "5v5ShotAttemptsFromSlotOfftheForecheckAgainst",
                 "5v5ShotsOnNetFromSlotOfftheForecheckAgainst",
                 #"5v5%DZFace-OffsLostResultinginShotAgainst",
                 #"5v5%DZFace-OffsLostResultinginShotFromSlotAttemptAgainst",
                 #"GoalieNoRebound%",
                 #"GoalieInnerSlotRebound%",
                 #"GoalieReboundRecovery%",
                 #"GoalieInnerSlotReboundRecovery%",
                 "5v5ScreenedShotsOnNetAgainstNoReboundPercentage",
                 "5v5%ofOppositionShotAttemptsBlocked",
                 "Goalie4v5Save%",
                 "Goalie4v5InnerSlotSave%",
                 "Goalie4v5NoRebound%",
                 "Goalie4v5InnerSlotRebound%",
                 #"Goalie4v5ReboundRecovery%",
                 "Goalie4v5InnerSlotReboundRecovery%",
                 "4v5ScreenedShotsOnNetAgainst",
                 "4v5%ShotsOnNetAgainstThatAreScreened",
                 "4v5ScreenedShotsOnNetAgainstNoReboundPercentage")

#imports all game by game times from the NHL at all strengths
#also imports team, opponent, Result
#Look to filter this game down to distict resuts
#Filter to one team at the momment, in the shiiny app this would be a variable 
dateTable <- read.csv("/Users/mprefontaine/True North Sports & Entertainment L/Winnipeg Jets Analytics - Documents/General/Game Times.csv", check.names=FALSE) %>% 
  mutate(GameDate = factor(GameDate)) %>% 
  mutate(GameDate = GameDate %>% as.character %>%  as.Date(format = "%Y-%m-%d")) %>% 
  select(GameDate, id = GameReferenceId, Team, Opponent, Outcome, TOI_5v5 = `5v5`, TOI_5v4 = `5v4`, TOI_4v5 = `4v5`) %>% 
  distinct()

##creates a dataframe from the previously defined directory and adds a source column
##column ID reflects the file name of the individual csv where the data is extracted.
rawData <- read.csv("/Users/mprefontaine/True North Sports & Entertainment L/Winnipeg Jets Analytics - Documents/General/NHL Post-Game Reports.csv",row.names = NULL,  check.names=FALSE) %>% 
  select(SL_id =Gameid,GameDate = Date, everything()) %>% 
  mutate(GameDate = factor(GameDate)) %>% 
  mutate(GameDate = GameDate %>% as.character %>%  as.Date(format = "%Y-%m-%d")) %>% 
  distinct()

Team_List <- rawData$Team %>% sort()

Categories <- c("Expected Goals",
                "Shooting",
                "Creating Scoring-Chances",
                "Limiting Scoring-Chances Against",
                "Powerplay",
                "Penalty Kill",
                "Creating OZ Possession-Time",
                "Limiting OZ Possession-Time Against",
                "Puck Management",
                "Goaltending")

## app.R #
ui <- dashboardPage(
  dashboardHeader(title = "SportLogiq GBG"),
  sidebar,
  body 
)


#Sidebar Content  
sidebar <- dashboardSidebar(
  sidebarMenu(
    #Select the team
    selectInput("Team", "Select Team", choices = Team_List, selected = "WPG"),
    selectInput("Categories", "Select Category", choices = `Categories`, selected = "Powerplay"),
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    
      
    menuItem("Widgets", tabName = "widgets", icon = icon("th"))
  )
)

## Body content
body <- dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(tableOutput("PP_Raw")),
                box(plotOutput("plot1", height = 250)),
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
              
      )
    )
  )



server <- function(input, output) {
  #Main data table 
  output$maintable <- DT::renderDataTable(
    DT::datatable({
  
  
  #PP_Raw <- dateData <- merge(rawData, dateTable, by = c("GameDate", "Team")) %>% 
   # select(GameDate,id, SL_id ,Team ,Opponent, Outcome, TOI_5v4,everything()) %>% 
    #select(`5v4_info`,`Powerplay`) %>% 
    #distinct()
    output$PP_Raw <- renderTable(PP_Raw)
  
  
  
    set.seed(122)
    histdata <- rnorm(500)
  
    output$plot1 <- renderPlot({
     data <- histdata[seq_len(input$slider)]
      hist(data)
    })
    }
    )
}


shinyApp(ui, server)

#########################5 v5########################################
CC_Raw <- merge(FiveVFiveRawData, dateTable, by = c("GameDate", "Team")) %>% 
  select(GameDate,id, SL_id ,Team,Opponent, Outcome, TOI_5v5,everything()) %>% 
  select(`5v5_info`,`Creating Scoring-Chances`) %>% 
  distinct()

CC_60 <- CC_Raw %>% 
  mutate_at(vars(-contains("%"), -`5v5_info`), funs(`60` = ./TOI_5v5*3600)) %>% 
  select(`5v5_info`, `Creating Scoring-Chances_60`)

test<- CC_60 %>% 
  select(contains("_60"), -`5v5_info`) %>% 
  cor()

WPG_CC <- CC_60 %>% 
  filter(Team == "WPG") 


write_csv(test, "Cor.csv")

test<- CC_60 %>% 
  select(contains("_60"), -`5v5_info`) %>% 
  cor()

##Create a more readable wide data frame
xGF <- merge(FiveVFiveRawData, dateTable, by = c("GameDate", "Team")) %>% 
  select(GameDate,id, SL_id ,Team,Opponent, Outcome, TOI_5v5,everything()) %>% 
  select(`5v5_info`,`Expected Goals`) %>% 
  # distinct() %>% 
  mutate_at(vars(contains("ExpectedGoals")), funs(`60` = ./TOI_5v5*3600)) %>% 
  mutate(`xGF%` = `5v5ExpectedGoalsFor_60`/(`5v5ExpectedGoalsFor_60`+`5v5ExpectedGoalsAgainst_60`))


xGF_mean<- xGF %>% 
  group_by(Team) %>% 
  summarise_all(mean, na.rm=TRUE)

WPG_xGF <- xGF %>% 
  filter(Team == "WPG") 

DAL_xGF <- xGF %>% 
  filter(Team == "DAL") 

###################Powerplay data######################################
#Combine powerplay Metrics into one data frame giving full NHL gbg breakdown
PP_Raw <-dateData <- merge(rawData, dateTable, by = c("GameDate", "Team")) %>% 
  select(GameDate,id, SL_id ,Team ,Opponent, Outcome, TOI_5v4,everything()) %>% 
  select(`5v4_info`,`Powerplay`) %>% 
  distinct()

#Adds per 60 mesures to the data frame, good for GBG analysis
PP_60 <- PP_Raw %>% 
  mutate_at(vars(-contains("%"), -`5v4_info`), funs(`60` = ./TOI_5v4*3600)) %>% 
  select(`5v4_info`, `Powerplay_60`)

#Gets season summary of metrics for each team
PP_sum<- PP_Raw %>% 
  select(-GameDate,-id,-SL_id,-Opponent,-Outcome) %>% 
  group_by(Team) %>% 
  summarise_all(sum, na.rm=TRUE)

#Adds properly calucatled per 60s for each team
PP_sum_60 <- PP_sum %>% 
  mutate_at(vars(-contains("%"),-Team), funs(`60` = ./TOI_5v4*3600)) %>% 
  select(Team, `Powerplay_60`) 
mutate()

#Winnipeg GBG dataframe
WPG_PP <- PP_60 %>% 
  filter(Team == "WPG") 

#Opponent GBG dataframe, change abbreviation
OPP_PP <- PP_60 %>% 
  filter(Team == "DAL") 

##Write PP Data to local directory
write_csv(PP_sum_60, "PPdata.csv")

##Take a look at the collereltion between mutiple Metrics
PP_Cor<- PP_60 %>% 
  select(contains("_60"), -`5v4_info`) %>% 
  cor(use = "complete.obs")

########################################Penalty Kill######################################################
#Combine PK Metrics into one data frame giving full NHL gbg breakdown
PK_Raw <- merge(FourVFiveRawData, dateTable, by = c("GameDate", "Team")) %>% 
  select(GameDate,id, SL_id ,Team ,Opponent, Outcome, TOI_4v5,everything()) %>% 
  select(`4v5_info`,`PenaltyKill`) %>% 
  distinct()

#Adds per 60 mesures to the data frame, good for GBG analysis
PK_60 <- PK_Raw %>% 
  mutate_at(vars(-contains("%"), -`4v5_info`), funs(`60` = ./TOI_4v5*3600)) %>% 
  select(`4v5_info`, `PenaltyKill_60`)

#Gets season summary of metrics for each team
PK_sum<- PK_Raw %>% 
  select(-GameDate,-id,-SL_id,-Opponent,-Outcome) %>% 
  group_by(Team) %>% 
  summarise_all(sum, na.rm=TRUE)

#Adds properly calucatled per 60s for each team
PK_sum_60 <- PK_sum %>% 
  mutate_at(vars(-contains("%"),-Team), funs(`60` = ./TOI_4v5*3600)) %>% 
  select(Team, `PenaltyKill_60`) 

#Winnipeg PK GBG dataframe
WPG_PK <- PK_60 %>% 
  filter(Team == "WPG") 

#Winnipeg PK GBG dataframe
OPP_PK <- PK_60 %>% 
  filter(Team == "ANA") 

PK_Raw_Time <- PK_60 %>%
  as_tbl_time(GameDate)

monthly <- PK_Raw_Time %>% 
  collapse_by(period = "month") %>% 
  group_by(Team,GameDate) %>%
  summarise_if(is.numeric, mean, na.rm = TRUE) %>% 
  filter(GameDate == "2019-11-30") %>%
  select(Team, `PenaltyKill_60`) 

##Write PP Data to local directory
write_csv(PK_sum_60, "PKdata.csv")
write_csv(OPP_PK, "OPP_PK.csv")
write_csv(WPG_PK, "WPG_PK.csv")

##Take a look at the collereltion between mutiple Metrics
PK_Cor<- PK_60 %>% 
  select(contains("_60")) %>% 
  cor(use = "complete.obs")

###################GOALIE##############################################
Goalie_Raw <- merge(GoalieRawData, dateTable, by = c("GameDate", "Team")) %>% 
  select(GameDate,id, SL_id ,Team ,Opponent, Outcome, TOI_4v5,everything()) %>% 
  select(`5v5_info`,`Goaltending`, TOI_4v5) %>% 
  distinct()

PP_60 <- PP_Raw %>% 
  mutate_at(vars(-contains("%"), -`5v5_info`), funs(`60` = ./TOI_5v5*3600)) %>% 
  select(`5v4_info`, `Powerplay_60`)


test2<- PP_60 %>% 
  select(contains("_60"), -`5v4_info`) %>% 
  cor(use = "complete.obs")

###########################################

############################################################Densiity Plots#######################################################################

"/Users/mprefontaine/True North Sports & Entertainment L/Winnipeg Jets Analytics - Documents/Sportslogiq/SL PS Files/NHL/20192020/Regular/" %>% 
  list.files(full.names = T) %>% 
  lapply(read_csv) %>% 
  bind_rows() -> PS_File


#Imports background image of rink.
packs=c("png","grid")
lapply(packs,require,character.only=TRUE)
img=readPNG("Rink.png")
g=rasterGrob(img,interpolate = TRUE)

#Function to Generate Plot of SA/SOG/GOALs
#Event Type must match either "SA", "SOG" or "GOAL"
generate.plot <- function(PS_File, team_name, event_type) {
  
  if (!(event_type %in% c("SA", "SOG", "GOAL"))) {
    stop("Improper Event Type: Must be one of SA, SOG, or GOAL.")
  }
  
  if (!(team_name %in% PS_File$team %>% unique())) {
    stop("Improper Team Name: Check spelling of Team Name to match SL")
  }
  
  PS_File %>% 
    mutate(strength_situation = paste0(teamSkatersOnIce, "v", opposingTeamSkatersOnIce)) %>% 
    filter(name == "shot", team == team_name, strength_situation == "5v4") -> shot_data
  
  shot_data %>% 
    {if (event_type == "SOG") filter(., outcome == "successful") else .} %>% 
    {if (event_type == "GOAL") filter(., grepl("withgoal", flags)) else .} %>% 
    ggplot(aes(x=yAdjCoord,y=xAdjCoord)) + 
    annotation_custom(g,xmin=-Inf,xmax = Inf,ymin=-Inf, ymax = Inf) +
    stat_density2d(geom="polygon", aes(fill=..level.., alpha=..level..), n=100, h = 15) +
    geom_point(alpha = 0.25) +
    coord_fixed() + 
    scale_fill_gradientn(colours = heat.colors(12)) +
    expand_limits(x = 0, y = 0) + scale_x_continuous(expand = c(0, 0), limits = c(-42.5,42.5)) + scale_y_continuous(expand = c(0, 0), limits = c(0,100)) +
    scale_alpha_continuous(guide = "none") +
    ggtitle(paste("2019-20", team_name, "5v4", event_type, "Locations" , sep = " ")) +
    theme(plot.title = element_text(hjust = 0.5, size = 15, vjust = 0.5),
          legend.position = "none",
          axis.line = element_blank(),
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
  
}

generate.plot(PS_File, "Winnipeg Jets", "SOG")

#Returns a dataframe of SL info for goals scored at 5v4
return.goal.info <- function(PS_File, team_name) {
  
  if (!(team_name %in% PS_File$team %>% unique())) {
    stop("Improper Team Name: Check spelling of Team Name to match SL")
  }
  
  #Function to replace player reference ids with their formatted names
  Replace.Names <- function(table, column) {
    
    join_key <- c(column = "playerReferenceId")
    names(join_key) <- column
    
    table %>% 
      left_join(Player_Ref, by = join_key) %>% 
      select(-column) %>% 
      rename(!!column := playerName)
  }
  
  Player_Ref <- PS_File %>% 
    distinct(playerReferenceId, .keep_all = T) %>% 
    mutate(playerName = paste(playerJersey, playerLastName, sep = "-")) %>% 
    select(playerName, playerReferenceId) %>%
    na.omit() %>% 
    mutate(playerReferenceId = as.character(playerReferenceId))
  
  PS_File %>% 
    mutate(strength_situation = paste0(teamSkatersOnIce, "v", opposingTeamSkatersOnIce),
           teamForwardsOnIceRefs = str_trim(teamForwardsOnIceRefs),
           teamDefencemenOnIceRefs = str_trim(teamDefencemenOnIceRefs),
           periodTime = seconds_to_period(periodTime) + 2,
           periodTime = sprintf("%02.0f:%02.0f", minute(periodTime), second(periodTime)),
           playerReferenceId = as.character(playerReferenceId)) %>% 
    filter(grepl("withgoal", flags), team == team_name, strength_situation == "5v4") %>% 
    unite("players_on_ice", teamForwardsOnIceRefs, teamDefencemenOnIceRefs, sep = ", ") %>% 
    separate(players_on_ice, into = c("P1", "P2", "P3", "P4", "P5", "P6"), sep = ", ") %>% 
    rename(GoalScorer = playerReferenceId) %>% 
    Replace.Names("GoalScorer") %>% 
    Replace.Names("P1") %>% 
    Replace.Names("P2") %>% 
    Replace.Names("P3") %>% 
    Replace.Names("P4") %>% 
    Replace.Names("P5") %>% 
    Replace.Names("P6") %>% 
    select(gameReferenceId, period, periodTime, GoalScorer, P1:P6, xAdjCoord, yAdjCoord, flags)
  
}

goals<- return.goal.info(PS_File, "Winnipeg Jets")

