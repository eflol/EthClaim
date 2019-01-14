# Insurance claims(Ethereum platform)

> Based on the Blockchain PHR ecosystem,  
> Implemented a claim for insurance process with Smart Contract and dAPP.  
> web3, express, Swarm 1.8.2, solc 0.5, truffle 5.0

## `Process`

- The medical institution uploads customer medical information to the Blockchain node and Swarm server,
- When an individual (customer) inquires about medical information from Blockchain and requests insurance companies to claim insurance,
- The insurer will look up the claim list, and the insurance system will pay the insurance fee after the examination. 

## `Directory`

```text
/truffle/EthClaim       # About truffle project settings, Eclipse project settings  
├─.vscode               # VS Code setting  
├─build                 # Smart contracts compiled from truffle
│  └─contracts
├─contracts             # Smart Contract (solidity) Source .sol  
├─dApp                  # dApp  
│  ├─bin                # express bin
│  ├─node_modules
│  ├─public             # express static web resource
│  │  ├─build           # compiled contract
│  │  │  └─contracts
│  │  ├─images
│  │  ├─javascripts     # truffle, web3, jquery library(Used in dApp)
│  │  └─stylesheets     # CSS (Used in dApp)
│  ├─routes             # express routesm, url path mapping
│  └─views              # view source(ejs)
├─migrations            # js, Programs that distribute to web3 (Used in truffle)
├─test                  # truffle TEST
└─upload                # WEB file upload
```

## `Installation`

> #### EVM(go-ethreum)
> ##### geth, swarm node
> version : 1.8.2  
> Swarm doc. <https://swarm-guide.readthedocs.io/en/latest/gettingstarted.html>

> #### node modules
> ##### Contract module (truffle : solidity compile, migrate, EVM develop mode)
> truffle doc. <https://truffleframework.com/docs/truffle/reference/truffle-commands>
> ```text
> sudo npm install -g truffle
> cd <your-project-dir>
> sudo npm install
> ```
> #### dApp module(express, swarm-js)
> ```text
> cd <your-project-dir>/dApp
> sudo npm install
> ```

## `Running`

> Start swarm server
> ```cmd
> cd <your-Geth-dir>
> sudo swarm --bzzaccount <your-account-here>
> ```

> Start EVM
> ```text
> cd <your-project-dir>
> sudo npm run evm (= truffle develop --log)
> ```

> smart contract compilation  
> ```text
> // compile, migrate  
> // Copy for use in express
> sudo npm run mig (= truffle migrate --reset --network develop ; cp ./build/contracts/*.json ./dApp/public/build/contracts/.)
> ```

> WAS Start, initial data registration  
> ```text
> sudo npm start (= SET DEBUG=dApp:* & npm start) 
> ```
> Initialization Data Registration at http://localhost:3000/

## `License`

MIT
