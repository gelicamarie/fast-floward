# Quest 2

[View screenshots](#screenshots)

To Test run the server + quest 2 click [here](https://github.com/gelicamarie/fast-floward-registry-demo)

- `W3Q2` – Composability <3 Access Control

In this quest, we will be using what we learned today to modify our RegistryNFTContract. In its current implementation, you must pass in a reference to a Tenant itself (with no restrictive interfaces) to the `mintNFT` function so it can update the `Tenant` resource's `totalSupply` in the `init` function of the `NFT` resource. I want you to change this. Try and figure out a way (very similar to above) where we can define an interface that exposes a function to update `totalSupply` so we can restrict the reference we pass into `mintNFT` a little more. Once you do this, make sure you update the transactions involved in this process of minting/linking the `Tenant` resource to the public to include this resource interface.

## Screenshots

![screencapture-localhost-5000-2021-08-11-23_07_27](https://user-images.githubusercontent.com/66178381/129133039-ec8c8b4c-6fee-4d46-a8b6-874942edfc12.png)
