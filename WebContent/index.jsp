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
      <div style="text-align: left;">
        <a href="DP0init.jsp">초기데이터 등록</a><br>
        <a href="DP1medi_find.jsp">의료기관 시스템:방문고객 검색</a><br>
        <a href="DP2medi_chart.jsp">의료기관 시스템:개인 진료 내역</a><br>
        <a href="DP2medi_upload.jsp">의료기관 시스템:의무 기록 업로드</a><br>
        <a href="DP3claim_issue.jsp">스마트폰 앱(고객화면):보험금 청구서 발행</a><br>
        <a href="DP4claim_doctran.jsp">스마트폰 앱(고객화면):증명서 전송</a><br>
        <a href="DP5claim_list.jsp">H-FS:청구리스트</a><br>
      </div>
<br><br>
      <div id="messages"></div>
      <div id="logs" style="text-align: left;"></div>
      </div>
    </div>
  </div>

</body>

</html>