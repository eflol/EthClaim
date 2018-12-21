<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!doctype html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="./js/bignumber.min.js"></script>
<script type="text/javascript" src="./js/web3.js"></script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./js/jquery.min.1.12.4.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/truffle-contract.js"></script>
<script src="./js/app.js"></script>

<link rel="stylesheet" type="text/css" href="./css/w3.css">
<link rel="stylesheet" type="text/css" href="./css/Roboto.css">
<link rel="stylesheet" type="text/css" href="./css/Lato.css">
<script type="text/javascript">


    function logtest() {
      try
      {
        var raAddress = $('#raAddr').val();
        var hospitalAddress = $('#medOrgAddr').val();
  
        message('init....');
        web3.eth.defaultAccount = raAddress;
        // 사용자등록, 병원등록
        if(web3.personal.unlockAccount(raAddress, $('#rapass').val()))
        {
          logs("로그테스트");
          App.PHRInstance.logTest(); 
        }    
        message('-----');
      }
      catch (e)
      {
        alert(e);
        logs(e);
      }          
    }

/* app.js로 이동
    function setAccounts() 
    {
      //$(document).on('click', '.btn-adopt', App.handleAdopt);
      $('#scAddr')    .val(App.PHRInstance.address);
      $('#swarmAddr').val(web3.eth.accounts[1]);
      $('#medOrgAddr').val(web3.eth.accounts[2]);
      $('#HLIaddr')    .val(web3.eth.accounts[4]);
      $('#raAddr')    .val(web3.eth.accounts[5]);
      $('#p1addr')    .val(web3.eth.accounts[3]);
      $('#p2addr')    .val(web3.eth.accounts[6]);
    }

    function init() {
      try
      {
        var raAddress =  $('#raAddr').val();
        var hospitalAddress = $('#medOrgAddr').val();
        var p1addr = $('#p1addr').val();
        var p2addr = $('#p2addr').val();

        message('init....');
        web3.eth.defaultAccount = raAddress;
                     
          // 사용자등록, 병원등록
        if(web3.personal.unlockAccount(raAddress, document.getElementById("pass").value))
        {
          logs("사용자등록. unlock account");
          App.PHRInstance.appendPerson(p1addr, "홍길동", "HONG19", "760707-1111111", "1976-07-07", "M",{gas:3000000}); 
        }        
        if(web3.personal.unlockAccount(raAddress, document.getElementById("pass").value))
        {
          logs("사용자등록. unlock account");
          App.PHRInstance.appendPerson(p2addr, "홍길순", "HONG2", "760707-2111111", "1976-07-07", "F",{gas:3000000}); 
        }        
          
        if(web3.personal.unlockAccount(raAddress, document.getElementById("pass").value))
        {
          logs("병원등록. unlock account");
          App.PHRInstance.appendOrg(hospitalAddress, "성모병원", "의료행위",{gas:3000000});  
        }        
          
          // 의사,진료과 등록(편의상 RA와 병원의 비번이 같음)
        if(web3.personal.unlockAccount(hospitalAddress, document.getElementById("pass").value))
        {
          logs("의사등록. unlock account");
          App.PHRInstance.getOrg(hospitalAddress).appendStaff("박성광",{gas:3000000});         
        }        
        if(web3.personal.unlockAccount(hospitalAddress, document.getElementById("pass").value))
        {
          logs("의사등록. unlock account");
          App.PHRInstance.getOrg(hospitalAddress).appendStaff("박성광",{gas:3000000});
        }
        if(web3.personal.unlockAccount(hospitalAddress, document.getElementById("pass").value))
        {
          logs("진료과등록. unlock account");
          App.PHRInstance.getOrg(hospitalAddress).appendDepartment(hospitalAddress,"내과",{gas:3000000}); 
        }
        if(web3.personal.unlockAccount(hospitalAddress, document.getElementById("pass").value))
        {
          logs("진료과등록. unlock account");
          App.PHRInstance.getOrg(hospitalAddress).appendDepartment(hospitalAddress,"외과",{gas:3000000}); 
        }
        
      }
      catch (e)
      {
        alert("1");
        logs(e);
      }
    }

 
  var events;
  var elog;
  var eMsg;
  function eventInit() {
    events = App.PHRInstance.allEvents();
    alert(App.PHRInstance);
    alert(events);

    events.watch(function(error, event){      
        try
        {
          logs( event );
        }
        catch (e)
        {
          logs(e);
        }
      }
    );

    elog = App.PHRInstance.log();
    elog.watch(
      function(err, result) 
      {      
        try
        {
          alert(result);
          logs( result.args.str );
        }
        catch (e)
        {
          logs(e);
        }
      }
    );

    eMsg = App.PHRInstance.message();
    eMsg.watch(
      function(err, result) 
      {
        try {
          alert(result);
          message(result.args.str);
        } catch (e) {
          logs(e);
        }
      }
    );
    alert("eventInit");
  }
  */
