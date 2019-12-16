library(tidyverse)
library(tibbletime)
library(tidyquant)
library(lubridate)
library(png)
library(shiny)
library(DT)
library(shinydashboard)

#############################Game Info Categories###########################
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

`Info` <- c("GameDate",
                "id",
                "SL_id",
                "Team",
                "Opponent", 
                "Outcome", 
                "TOI")


`Goalie` <- c("GameDate",
              "id",
              "SL_id",
              "Team",
              "Opponent", 
              "Outcome", 
              "TOI_5v5",
              "TOI_5v5")
#############################Metric Categories###########################
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

###############################Metrics################################
`Expected Goals` <- c("5v5ExpectedGoalsFor",
                      "5v5ExpectedGoalsAgainst"
                      #"5v5ActualtoExpectedGoalsFor"
                      )



`ExpectedGoals_5_Game` <- c("5v5ExpectedGoalsFor",
                            "5v5ExpectedGoalsFor_5_Game",
                            "5v5ExpectedGoalsAgainst",
                            "5v5ExpectedGoalsAgainst_5_Game"
                      #"5v5ActualtoExpectedGoalsFor"
)

`ExpectedGoals_60` <- c("5v5ExpectedGoalsFor",
                        "5v5ExpectedGoalsFor_60",
                      "5v5ExpectedGoalsAgainst",
                      "5v5ExpectedGoalsAgainst_60"
                      #"5v5ActualtoExpectedGoalsFor"
)

###########################Shooting#################################
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

`Shooting_60`<-c("5v5ShotAttemptsFor",
                 "5v5ShotAttemptsFor_60",
              "5v5ShotAttemptsAgainst",
              "5v5ShotAttemptsAgainst_60",
              "5v5OutsideShotsOnNet",
              "5v5OutsideShotsOnNet_60",
              "5v5%ShotAttemptsOnNet",
              "5v5NoPressureShotAttempts",
              "5v5NoPressureShotAttempts_60",
              "5v5%ofShotAttemptsWithNoPr5v5sure",
              "5v5AveragePressureDistanceonPr5v5suredShotAttempts",
              "5v5AveragePressureDistanceonPr5v5suredShotAttempts_60",
              "5v5ScreenedShotsOnNet",
              "5v5ScreenedShotsOnNet_60",
              "5v5%ofShotsOnNetThatAreScreened",
              "5v5%Face-OffsWonR5v5ultinginShotOnNet",
              "5v5GoalsScored",
              "5v5GoalsScored_60")

`Shooting_60_Rank`<-c("5v5ShotAttemptsFor",
                 "5v5ShotAttemptsFor_60",
                 "5v5ShotAttemptsFor_60_Rank",
                 "5v5ShotAttemptsAgainst",
                 "5v5ShotAttemptsAgainst_60",
                 "5v5ShotAttemptsAgainst_60_Rank",
                 "5v5OutsideShotsOnNet",
                 "5v5OutsideShotsOnNet_60",
                 "5v5OutsideShotsOnNet_60_Rank",
                 "5v5%ShotAttemptsOnNet",
                 "5v5NoPressureShotAttempts",
                 "5v5NoPressureShotAttempts_60",
                 "5v5NoPressureShotAttempts_60_Rank",
                 "5v5%ofShotAttemptsWithNoPr5v5sure",
                 "5v5AveragePressureDistanceonPr5v5suredShotAttempts",
                 "5v5AveragePressureDistanceonPr5v5suredShotAttempts_60",
                 "5v5AveragePressureDistanceonPr5v5suredShotAttempts_60_Rank",
                 "5v5ScreenedShotsOnNet",
                 "5v5ScreenedShotsOnNet_60",
                 "5v5ScreenedShotsOnNet_60_Rank",
                 "5v5%ofShotsOnNetThatAreScreened",
                 "5v5%Face-OffsWonR5v5ultinginShotOnNet",
                 "5v5GoalsScored",
                 "5v5GoalsScored_60",
                 "5v5GoalsScored_60_Rank")


#############################SCORING CHANCES FOR####################################
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

