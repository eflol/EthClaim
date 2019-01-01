# Insurance claims(Ethereum platform)

> Blockchain PHR 생태계를 기반으로  
> 소액보험금 간편청구 프로세스를 Smart Contract와 dApp 으로 구현한 예제 프로젝트입니다.

## `Process`

- 의료기관에서 Blockchain node와 Swarm서버에 고객의 의료정보를 업로드하고,  
- 개인(고객)이 Blockchain node에서 의료정보를 조회하여, 보험사에 보험금 청구의뢰를 하면,  
- 보험사에서 청구리스트를 조회하고, 보험시스템에서 심사 후 보험금이 지급됩니다.  

## `Directory`

```text
\truffle\EthClaim     # truffle 프로젝트 설정정보, 이클립스 프로젝트 설정정보  
├─.vscode             # VS Code setting  
├─build               # truffle 에서 Smart Contract compile 시 생성되는 아웃풋디렉토리  
│  └─contracts
├─contracts           # Smart Contract(solidity) 소스 .sol  
├─dApp                # dApp(화면) 개발 디렉토리, dApp(truffle 연동 jsp)프로그램 존재  
│  ├─bin              # express bin
│  ├─node_modules
│  ├─public           # express static web resource
│  │  ├─build         # compiled contract
│  │  │  └─contracts
│  │  ├─images
│  │  ├─javascripts   # dApp에서 사용하는 truffle, web3, jquery 라이브러리  
│  │  └─stylesheets   # dApp에서 사용하는 CSS  
│  ├─routes           # express routesm, url path mapping
│  └─views            # view source(ejs)
├─migrations          # truffle 에서 사용하는 js로 web3로 배포(블록체인 노드에 등록)하는 프로그램  
├─test                # truffle TEST에 사용  
└─upload              # WEB 화면에서 file upload 시 file이 임시 저장되는 경로, system call에 의해 Swarm 서버에 전송 됨  
```

## `Installation`

### go-ethreum(EVM)

> #### geth, swarm node
> version : 1.8.2  
> Swarm doc. <https://swarm-guide.readthedocs.io/en/latest/gettingstarted.html>

### node modules

#### truffle(Smart Contract Development Framework)

> #### solidity compile, migrate, EVM develop mode
> truffle doc. <https://truffleframework.com/docs/truffle/reference/truffle-commands>
> ```text
> cd <your-project-dir>
> npm install
> ```

#### express, swarm-js

> #### dApp module
> ```text
> cd <your-project-dir>/dApp
> npm install
> ```

## `기동절차`

### 1. swarm 기동

> ```text
> cd <your-Geth-dir>
> swarm --bzzaccount <your-account-here> --datadir "<your-blockchain-dir>"
> ```

### 2. EVM 기동

> ```text
> cd <your-project-dir>
> npm run evm (= truffle develop --log)
> ```

### 3. 스마트컨트렉트 배포

> #### compile, migrate
> #### express에서 사용할수 있도록 copy
> ```text
> npm run mig (= truffle migrate --reset --network develo ; cp .\build\contracts\*.json .\dApp\public\build\contracts\.)
> ```

### 4. 초기데이터 등록

> #### 초기데이터 등록 수행
> ```text
> npm start (= SET DEBUG=dApp:* & npm start)
> ```
> http://localhost:3000/ 에서 초기화데이터 등록

## `License`

### MIT
