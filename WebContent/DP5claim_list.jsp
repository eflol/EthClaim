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


function bSearch() {
  try
  {
    delete_all();

    var i = 0;
    var my_tbody = document.getElementById('my-tbody');
    // var row = my_tbody.insertRow(0); // 상단에 추가
    var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    var cell7 = row.insertCell(6);
    cell1.id = ""+i+"."+"1";
    cell2.id = ""+i+"."+"2";
    cell3.id = ""+i+"."+"3";
    cell4.id = ""+i+"."+"4";
    cell5.id = ""+i+"."+"5";
    cell6.id = ""+i+"."+"6";
    cell7.id = ""+i+"."+"7";

    cell1.innerHTML = $("#todate").val();
    cell2.innerHTML = '홍길동';
    cell3.innerHTML = '760707-*******';
    cell4.innerHTML = '하나은행';
    cell5.innerHTML = '111-111-11111';
    cell6.innerHTML = '<u onclick="winOpen(\'2020622c78075529c963538a6bbcfd571793974cb40c8770cbf07fb4f1cae5d2\');">소견서</u>; &nbsp; <u onclick="winOpen(\'2020622c78075529c963538a6bbcfd571793974cb40c8770cbf07fb4f1cae5d2\');">진료비영수증</u>';
    cell6.title = "소견서;진료비영수증";

    cell7.innerHTML = '<input type="checkbox" id=doc'+i+' name="doc"><input type="hidden" name="attachKey">';
    cell7.style = "text-align: center;";

    i++;
    var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    var cell7 = row.insertCell(6);
    cell1.id = ""+i+"."+"1";
    cell2.id = ""+i+"."+"2";
    cell3.id = ""+i+"."+"3";
    cell4.id = ""+i+"."+"4";
    cell5.id = ""+i+"."+"5";
    cell6.id = ""+i+"."+"6";
    cell7.id = ""+i+"."+"7";

    cell1.innerHTML = $("#todate").val();
    cell2.innerHTML = '홍진희';
    cell3.innerHTML = '530111-*******';
    cell4.innerHTML = '신한은행';
    cell5.innerHTML = '222-222-22222';
    cell6.innerHTML = '<u onclick="winOpen(\'2020622c78075529c963538a6bbcfd571793974cb40c8770cbf07fb4f1cae5d2\');">진단서</u>; &nbsp; <u onclick="winOpen(\'2020622c78075529c963538a6bbcfd571793974cb40c8770cbf07fb4f1cae5d2\');">진료비영수증</u>';
    cell6.title = "진단서;진료비영수증";

    cell7.innerHTML = '<input type="checkbox" id=doc'+i+' name="doc"><input type="hidden" name="attachKey">';
    cell7.style = "text-align: center;";

  }
  catch (e)
  {
    logs(e);
  }
}

function claim() {
  var infoMsg = "";
  var checked = false;


  var my_tbody = document.getElementById('my-tbody');
  var length = my_tbody.rows.length;
  if (length > 0)
  {
    infoMsg = infoMsg + "보험금심사를 진행합니다.                           " + "\n";
    infoMsg = infoMsg + "                                                   " + "\n";
    for(i = 0; i < length; i++) {
      var cell1 = document.getElementById(i+'.1');
      var cell2 = document.getElementById(i+'.2');
      var cell6 = document.getElementById(i+'.6');

      var checkval = document.getElementById('doc'+i).checked;

      if (checkval == true)
      {
        infoMsg = infoMsg + "청 구 일 : " + cell1.innerHTML + "\n";
        infoMsg = infoMsg + "고 객 명 : " + cell2.innerHTML + "\n";
        infoMsg = infoMsg + "청구서류 : " + cell6.title + "\n";
        infoMsg = infoMsg + "=====================================" + "\n";
        checked = true;
      }
    }
    if (checked == false)
    {
      infoMsg = "체크된 항목이 없습니다."
    }
  } else {
    infoMsg = "조회된 항목이 없습니다."
  }

  alert(infoMsg);
}


/*
function add_row() {
  var my_tbody = document.getElementById('my-tbody');
  // var row = my_tbody.insertRow(0); // 상단에 추가
  var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);
  cell1.innerHTML = '2018.10.04';
  cell2.innerHTML = 'X레이';
  cell3.innerHTML = '<input type="checkbox" name="doc"><input type="hidden" name="attachKey">';
  cell3.style = "text-align: center;";
}
*/

