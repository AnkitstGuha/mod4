# mod4
# DegenToken

DegenToken is an ERC20 token with additional functionality for redeeming tokens in exchange for virtual items. The contract extends the ERC20 standard from OpenZeppelin and includes functionalities for minting, transferring, burning tokens, and interacting with a virtual game store.

## Overview

The `DegenToken` contract is designed to allow users to interact with a virtual store where they can redeem tokens for various items. The contract supports:

- Token minting by the contract owner.
- Token transfer and balance checking.
- Token burning to redeem items from the virtual store.

## Contract Details

### State Variables

- `itemPrices` - A mapping from `Item` enum to the price of each item in tokens.
- `playerItems` - A mapping from player addresses to their owned items.

### Constructor

```solidity
constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
    itemPrices[Item.Profile_pic] = 200;
    itemPrices[Item.Gen_Tee] = 100;
    itemPrices[Item.Gen_Cap] = 75;
}
```

## Usage

1. **Mint Tokens**: 
   - Only the owner can mint tokens using the `mint` function.
   - **Example**: `mint(address to, uint256 amount)`

2. **Transfer Tokens**: 
   - Users can transfer tokens to others using the `transferTokens` function.
   - **Example**: `transferTokens(address _receiver, uint amount)`

3. **Check Balance**: 
   - Users can check their token balance with the `checkBalance` function.
   - **Example**: `checkBalance()`

4. **Burn Tokens**: 
   - Users can burn tokens to redeem items using the `burnTokens` function.
   - **Example**: `burnTokens(uint amount)`

5. **Game Store**: 
   - Check the item prices using the `gameStore` function.
   - **Example**: `gameStore()`

6. **Redeem Tokens**: 
   - Use the `redeemTokens` function to get items by providing a choice number.
   - **Choices**:
     - `1` for Profile_pic (costs 200 tokens)
     - `2` for Gen_Tee (costs 100 tokens)
     - `3` for Gen_Cap (costs 75 tokens)
   - **Example**: `redeemTokens(uint choice)`

7. **Get Player Items**: 
   - Retrieve your owned items with the `getPlayerItems` function.
   - **Example**: `getPlayerItems()`