`Creating Scoring-Chances_60_Rank`<-c("5v5ExpectedGoalsFor",
                                 "5v5ExpectedGoalsFor_60",
                                 "5v5ExpectedGoalsFor_60_Rank",
                                 "5v5ShotAttemptsFromSlotFor",
                                 "5v5ShotAttemptsFromSlotFor_60",
                                 "5v5ShotAttemptsFromSlotFor_60_Rank",
                                 "5v5InnerSlotShotAttemptsFor",
                                 "5v5InnerSlotShotAttemptsFor_60",
                                 "5v5InnerSlotShotAttemptsFor_60_Rank",
                                 "5v5ShotsOnNetFromSlot",
                                 "5v5ShotsOnNetFromSlot_60",
                                 "5v5ShotsOnNetFromSlot_60_Rank",
                                 "5v5InnerSlotShotsOnNetFor",
                                 "5v5InnerSlotShotsOnNetFor_60",
                                 "5v5InnerSlotShotsOnNetFor_60_Rank",
                                 "5v5SlotDrivingPlays",
                                 "5v5SlotDrivingPlays_60",
                                 "5v5SlotDrivingPlays_60_Rank",
                                 "5v5PassestotheSlotFor",
                                 "5v5PassestotheSlotFor_60",
                                 "5v5PassestotheSlotFor_60_Rank",
                                 "5v5NoPressureShotAttemptsFromSlot",
                                 "5v5NoPressureShotAttemptsFromSlot_60",
                                 "5v5NoPressureShotAttemptsFromSlot_60_Rank",
                                 "5v5%ofShotAttemptsFromSlotWithNoPressure",
                                 "5v5ShotAttemptsFromSlotOfftheCycle",
                                 "5v5ShotAttemptsFromSlotOfftheCycle_60",
                                 "5v5ShotAttemptsFromSlotOfftheCycle_60_Rank",
                                 "5v5ShotsOnNetFromSlotOfftheCycle",
                                 "5v5ShotsOnNetFromSlotOfftheCycle_60",
                                 "5v5ShotsOnNetFromSlotOfftheCycle_60_Rank",
                                 "5v5ShotAttemptsFromSlotOfftheRush",
                                 "5v5ShotAttemptsFromSlotOfftheRush_60",
                                 "5v5ShotAttemptsFromSlotOfftheRush_60_Rank",
                                 "5v5ShotsOnNetFromSlotOfftheRush",
                                 "5v5ShotsOnNetFromSlotOfftheRush_60",
                                 "5v5ShotsOnNetFromSlotOfftheRush_60_Rank",
                                 "5v5OddManRushes",
                                 "5v5OddManRushes_60",
                                 "5v5OddManRushes_60_Rank",
                                 "5v5ShotAttemptsFromSlotOfftheForecheck",
                                 "5v5ShotAttemptsFromSlotOfftheForecheck_60",
                                 "5v5ShotAttemptsFromSlotOfftheForecheck_60_Rank",
                                 "5v5ShotsOnNetFromSlotOfftheForecheck",
                                 "5v5ShotsOnNetFromSlotOfftheForecheck_60",
                                 "5v5ShotsOnNetFromSlotOfftheForecheck_60_Rank",
                                 "5v5ReboundsCausedFromOutsideShots",
                                 "5v5ReboundsCausedFromOutsideShots_60",
                                 "5v5ReboundsCausedFromOutsideShots_60_Rank",
                                 "5v5%OZReboundsRecovered",
                                 "5v5OZReboundsRecovered",
                                 "5v5OZReboundsRecovered_60",
                                 "5v5OZReboundsRecovered_60_Rank",
                                 "5v52ndChance(Rebound)ShotAttemptsFromSlot",
                                 "5v52ndChance(Rebound)ShotAttemptsFromSlot_60",
                                 "5v52ndChance(Rebound)ShotAttemptsFromSlot_60_Rank",
                                 "5v5%Face-OffsWonResultinginShotAttemptFromSlot",
                                 "5v5ShotAttemptsFromSlotOffofOZPlay",
                                 "5v5ShotAttemptsFromSlotOffofOZPlay_60",
                                 "5v5ShotAttemptsFromSlotOffofOZPlay_60_Rank",
                                 "5v5ShotsOnNetFromSlotOffofOZPlay",
                                 "5v5ShotsOnNetFromSlotOffofOZPlay_60",
                                 "5v5ShotsOnNetFromSlotOffofOZPlay_60_Rank")

#############################LIMITING SCORING CHANCES AG######################################
`LimitingScoring-ChancesAgainst`<-c("5v5ShotAttemptsFromSlotAgainst",
                                    "5v5ShotsOnNetFromSlotAgainst",
                                    "5v5%ofOppositionShotAttemptsBlocked",
                                    "5v5InnerSlotShotsOnNetAgainst",
                                    "5v5PasstoSlotAgainst",
                                    "5v5NoPressureShotAttemptsFromSlotAgainst",
                                    "5v5%ofShotAttemptsFromSlotWithNoPressureAgainst",
                                    "5v5NoPressureShotAttemptsAgainst",
                                    "5v5%ofShotAttemptsWithNoPressureAgainst",
                                    "5v5AveragePressureDistanceonPressuredShotAttemptsAgainst",
                                    "5v5DZMiddleIcePassPreventions",
                                    "5v5%DZReboundsRecovered",
                                    "5v52ndChance(Rebound)ShotAttemptsFromSlotAgainst",
                                    "5v5ShotAttemptsFromSlotOfftheCycleAgainst",
                                    "5v5ShotsOnNetFromSlotOfftheCycleAgainst",
                                    "5v5ShotAttemptsFromSlotOfftheRushAgainst",
                                    "5v5ShotsOnNetFromSlotOfftheRushAgainst",
                                    "5v5ShotAttemptsFromSlotOfftheForecheckAgainst",
                                    "5v5ShotsOnNetFromSlotOfftheForecheckAgainst",
                                    "5v5OddManRushesAgainst",
                                    "5v5%DZFace-OffsLostResultinginShotAgainst",
                                    "5v5%DZFace-OffsLostResultinginShotFromSlotAttemptAgainst",
                                    "5v5ShotAttemptsFromSlotOffofOZPlayAgainst",
                                    "5v5ShotsOnNetFromSlotOffofOZPlayAgainst")


