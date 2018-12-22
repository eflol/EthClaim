# PHR

Personal Health Record(Ethereum  platform)  
Blockchaion PHR 생태계를 기반으로  
소액보험금 간편청구 프로세스를 Smart Contract와 몇개의 dApp 화면으로 단순하게 구현해본 프로젝트입니다.

## 간략 프로세스 설명

의료기관에서 이더리움노드와 swarm서버에 고객의 의료정보를 업로드하고,  
개인(고객)이 업로드된 의료정보를 조회하여, 보험사에 보험금 청구의뢰를 하면,  
보험서에서 청구리스트를 조회하고 내부시스템에서 심사후 보험금이 지급됩니다.  

## Directory
<pre><code>
\truffle\PHR              truffle 프로젝트 설정정보, 이클립스 프로젝트 설정정보  
├─contracts               스마트컨트렉트(solidity) 소스 .sol  
├─build                   트러블에서 스마트 컨트렉트 컴파일시 생성되는 아웃풋디렉토리  
│  ├─classes  
│  └─contracts  
├─test                    truffle TEST에 사용  
├─migrations              truffle 에서 사용하는 js로 web3로 배포(블록체인 노드에 등록)하는 프로그램  
├─.settings               이클립스 프로젝트 세팅  
├─src                     WEB UI에서 사용할 Java소스 (본 프로젝트에는 필요없음)  
├─upload                  WEB 화면에서 파일업로드시 업로드화일이 임시저장되는 경로, 후에 swarm에 등록 됨  
└─WebContent              Dapp(화면) 개발 디렉토리, Dapp(truffle 연동 jsp)프로그램 존재  
    ├─backup              최초 HTML 개발버전 백업  
    ├─css                 Dapp에서 사용하는 CSS  
    ├─js                  Dapp에서 사용하는 truffle, web3, jquery 라이브러리  
    ├─META-INF              
    └─WEB-INF               
        └─lib             WAS에서 사용되는 라이브러리(파일 업로드 관련)  
</code></pre>

## 환경
<pre><code>
1. node.js(11.5.0)  
 기본경로에 설치  

2. geth(1.8.2)　
  C:\Geth에 설치가정

3. truffle(truffle@4.1.15)
  npm i truffle@4.1.15 -g
  cd C:\truffle
  truffle init (truffle 환경 초기화)
</code></pre>


## 기동절차
<pre><code>
1. swarm 기동(Change swarm account, blockchain dir)
-- cd C:\Geth
-- swarm --bzzaccount 1F9fB84c49e2e452C4EFFecB303d32ea1626f124 --datadir "c:\MiningTest" 

2. EVM 기동
-- cd C:\truffle\PHR (PHR root로 이동)
-- truffle develop --log

3. 스마트컨트렉트 배포
-- truffle migrate --network develop (컴파일 및 배포)

Invalid JSON RPC response 오류 발생시 reset하고 마이그레이트 한다.
-- truffle migrate --reset --network develop

4. 초기데이터 등록
WAS 기동 후 http://localhost:8080/WebContent/index.jsp 에 접속하여 초기데이터 등록 수행
</code></pre>
