import Foundation
import SwiftUI

func goalReacher (actualValue: Double, goalValue: Double, alreadyReached: Double, amountOfMoneyEarned: Double) -> (Double, Double) {
    var AmountOfMoneyEarned = 0.0
    var AlreadyReached = 0.0
    if (actualValue >= goalValue) && alreadyReached == 0.0 {
        AmountOfMoneyEarned = amountOfMoneyEarned
        AlreadyReached = 1.0
    } else if (actualValue < goalValue) && alreadyReached == 1.0 {
        AmountOfMoneyEarned -= amountOfMoneyEarned
        AlreadyReached = 0.0
    }
    return (AmountOfMoneyEarned, AlreadyReached)
}

func goalReached (actualValue: Int, goalValue: Int, alreadyReached: Double, amountOfMoneyEarned: Double) -> (Double, Double) {
    var AmountOfMoneyEarned = 0.0
    var AlreadyReached = 0.0
    if (actualValue >= goalValue) && alreadyReached == 0.0 {
        AmountOfMoneyEarned = amountOfMoneyEarned
        AlreadyReached = 1.0
    } else if (actualValue < goalValue) && alreadyReached == 1.0 {
        AmountOfMoneyEarned -= amountOfMoneyEarned
        AlreadyReached = 0.0
    }
    return (AmountOfMoneyEarned, AlreadyReached)
}
