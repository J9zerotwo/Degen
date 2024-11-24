// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    struct ValorantSkin {
        uint256 id;
        string name;
        uint256 price;
    }

    mapping(uint256 => ValorantSkin) public skins;
    uint256[] public skinIds;

    // Mapping for skin item
    mapping(address => string[]) public skinCollection;

    constructor(address initialOwner) ERC20("Degen", "DGN") Ownable(initialOwner) {
        skins[0] = ValorantSkin(0, "Reaver Vandal", 130);
        skins[1] = ValorantSkin(1,"Sovereign Ghost", 150);
        skins[2] = ValorantSkin(2, "Arcane Sheriff",  120);
        skins[3] = ValorantSkin(3, "Spectrum Classic", 100);
        skins[4] = ValorantSkin(4,"Sentinel of Light Operator", 180);
    }

    // Mint tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    // Redeem skin item
    function redeemSkin(uint256 id) public {
        ValorantSkin memory skin = skins[id];

        // Ensure the skin exists
        require(skin.id != 0, "Skin does not exist");

        // Check if user has enough tokens
        require(balanceOf(msg.sender) >= skin.price, "Insufficient balance to redeem skin");

        // Burn tokens as payment
        _burn(msg.sender, skin.price);

        // User's collection
        skinCollection[msg.sender].push(skin.name);
    }

    // Burn token
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Transfer token
    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    // Retrieve a player's skin collection
    function SkinInventory(address user) public view returns (string[] memory) {
        return skinCollection[user];
    }

    // Retrieve Balance
    function getBalance() public view returns (uint256) {
        return this.balanceOf(msg.sender);
    }
}