`LimitingScoring-ChancesAgainst_60`<-c("5v5ShotAttemptsFromSlotAgainst",
                                       "5v5ShotAttemptsFromSlotAgainst_60",
                                       "5v5ShotsOnNetFromSlotAgainst",
                                       "5v5ShotsOnNetFromSlotAgainst_60",
                                       "5v5%ofOppositionShotAttemptsBlocked",
                                       "5v5InnerSlotShotsOnNetAgainst",
                                       "5v5InnerSlotShotsOnNetAgainst_60",
                                       "5v5PasstoSlotAgainst",
                                       "5v5PasstoSlotAgainst_60",
                                       "5v5NoPressureShotAttemptsFromSlotAgainst",
                                       "5v5NoPressureShotAttemptsFromSlotAgainst_60",
                                       "5v5NoPressureShotAttemptsAgainst",
                                       "5v5NoPressureShotAttemptsAgainst_60",
                                       "5v5%ofShotAttemptsWithNoPressureAgainst",
                                       "5v5AveragePressureDistanceonPressuredShotAttemptsAgainst",
                                       "5v5AveragePressureDistanceonPressuredShotAttemptsAgainst_60",
                                       "5v5DZMiddleIcePassPreventions",
                                       "5v5DZMiddleIcePassPreventions_60",
                                       "5v5%DZReboundsRecovered",
                                       "5v52ndChance(Rebound)ShotAttemptsFromSlotAgainst",
                                       "5v52ndChance(Rebound)ShotAttemptsFromSlotAgainst_60",
                                       "5v5ShotAttemptsFromSlotOfftheCycleAgainst",
                                       "5v5ShotAttemptsFromSlotOfftheCycleAgainst_60",
                                       "5v5ShotsOnNetFromSlotOfftheCycleAgainst",
                                       "5v5ShotsOnNetFromSlotOfftheCycleAgainst_60",
                                       "5v5ShotAttemptsFromSlotOfftheRushAgainst",
                                       "5v5ShotAttemptsFromSlotOfftheRushAgainst_60",
                                       "5v5ShotsOnNetFromSlotOfftheRushAgainst",
                                       "5v5ShotsOnNetFromSlotOfftheRushAgainst_60",
                                       "5v5ShotAttemptsFromSlotOfftheForecheckAgainst",
                                       "5v5ShotAttemptsFromSlotOfftheForecheckAgainst_60",
                                       "5v5ShotsOnNetFromSlotOfftheForecheckAgainst",
                                       "5v5ShotsOnNetFromSlotOfftheForecheckAgainst_60",
                                       "5v5OddManRushesAgainst",
                                       "5v5OddManRushesAgainst_60",
                                       "5v5%DZFace-OffsLostResultinginShotAgainst",
                                       "5v5%DZFace-OffsLostResultinginShotFromSlotAttemptAgainst",
                                       "5v5ShotAttemptsFromSlotOffofOZPlayAgainst",
                                       "5v5ShotAttemptsFromSlotOffofOZPlayAgainst_60",
                                       "5v5ShotsOnNetFromSlotOffofOZPlayAgainst",
                                       "5v5ShotsOnNetFromSlotOffofOZPlayAgainst_60")

`LimitingScoring-ChancesAgainst_60_Rank`<-c("5v5ShotAttemptsFromSlotAgainst",
                                       "5v5ShotAttemptsFromSlotAgainst_60",
                                       "5v5ShotAttemptsFromSlotAgainst_60_Rank",
                                       "5v5ShotsOnNetFromSlotAgainst",
                                       "5v5ShotsOnNetFromSlotAgainst_60",
                                       "5v5ShotsOnNetFromSlotAgainst_60_Rank",
                                       "5v5%ofOppositionShotAttemptsBlocked",
                                       "5v5InnerSlotShotsOnNetAgainst",
                                       "5v5InnerSlotShotsOnNetAgainst_60",
                                       "5v5InnerSlotShotsOnNetAgainst_60_Rank",
                                       "5v5PasstoSlotAgainst",
                                       "5v5PasstoSlotAgainst_60",
                                       "5v5PasstoSlotAgainst_60_Rank",
                                       "5v5NoPressureShotAttemptsFromSlotAgainst",
                                       "5v5NoPressureShotAttemptsFromSlotAgainst_60",
                                       "5v5NoPressureShotAttemptsFromSlotAgainst_60_Rank",
                                       "5v5NoPressureShotAttemptsAgainst",
                                       "5v5NoPressureShotAttemptsAgainst_60",
                                       "5v5NoPressureShotAttemptsAgainst_60_Rank",
                                       "5v5%ofShotAttemptsWithNoPressureAgainst",
                                       "5v5AveragePressureDistanceonPressuredShotAttemptsAgainst",
                                       "5v5AveragePressureDistanceonPressuredShotAttemptsAgainst_60",
                                       "5v5AveragePressureDistanceonPressuredShotAttemptsAgainst_60_Rank",
                                       "5v5DZMiddleIcePassPreventions",
                                       "5v5DZMiddleIcePassPreventions_60",
                                       "5v5DZMiddleIcePassPreventions_60_Rank",
                                       "5v5%DZReboundsRecovered",
                                       "5v52ndChance(Rebound)ShotAttemptsFromSlotAgainst",
                                       "5v52ndChance(Rebound)ShotAttemptsFromSlotAgainst_60",
                                       "5v52ndChance(Rebound)ShotAttemptsFromSlotAgainst_60_Rank",
                                       "5v5ShotAttemptsFromSlotOfftheCycleAgainst",
                                       "5v5ShotAttemptsFromSlotOfftheCycleAgainst_60",
                                       "5v5ShotAttemptsFromSlotOfftheCycleAgainst_60_Rank",
                                       "5v5ShotsOnNetFromSlotOfftheCycleAgainst",
                                       "5v5ShotsOnNetFromSlotOfftheCycleAgainst_60",
                                       "5v5ShotsOnNetFromSlotOfftheCycleAgainst_60_Rank",
                                       "5v5ShotAttemptsFromSlotOfftheRushAgainst",
                                       "5v5ShotAttemptsFromSlotOfftheRushAgainst_60",
                                       "5v5ShotAttemptsFromSlotOfftheRushAgainst_60_Rank",
                                       "5v5ShotsOnNetFromSlotOfftheRushAgainst",
                                       "5v5ShotsOnNetFromSlotOfftheRushAgainst_60",
                                       "5v5ShotsOnNetFromSlotOfftheRushAgainst_60_Rank",
                                       "5v5ShotAttemptsFromSlotOfftheForecheckAgainst",
                                       "5v5ShotAttemptsFromSlotOfftheForecheckAgainst_60",
                                       "5v5ShotAttemptsFromSlotOfftheForecheckAgainst_60_Rank",
                                       "5v5ShotsOnNetFromSlotOfftheForecheckAgainst",
                                       "5v5ShotsOnNetFromSlotOfftheForecheckAgainst_60",
                                       "5v5ShotsOnNetFromSlotOfftheForecheckAgainst_60_Rank",
                                       "5v5OddManRushesAgainst",
                                       "5v5OddManRushesAgainst_60",
                                       "5v5OddManRushesAgainst_60_Rank",
                                       "5v5%DZFace-OffsLostResultinginShotAgainst",
                                       "5v5%DZFace-OffsLostResultinginShotFromSlotAttemptAgainst",
                                       "5v5ShotAttemptsFromSlotOffofOZPlayAgainst",
                                       "5v5ShotAttemptsFromSlotOffofOZPlayAgainst_60",
                                       "5v5ShotAttemptsFromSlotOffofOZPlayAgainst_60_Rank",
                                       "5v5ShotsOnNetFromSlotOffofOZPlayAgainst",
                                       "5v5ShotsOnNetFromSlotOffofOZPlayAgainst_60",
                                       "5v5ShotsOnNetFromSlotOffofOZPlayAgainst_60_Rank")