</script>
<style>

body {
  font-family: "Roboto";
}

.panel2 {
  margin-top: 10px;
  margin-bottom: 10px;
  float: right;
  right: 3%;
  position: relative;
  text-align: center;
  opacity: 0.72;
  width: 95%
}

th {
   vertical-align: middle !important; 
}

td {
  text-align: left;
  vertical-align: middle !important; 
}

body::-webkit-scrollbar { 
    display: none; 
}
/*
#hidden {
  width:1px;
  height:1px;
  border:0;
  }
  */
</style>
<body>
  <div class="panel2">
    <div class="w3-card-2 w3-container">    
      <div class="w3-row-padding w3-center">  
      <h3 class="w3-left">초기 데이터 로드</h3>
      <table class="w3-table" style="background-color: #eeeeee;">
        <tr>
        </tr>
        <tr>
          <td width=100> RA </td><td><input type="text" id="raAddr" size="10" ></td>
          <td width=100> Pass </td><td><input type="password" id="rapass" value="lap243lap" size="10">
        </tr>
        <tr>
          <td width=100> 개인1 </td><td><input type="text" id="p1addr" size="10" ></td>
          <td width=100> Pass </td><td><input type="password" id="p1pass" value="lap243lap" size="10">
        </tr>
        <tr>
          <td width=100> 개인2 </td><td><input type="text" id="p2addr" size="10" ></td>
          <td width=100> Pass </td><td><input type="password" id="p2pass" value="lap243lap" size="10">
        </tr>
        <tr>
          <td width=100> 당사 </td><td><input type="text" id="HLIaddr" size="10" ></td>
          <td width=100> Pass </td><td><input type="password" id="HLIpass" value="lap243lap" size="10">
        </tr>
        <tr>
          <td width=100> 병원계정 </td><td><input type="text" id="medOrgAddr" size="10"></td>
          <td width=100> Pass </td><td><input type="password" id="medOrgpass" value="lap243lap" size="10">
        </tr>
        <tr>
          <td width=100> LIB S.C </td><td><input type="text" id="libscAddr" ></td>
          <td width=100> PER S.C </td><td><input type="text" id="perscAddr" ></td>
        </tr>
        <tr>
          <td width=100> ORG S.C </td><td><input type="text" id="orgscAddr" ></td>
          <td width=100> PHR S.C </td><td><input type="text" id="scAddr" ></td>          
        </tr>
        <tr>
          <td colspan=4>
          <input type="button" class="btn btn-default btn-init" value="초기데이터적재">
          <input type="button" value="로그test" onClick="logtest()">
          <input type="button" value="스웜test" onClick="stest()">
          <!--input type="button" value="이벤트init" onclick="eventInit()" -->
          </td>
        </tr>
      </table>
      <br>
      <div id="messages"></div>
      <div id="logs" style="text-align: left;"></div>
      </div>
    </div>
  </div>
</body>

</html>