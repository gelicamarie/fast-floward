# Quest 3

[View screenshots](#screenshots) 

To Test run the server + quest 3 click [here](https://github.com/gelicamarie/glossy-klilathey-B7PD)

- `W2Q3` – Hey, Where'd the Functions Go?

Look at Kibble.cdc. If you look in the `Vault` resource, you may notice the `deposit` function is gone. Similarly, the `mintTokens` function in the `Minter` resource isn't implemented. Your job is to follow the comments I wrote in the code and implement those two functions yourself. You can read the surrounding comments to also give you some hints.

Then, `yarn start` your dApp and go to the UI Harness. See if the **action card** that says "DAY 2: Kibble - Mint Tokens" works. To check if it works, go to the "DAY 1: Kibble - Get Balance" **action card** and see if Kibble was minted into the account you chose.

Note: in the `deposit` function, I ask you to use a new syntax: `as!`. You can find an example of this in KittyItems.cdc if it helps.

## Screenshots
![image](https://user-images.githubusercontent.com/66178381/128272707-d89011bb-ea92-4a00-8ea7-72a7a7fed55f.png)