#######################POWER PLAY#################################
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

`Powerplay_60_Rank`<-c ("5v4GoalsScored",
                   "5v4GoalsScored_60",
                   "5v4GoalsScored_60_Rank",
                   "5v4ExpectedGoalsFor",
                   "5v4ExpectedGoalsFor_60",
                   "5v4ExpectedGoalsFor_60_Rank",
                   "5v4ActualtoExpectedGoalsFor",
                   #"5v4%ShotAttemptsOnNet",
                   "5v4ShotAttemptsFromSlotFor",
                   "5v4ShotAttemptsFromSlotFor_60",
                   "5v4ShotAttemptsFromSlotFor_60_Rank",
                   "5v4ShotsOnNetFromSlotFor",
                   "5v4ShotsOnNetFromSlotFor_60",
                   "5v4ShotsOnNetFromSlotFor_60_Rank",
                   "5v4InnerSlotShotsOnNetFor",
                   "5v4InnerSlotShotsOnNetFor_60",
                   "5v4InnerSlotShotsOnNetFor_60_Rank",
                   "5v4OZShotAttemptsRecovered",
                   "5v4OZShotAttemptsRecovered_60",
                   "5v4OZShotAttemptsRecovered_60_Rank",
                   #"5v4%OZShotAttemptsRecovered",
                   #"5v4%OZReboundsRecovered",
                   "5v42ndChance(Rebound)ShotAttemptsFromSlot",
                   "5v42ndChance(Rebound)ShotAttemptsFromSlot_60",
                   "5v42ndChance(Rebound)ShotAttemptsFromSlot_60_Rank",
                   "5v4ReboundsCausedFromOutsideShots",
                   "5v4ReboundsCausedFromOutsideShots_60",
                   "5v4ReboundsCausedFromOutsideShots_60_Rank",
                   "5v4NoPressureShotAttempts",
                   "5v4NoPressureShotAttempts_60",
                   "5v4NoPressureShotAttempts_60_Rank",
                   "5v4NoPressureShotAttemptsFromSlot",
                   "5v4NoPressureShotAttemptsFromSlot_60",
                   "5v4NoPressureShotAttemptsFromSlot_60_Rank",
                   #"5v4%ofShotAttemptsWithNoPressure",
                   #"5v4%ofShotAttemptsFromSlotWithNoPressure",
                   "5v4ScreenedShotsOnNet",
                   "5v4ScreenedShotsOnNet_60",
                   "5v4ScreenedShotsOnNet_60_Rank",
                   #"5v4%ofShotsOnNetThatAreScreened",
                   #"5v4TrueShooting%(Goals/ShotAttempts)",
                   #"5v4%OZZoneTime",
                   "5v4SlotDrivingPlays",
                   "5v4SlotDrivingPlays_60",
                   "5v4SlotDrivingPlays_60_Rank",
                   "5v4PassestoSlot",
                   "5v4PassestoSlot_60",
                   "5v4PassestoSlot_60_Rank",
                   "5v4ControlledEntrySuccess%",
                   #"5v4Dump-InRate",
                   "5v4OZDump-InRecoveries",
                   "5v4OZDump-InRecoveries_60",
                   "5v4OZDump-InRecoveries_60_Rank"
                   #"5v4%OZDump-InsRecovered",
                   #"5v4OZTurnover%",
                   #"5v4OZFace-OffsWin%",
                   #"5v4%Face-OffsWonResultinginShotOnNet",
                   #"5v4%Face-OffsWonResultinginShotAttemptFromSlot"
)
#######################PENALTY KILL########################################
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

