num nextPointCost(
    num startingCost, num costIncrease, num pointsBought, num max) {
  if (pointsBought >= max) {
    return -1;
  } else {
    return startingCost + pointsBought * costIncrease;
  }
}

num cumulativePointCost(
    num startingCost, num costIncrease, num pointsBought, num max) {
  if (pointsBought > max) {
    return -1;
  } else {
    return (pointsBought *
            (2 * startingCost + (pointsBought - 1) * costIncrease)) /
        2;
  }
}
