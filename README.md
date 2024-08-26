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

## Contract Summary

* The contract is an ERC-20 token contract named 'Degen' with the symbol 'DGN'. It includes functionalities to manage token rewards, in-game store items, and player interactions.
  
* Players can earn tokens through specific in-game actions and use them to purchase items from the in-game store.
  
* The contract supports the creation of buy and sell requests for in-game items, enabling players to trade tokens for assets and vice versa.
  
* Transactions are executed on the Avalanche blockchain, ensuring efficient and cost-effective token transfers within the gaming ecosystem.