`PenaltyKill_60_Rank`<-c("4v5GoalsAgainst",
                    "4v5GoalsAgainst_60",
                    "4v5GoalsAgainst_60_Rank",
                    "4v5ExpectedGoalsAgainst",
                    "4v5ExpectedGoalsAgainst_60",
                    "4v5ExpectedGoalsAgainst_60_Rank",
                    "4v5ActualtoExpectedGoalsAgainst",
                    "4v5ActualtoExpectedGoalsAgainst_60",
                    "4v5ActualtoExpectedGoalsAgainst_60_Rank",
                    "4v5ShotAttemptsFromSlotAgainst",
                    "4v5ShotAttemptsFromSlotAgainst_60_Rank",
                    "4v5InnerSlotShotsOnNetAgainst",
                    "4v5InnerSlotShotsOnNetAgainst_60",
                    "4v5InnerSlotShotsOnNetAgainst_60_Rank",
                    "4v5NoPressureShotAttemptsFromSlotAgainst",
                    "4v5NoPressureShotAttemptsFromSlotAgainst_60",
                    "4v5NoPressureShotAttemptsFromSlotAgainst_60_Rank",
                    #"4v5%ofShotAttemptsFromSlotWithNoPressureAgainst",
                    "4v5NoPressureShotAttemptsAgainst",
                    "4v5NoPressureShotAttemptsAgainst_60",
                    "4v5NoPressureShotAttemptsAgainst_60_Rank",
                    #"4v5%ofShotAttemptsWithNoPressureAgainst",
                    "4v5ScreenedShotsOnNetAgainst",
                    "4v5ScreenedShotsOnNetAgainst_60",
                    "4v5ScreenedShotsOnNetAgainst_60_Rank",
                    #"4v5%ofShotsOnNetAgainstThatAreScreened",
                    "4v5GoalsFor",
                    "4v5GoalsFor_60",
                    "4v5GoalsFor_60_Rank",
                    "4v5DZMiddleIcePassPreventions",
                    "4v5DZMiddleIcePassPreventions_60",
                    "4v5DZMiddleIcePassPreventions_60_Rank",
                    "4v5PassestotheSlotAgainst",
                    "4v5PassestotheSlotAgainst_60",
                    "4v5PassestotheSlotAgainst_60_Rank",
                    #"4v5%ofOppositionShotAttemptsBlocked",
                    #"4v5%DZReboundsRecovered",
                    #"4v5DZEntryDenialSuccess%",
                    #"4v5Dump-InRecoveryExitSuccess%",
                    #"4v5%DZZoneTime",
                    #"4v5DZTrueTurnover%",
                    #"4v5DZTrueTakeaway%",
                    #"4v5Dump-OutRate",
                    #"4v5Dump-OutSuccess%",
                    "4v5DZLoosePuckRecoveries",
                    "4v5DZLoosePuckRecoveries_60",
                    "4v5DZLoosePuckRecoveries_60_Rank",
                    "4v5OppositionShotAttemptsRecoveredbyOpposition",
                    "4v5OppositionShotAttemptsRecoveredbyOpposition_60",
                    "4v5OppositionShotAttemptsRecoveredbyOpposition_60_Rank",
                    #"4v5%OppositionShotAttemptsRecoveredbyOpposition",
                    "4v5DZFace-OffsWin%"
                    #"4v5%DZFace-OffsWonResultinginCleanDZExit",
                    #"4v5%DZFace-OffsLostResultinginaShotAgainst"
                    #"4v5%DZFace-OffsLostResultinginaShotFromSlotAttemptAgainst"
)

#######################POSSESION TIME########################################
`CreatingOZPossession-Time`<-c("5v5OZPossessionTime",
                               "5v5%OZZoneTime",
                               "5v5OZFace-OffsWins",
                               "5v5OZFace-OffsWin%",
                               "5v5%OZFace-OffsLostResultinginCleanDZExitbyOpposition",
                               "5v5OZTrueTurnover%",
                               "5v5Dump-InRate",
                               "5v5OZDump-InAttempts",
                               "5v5OZDump-InRecoveries",
                               "5v5%OZDump-InsRecovere",
                               "5v5%OZDump-InsthatareRimDumps",
                               "5v5%OZRimDump-InsRecovered",
                               "5v5%OZDump-InsthatareCross-IceDumps",
                               "5v5%OZCross-IceDump-InsRecovered",
                               "5v5%OZDump-InsthatareSameSideDumps",
                               "5v5%OZSameSideDump-InsRecovered",
                               "5v5%OZDump-InsthatareSoftDumps",
                               "5v5%OZSoftDump-InsRecovered",
                               "5v5%OZRimDump-InOppGoalieRecoveries",
                               "5v5PressureOZDump-Ins",
                               "5v5%OZDump-InswithPressure",
                               "5v5%PressureOZDump-InsRecoveredonForecheck",
                               "5v5ControlledEntryAttempts",
                               "5v5SuccessfulControlledEntries",
                               "5v5ControlledEntrySuccess%",
                               "5v5ForecheckingSuccess%(OppositionDoesNotReachNZ)",
                               "5v5SuccessfulForecheckingPlays",
                               "5v5OZTakeaways(DefLoosePuckRecoveries)",
                               "5v5TotalOZLoosePuckRecoveries",
                               "5v5%OZShotAttemptsRecovered",
                               "5v5OZShotAttemptsRecovered",
                               "5v5BreakoutExitSuccess%(withOZPossession)",
                               "5v5ZoneExitSuccess%(withOZPossession)",
                               "5v5OZContestedLoosePuckRecoveryWin%")


