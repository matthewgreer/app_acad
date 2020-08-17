// Work through this problem on https://leetcode.com/problems/coin-change-2/ and use the specs given there.
// Feel free to use this file for scratch work.

function change(amount, coins, memo = {}) {
  let key = amount + "-" + coins;
  if (key in memo) return memo[key];
  if (amount === 0) return 1;
  let testCoin = coins[coins.length - 1];
  let numCombos = 0;
  for (let numCoins = 0; numCoins * testCoin <= amount; numCoins++) {
    numCombos += change(amount - (numCoins * testCoin), coins.slice(0, -1), memo);
  }
  memo[key] = numCombos;
  return memo[key];
};