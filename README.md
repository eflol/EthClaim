# Insurance claims(Ethereum platform)

> Insurance claims(Ethereum platform)  
> Blockchain PHR 생태계를 기반으로  
> 소액보험금 간편청구 프로세스를 Smart Contract와 몇 개의 dApp 화면으로 단순하게 구현해본 프로젝트입니다.

## `Process`

- 의료기관에서 이더리움노드와 Swarm서버에 고객의 의료정보를 업로드하고,  
- 개인(고객)이 블록체인에서 의료정보를 조회하여, 보험사에 보험금 청구의뢰를 하면,  
- 보험사에서 청구리스트를 조회하고, 보험시스템에서 심사 후 보험금이 지급됩니다.  

## `Directory`

```text
\truffle\EthClaim  # truffle 프로젝트 설정정보, 이클립스 프로젝트 설정정보  
├─contracts        # Smart Contract(solidity) 소스 .sol  
├─build            # truffle 에서 Smart Contract compile 시 생성되는 아웃풋디렉토리  
│  ├─classes  
│  └─contracts  
├─test             # truffle TEST에 사용  
├─migrations       # truffle 에서 사용하는 js로 web3로 배포(블록체인 노드에 등록)하는 프로그램  
├─.settings        # eclipse project setting  
├─src              # WEB UI에서 사용할 Java소스 (본 프로젝트에는 필요없음)  
├─upload           # WEB 화면에서 file upload 시 file이 임시 저장되는 경로, system call에 의해 Swarm 서버에 전송 됨  
└─WebContent       # dApp(화면) 개발 디렉토리, dApp(truffle 연동 jsp)프로그램 존재  
    ├─backup       # 최초 HTML 개발버전 백업  
    ├─css          # dApp에서 사용하는 CSS  
    ├─js           # dApp에서 사용하는 truffle, web3, jquery 라이브러리  
    ├─META-INF
    └─WEB-INF
        └─lib      # WAS에서 사용되는 라이브러리(파일 업로드 관련)  
```

## `Development`

package.json 참고

### node.js

버전 : 11.5.0  `기본경로에 설치`  

### geth

버전 : 1.8.2  

### truffle

버전 : 4.1.15

```text
npm i truffle@4.1.15 -g
```

## `기동절차`

### 1. swarm 기동

Change swarm account, blockchain dir

```text
cd C:\Geth
swarm --bzzaccount 1F9fB84c49e2e452C4EFFecB303d32ea1626f124 --datadir "c:\MiningTest"
```

### 2. EVM 기동

EthClaim root로 이동한 후 EVM 기동

```text
cd C:\truffle\EthClaim  
truffle develop --log
```

### 3. 스마트컨트렉트 배포

컴파일 및 배포

```text
truffle migrate --network develop
```

Invalid JSON RPC response 오류 발생시 reset하고 마이그레이트 한다.

```text
truffle migrate --reset --network develop
```

### 4. 초기데이터 등록

초기데이터 등록 수행

```text
WAS 기동
http://localhost:8080/WebContent/index.jsp 에서 초기화데이터 등록 버튼
```

## `License`

MIT