`LimitingOZPossession-TimeAgainst`<-c("5v5OppositionOZPossessionTime",
                                      "5v5DZTrueTurnover%",
                                      "5v5AverageGaponEntriesAgainst",
                                      "5v5AverageGaponDump-InsAgainst",
                                      "5v5Dump-InAttemptsAgainst",
                                      "5v5Dump-InRateAgainst",
                                      "5v5DZDump-InRecoveries",
                                      "5v5%DZDump-InRecovery&Exit",
                                      "5v5SuccessfulDump-InRecoveriesbyOpposition",
                                      "5v5%DZDump-InsthatareRimDump-Ins",
                                      "5v5%DZRimDump-InRecovery&Exit",
                                      "5v5%DZDump-InsthatareCross-IceDump-Ins",
                                      "5v5%DZCross-IceDump-InRecovery&Exit",
                                      "5v5%DZDump-InsthatareSame-SideDump-Ins",
                                      "5v5%DZSame-SideDump-InRecovery&Exit",
                                      "5v5%DZDump-InsthatareSoftDump-Ins",
                                      "5v5%DZSoftDump-InRecovery&Exit",
                                      "5v5%DZRimDump-InGoalieRecoveries",
                                      "5v5PressureDZDump-InRecoveries",
                                      "5v5%DZDump-InRecoveriesUnderPressure",
                                      "5v5%PressureDZDump-InRecoverieswith1stPlaySuccessful",
                                      "5v5%PressureDZDump-InRecoverieswithCleanExit",
                                      "5v5TeamEntryDenialSuccess%",
                                      "5v5SuccessfulControlledEntriesAgainst",
                                      "5v5%OppositionShotAttemptsRecoveredbyOpposition",
                                      "5v5OppositionShotAttemptsRecoveredbyOpposition",
                                      "5v5DZTakeaways(DefLoosePuckRecoveries)",
                                      "5v5DZTakeaway%",
                                      "5v5DZContestedLoosePuckRecoveryWin%",
                                      "5v5DZFace-OffLosses",
                                      "5v5DZFace-OffWin%",
                                      "5v5%DZFace-OffsWonResultinginCleanDZExit",
                                      "5v5ForecheckingSuccess%(OppositionDoesNotReachYourDZ)",
                                      "5v5ForecheckingSuccess%(OppositionDoesNotEstablishOZPossession)",
                                      "5v5NZTakeaways(DefLoosePuckRecoveries)",
                                      "5v5NZLoosePuckRecoveries",
                                      "5v5NZDefensivePlays",
                                      "5v5%LostNZFace-OffswithRecovery",
                                      "5v5LostNZFace-OffswithRecovery")

############################PUCK MANAGEMENT######################################
`PuckManagement`<-c("5v5NZTrueTurnover%",
                    "5v5Regroups",
                    "5v5RegroupQuick-Up%",
                    "5v5RegrouptoOZPossession%",
                    "5v5RegroupResultinginShotOnNet%",
                    "5v5RegroupResultinginScoringChance%",
                    "5v5RegroupResultinginDump-In%",
                    "5v5RegroupResultinginDZorNZTurnover%",
                    "5v5RegroupResultinginCleanOZEntry%",
                    "5v5FlipDump-Outs",
                    "5v5FlipDump-Outs%",
                    "5v5Same-SideBreakout%",
                    "5v5Same-SideBreakoutAgainst%",
                    "5v5BreakoutSuccess%(ReachesNZ)",
                    "5v5BreakoutSuccess%(ReachesOZ)",
                    "5v5ZoneExitSuccess%(ReachesNZ)",
                    "5v5ZoneExitSuccess%(ReachesOZ)",
                    "5v5SuccessfulStretchPasses",
                    "5v5Dump-OutRate",
                    "5v5Dump-OutSuccess%",
                    "5v5Icings",
                    "5v5NZNorthPassCompletion%",
                    "5v5OutletPassCompletion%",
                    "5v5D2DPassCompletion%")
############################GOALTENDING######################################
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

###########################################3################################
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

#######################Create a list of teams################
Team_List <- rawData$Team %>% sort()

#Create a categories 
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

#########Function for creating dataframes############
#This fuciton takes the raw data and merges it to create a full schedule gbg list of metrics
#Based on the input strength
#This will also calculate the gbg/60 values for each applicable metric.
gbg <-function(Data1, Data2,s, GameInfo, OutputInfo, Input, Output, Team2 = NULL ) {
  TOI2 <- paste0("TOI_",s)
  merge(Data1, Data2, by = c("GameDate", "Team")) %>%
    {if (!is.null(Team2)) filter(., Team == Team2) else .} %>% 
    select(GameInfo,Input, TOI = contains(TOI2)) %>% 
    mutate_at(vars(-contains("%"),-contains("Rate"), -OutputInfo), funs(`60` = ./TOI*3600)) %>% 
    select(OutputInfo, Output)
}

