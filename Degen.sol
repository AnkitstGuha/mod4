// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    
    enum Item { None, Profile_pic, Gen_Tee, Gen_Cap }

    struct PlayerItems {
        uint Profile_pic;
        uint Gen_Tee;
        uint Gen_Cap;
    }

    mapping(Item => uint) public itemPrices;
    mapping(address => PlayerItems) public playerItems;  // Tracks the quantity of items owned by players

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        itemPrices[Item.Profile_pic] = 200;
        itemPrices[Item.Gen_Tee] = 100;
        itemPrices[Item.Gen_Cap] = 75;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address _receiver, uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        transfer(_receiver, amount);
    }

    function checkBalance() external view returns (uint) {
        return balanceOf(msg.sender);
    }

    function burnTokens(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        burn(amount);
    }

    function gameStore() public pure returns (string memory) {
        return "1. Profile_pic NFT value = 200\n2. Gen_Tee value = 100\n3. Gen_Cap value = 75";
    }

    function redeemTokens(uint choice) external {
        require(choice > 0 && choice <= 3, "Invalid selection");
        Item item = Item(choice);

        // Update the player's inventory
        if (item == Item.Profile_pic) {
            playerItems[msg.sender].Profile_pic += 1;
            burn(200);
        } else if (item == Item.Gen_Tee) {
            playerItems[msg.sender].Gen_Tee += 1;
            burn(100);
        } else if (item == Item.Gen_Cap) {
            playerItems[msg.sender].Gen_Cap += 1;
            burn(75);
        }
    }

    function getPlayerItems() external view returns (uint Profile_pic, uint Gen_Tee, uint Gen_Cap) {
        PlayerItems storage items = playerItems[msg.sender];
        return (items.Profile_pic, items.Gen_Tee, items.Gen_Cap);
    }
}
