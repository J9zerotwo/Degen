# DegenToken Smart Contract

## Description
The **DegenToken** smart contract is an Ethereum-based implementation of a custom ERC20 token with additional functionality for tokenized assets. Built on Solidity `^0.8.18`, this contract uses OpenZeppelin's `ERC20` and `Ownable` libraries to ensure secure and standard-compliant token management. The contract introduces an in-app marketplace for virtual skins inspired by **Valorant**, where users can redeem in-game skins using DegenTokens (DGN).

---

## Key Features

### 1. **ERC20 Token Functionality**
- **Token Name:** Degen
- **Token Symbol:** DGN
- **Decimals:** 0 (non-divisible token)
- **Owner Privileges:**  
  - Mint tokens for users.  
  - Initialize and manage the contract.

### 2. **Virtual Skin Marketplace**
- Skins are modeled as structs with:
  - `id` - Unique identifier.
  - `name` - The name of the skin.
  - `price` - Price in DGN tokens.
- A mapping stores predefined skins (`skins`) and their IDs.
- Players can redeem skins using DGN tokens, which burns the equivalent amount from their balance.
- A player's redeemed skins are recorded in `skinCollection`.

### 3. **Custom Functionalities**
- **Minting:** The owner can mint tokens to any address.
- **Burning:** Users can destroy their own tokens.
- **Token Transfers:** Supports standard token transfer functionality.
- **Skin Inventory Retrieval:** Users can view their owned skins through the `SkinInventory` function.

### 4. **Security and Validation**
- Only the owner can mint new tokens.
- Skins must exist in the predefined marketplace to be redeemed.
- Users need sufficient DGN tokens to redeem skins, validated at the time of redemption.