season <-function(Data1, Data2,s, GameInfo,OutputInfo, Input, Output, Team2) {
  TOI2 <- paste0("TOI_",s)
  merge(Data1, Data2, by = c("GameDate", "Team")) %>% 
    select(-GameDate,-id,-SL_id,-Opponent,-Outcome, TOI = contains(TOI2)) %>%
    group_by(Team) %>% 
    summarise_all(sum, na.rm=TRUE) %>% 
    mutate_at(vars(-contains("%"),-contains("Rate"), -Team), funs(`60` = ./TOI*3600)) %>%
    mutate_at(vars(-Team), funs(`Rank` = rank(-.))) %>% 
    select(Team, Output)
}

#Run the gbg function 
  Even_GBG <- gbg(rawData,dateTable,"5v5",`5v5_info`,`Info`,`Powerplay`,`Powerplay_60`, "WPG")
  PP_GBG_WPG <- gbg(rawData,dateTable,"5v4",`5v4_info`,`Info`,`Powerplay`,`Powerplay_60`, "WPG")
  PK_GBG_WPG <- gbg(rawData,dateTable,"4v5",`4v5_info`,`Info`,`PenaltyKill`,`PenaltyKill_60`, "WPG")
  PP_GBG_NHL <- gbg(rawData,dateTable,"5v4",`5v4_info`,`Info`,`Powerplay`,`Powerplay_60`)
  PK_GBG_NHL <- gbg(rawData,dateTable,"4v5",`4v5_info`,`Info`,`PenaltyKill`,`PenaltyKill_60`)
  Even_Season <- season(rawData,dateTable,"5v4",`5v4_info`,`Info`,`Powerplay`,`Powerplay_60`, "WPG")
  PP_Season <- season(rawData,dateTable,"5v4",`5v4_info`,`Info`,`Powerplay`,`Powerplay_60_Rank`, "WPG")
  PK_Season <- season(rawData,dateTable,"4v5",`4v5_info`,`Info`,`PenaltyKill`,`PenaltyKill_60_Rank`, "WPG")

##################################Write Files##############################
  path <- "/Users/mprefontaine/True North Sports & Entertainment L/Winnipeg Jets Analytics - Documents/General/SL_Compiled"
  ###GBG####
  write.csv(PP_GBG_WPG, file.path(path, "PP_GBG_WPG.csv"), row.names=FALSE)
  write.csv(PK_GBG_WPG, file.path(path, "PK_GBG_WPG.csv"), row.names=FALSE)
  write.csv(PP_GBG_NHL, file.path(path, "PP_GBG_NHL.csv"), row.names=FALSE)
  write.csv(PK_GBG_NHL, file.path(path, "PK_GBG_NHL.csv"), row.names=FALSE)
  ####Season###
  write.csv(PP_Season, file.path(path, "PP_Season.csv"), row.names=FALSE)
  write.csv(PK_Season, file.path(path, "PK_Season.csv"), row.names=FALSE)
  ###Correlation####
  write.csv(PP_Cor, file.path(path, "PP_Cor_NHL.csv"), row.names=TRUE)
  write.csv(PK_Cor, file.path(path, "PK_Cor_NHL.csv"), row.names=TRUE)
  
  write.csv(PP_rank, file.path(path, "PP_season_rank.csv"), row.names=TRUE)


  
  
  
  
  BestWorst<-PP_Season %>%
  select(`Powerplay_60`,-Team) %>% 
  summarise_all(c(min,max)) %>% 
#########################CORRELATION STUFF######################################  
##Take a look at the collereltion between mutiple Metrics
  PP_Cor <- PP_GBG_NHL %>% 
    #select(contains("_60"), -`Info`) %>% 
    select(-contains("%"), -`Info`) %>% 
    cor(use = "complete.obs")


PK_Cor <- PK_GBG_NHL %>% 
  #select(contains("_60"), -`Info`) %>% 
  select(-contains("%"), -`Info`) %>% 
  cor(use = "complete.obs")

write.csv(PP_Cor, file.path(path, "PP_Cor.csv"), row.names=FALSE)


#####################ROll MEAN FUCTION###################
rollmean <- function(data){
  rm5 <-data %>% 
    select(-id,-SL_id)%>% 
    rename_at(vars(-GameDate), ~ paste0(.,"_05GM")) %>% 
    tq_transmute(
      select = -contains("60"),
      mutate_fun = rollapply,
      width      = 5,
      align      = "right",
      FUN        = sum,
      na.rm      = TRUE,
      )%>% 
    mutate_at(vars(-contains("%"),-contains("Rate"), -GameDate, -TOI_05GM), funs(`60` = ./TOI_05GM*3600))
  rm10 <- data %>% 
    select(-id,-SL_id)%>% 
    rename_at(vars(-GameDate), ~ paste0(.,"_10GM")) %>% 
    tq_transmute(
      select = -contains("60"),
      mutate_fun = rollapply,
      width      = 10,
      align      = "right",
      FUN        = sum,
      na.rm      = TRUE,
    )%>% 
    mutate_at(vars(-contains("%"),-contains("Rate"), -GameDate, -TOI_10GM), funs(`60` = ./TOI_10GM*3600))
  rm15 <- data %>% 
    select(-id,-SL_id)%>% 
    rename_at(vars(-GameDate), ~ paste0(.,"_15GM")) %>% 
    tq_transmute(
      select = -contains("60"),
      mutate_fun = rollapply,
      width      = 15,
      align      = "right",
      FUN        = sum,
      na.rm      = TRUE,
    ) %>% 
    mutate_at(vars(-contains("%"),-contains("Rate"), -GameDate, -TOI_15GM), funs(`60` = ./TOI_15GM*3600)) 
  
  Reduce(function(...) merge(..., all=TRUE), list(rm5, rm10, rm15)) %>% 
  select(sort(names(.))) %>% 
  select(GameDate, contains("TOI"), everything())
  }