function delete_row() {
  var my_tbody = document.getElementById('my-tbody');
  if (my_tbody.rows.length < 1) return;
  // my_tbody.deleteRow(0); // 상단부터 삭제
  my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
}

function delete_all() {
  var my_tbody = document.getElementById('my-tbody');
  var length = my_tbody.rows.length;
  for (i = 0; i < length; i++)
  {
    my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
  }
}

function winOpen(bzzurl) {
    var tempUrl = "http://localhost:8500/bzz:/" + bzzurl;
    var option = "toolbar=no,width=500,height=500,scrollbars,menubar=no,location=no";

    window.open(tempUrl, "첨부문서", option);
}


  function appOnLoad() {
    try {
      $("#fromdate").val(App.today.substring(0,8)+'01');
      $("#todate").val(App.today);
      //alert("appOnLoad");
    } catch (e) {
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
  border: 1px solid #888888;
  vertical-align: middle !important; 
}


</style>
<body>
  <div class="panel2">
    <div class="w3-card-2 w3-container">    
      <div class="w3-row-padding w3-center">  
      <h3 class="w3-left">H-FS</h3>
      <!--table class="w3-table" style="background-color: #eeeeee;">
        <tr>
          <td width=100> SC주소 </td>
          <td colspan=3><input type="text" id="scAddr" size="10" >
          </td>
        </tr>
        <tr>
          <td width=100> 당사계정 </td>
          <td><input type="text" id="HLIaddr" value="">
          </td>
          <td width=100> Pass </td>
          <td><input type="password" id="pass" value="lap243lap" size="10">
          </td>
        </tr>
      </table>
      <br-->
      </div>
    </div>
  </div>

  <div class="panel2">
    <div class="w3-card-2 w3-container" style="min-height:100px">    
      <div class="w3-row-padding w3-center w3-margin-top">  
        <table class="w3-table-all w3-card-4">
          <thead>
            <tr class="w3-black">
              <th colspan="8">청구리스트</th>
            </tr>
          </thead>        
        </table>            
        <table  class="w3-table" style="background-color: #eeeeee;">
            <tr >
              <th style="vertical-align: middle;" width=120>청구일자 : </th>
              <th width=150><input type="text" id="fromdate" class="w3-input w3-border" value="2018/09/05" size="2"></th>
              <th width=20>~</th>
              <th width=150><input type="text" id="todate" class="w3-input w3-border" value="2018/12/31" size="2"></th>
              <th>&nbsp;</th>
              <th class="w3-right"><input type="button" class="w3-btn w3-white w3-border w3-border-dark-grey w3-round-large" value="조회" onClick="bSearch()"></th>
            </tr>
        </table>            
        <table class="w3-table-all w3-card-4">
          <thead>
            <tr class="w3-dark-grey">
              <td>청구일자</td>
              <td>고객명</td>
              <td>주민등록번호</td>
              <td>지급은행</td>
              <td>지급계좌</td>
              <td>청구서류</td>
              <td>대상체크</td>
            </tr>
          </thead>
          <tbody id="my-tbody">
            <!--tr>
              <td>2018.10.04</td>
              <td>홍길동</td>
              <td>760707-*******</td>
              <td>하나은행</td>
              <td>111-111-11111</td>
              <td>소견서;진료비영수증</td>
              <td class="w3-center"><input type="checkbox" name="doc"><input type="hidden" name="attachKey"></td>
            </tr>
            <tr>
              <td>2018.10.03</td>
              <td>홍진희</td>
              <td>530111-*******</td>
              <td>신한은행</td>
              <td>222-222-22222</td>
              <td>진단서;진료비영수증</td>
              <td class="w3-center"><input type="checkbox" name="doc"><input type="hidden" name="attachKey"></td>
            </tr-->
          </tbody>
        
        </table>            
        <br>
        <input type="button" class="w3-btn w3-white w3-border w3-border-dark-grey w3-round-large" value="지급 심사" onClick="claim()">
        <!-- 개인블록체인ID -->        
        <br><br>
        <div id="messages"></div>
        <div id="logs" style="text-align: left;"></div>

      </div>
    </div>
  </div>    
</body>
</html>