PK_Roll = PK_GBG %>% 
  rollmean() %>%
  merge(PK_GBG) %>% 
  select(`Info`, everything(), -contains("%"))




PP_Roll = PP_GBG %>% 
  rollmean() %>%
  merge(PP_GBG) %>% 
  select(`Info`, everything(), -contains("%"))


PP_CUM <- PP_GBG %>% 
  mutate_at(vars(-Info), funs(`Cum` = cumsum(!is.na(.)))) %>% 
  select(Info, everything())


PP_CUM <- PP_GBG %>% 
  mutate(cumsum1 = cumsum(replace_na(.,"5v4GoalsScored")))


 the <- cumsum1 = cumsum(replace_na(PP_GBG,"5v4GoalsScored"))

write.csv(PK_Roll, file.path(path, "PK_Roll.csv"), row.names=FALSE)
write.csv(PP_Roll, file.path(path, "PP_Roll.csv"), row.names=FALSE)


  
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

##############################Expected Goals###############
xGF <- merge(rawData, dateTable, by = c("GameDate", "Team")) %>% 
  select(GameDate,id, SL_id ,Team,Opponent, Outcome, TOI_5v5,everything()) %>% 
  select(`5v5_info`,`Expected Goals`) %>% 
  # distinct() %>% 
  mutate_at(vars(contains("ExpectedGoals")), funs(`60` = ./TOI_5v5*3600)) %>% 
  mutate(`xGF%` = `5v5ExpectedGoalsFor_60`/(`5v5ExpectedGoalsFor_60`+`5v5ExpectedGoalsAgainst_60`))

xGF_mean<- xGF %>% 
  group_by(Team) %>% 
  summarise_all(mean, na.rm=TRUE)

WPG_xGF <- xGF %>% 
  filter(Team == "WPG") %>% 
  mutate(, mean_5 = rolling_mean("5v5ExpectedGoalsFor"))

OPP_xGF <- xGF %>% 
  filter(Team == "DET") 


rolling_mean <- rollify(mean, window = 5)

rolling_mean
######OLD PP##############
#Combine powerplay Metrics into one data frame giving full NHL gbg breakdown
PP_Raw <- merge(rawData, dateTable, by = c("GameDate", "Team")) %>% 
  select(`5v4_info`,`Powerplay`)

#Gets gbg breakdown for entire NHL
PP_GBG <- PP_Raw %>% 
  mutate_at(vars(-contains("%"), -`5v4_info`), funs(`60` = ./TOI_5v4*3600)) %>% 
  select(`5v4_info`, `Powerplay_60`)

#Gets season summary of metrics for each team
PP_Season<- PP_Raw %>% 
  select(-GameDate,-id,-SL_id,-Opponent,-Outcome) %>% 
  group_by(Team) %>% 
  summarise_all(sum, na.rm=TRUE) %>% 
  mutate_at(vars(-contains("%"),-Team), funs(`60` = ./TOI_5v4*3600)) %>% 
  select(Team, `Powerplay_60`) 

#Winnipeg GBG dataframe
WPG_PP <- PP_GBG %>% 
  filter(Team == "WPG") 

#Opponent GBG dataframe, change abbreviation
OPP_PP <- PP_60 %>% 
  filter(Team == "DET") 

##Write PP Data to local directory
write_csv(PP_sum_60, "PPdata.csv")

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

########################################Penalty Kill######################################################
#Combine PK Metrics into one data frame giving full NHL gbg breakdown
PK_Raw <- merge(rawData, dateTable, by = c("GameDate", "Team")) %>% 
  select(`4v5_info`,`PenaltyKill`)

#Adds per 60 mesures to the data frame, good for GBG analysis
PK_GBG <- PK_Raw %>% 
  mutate_at(vars(-contains("%"), -`4v5_info`), funs(`60` = ./TOI_4v5*3600)) %>% 
  select(`4v5_info`, `PenaltyKill_60`)

#Gets season summary of metrics for each team
PK_season<- PK_Raw %>% 
  select(-GameDate,-id,-SL_id,-Opponent,-Outcome) %>% 
  group_by(Team) %>% 
  summarise_all(sum, na.rm=TRUE) %>% 
  mutate_at(vars(-contains("%"),-Team), funs(`60` = ./TOI_4v5*3600)) %>% 
  select(Team, `PenaltyKill_60`) 

#Winnipeg PK GBG dataframe
WPG_PK <- PK_60 %>% 
  filter(Team == "WPG") 

#Winnipeg PK GBG dataframe
OPP_PK <- PK_60 %>% 
  filter(Team == "DET") 

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
