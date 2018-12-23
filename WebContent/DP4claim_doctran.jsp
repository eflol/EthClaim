<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!doctype html>
<html>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    HLIaddr = $('#HLIaddr').val();
    p1addr = $('#p1addr').val();
    p1pass = $('#p1pass').val();
    App.PHRInstance.getMRLength(p1addr).then(function(len) {
      //alert(len);
      var my_tbody = document.getElementById('my-tbody');
      // var row = my_tbody.insertRow(0); // 상단에 추가
      for(i = 0; i < len; i++) {
        var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        cell1.id = ""+i+"."+"1";
        cell2.id = ""+i+"."+"2";
        cell3.id = ""+i+"."+"3";
        cell4.id = ""+i+"."+"4";
      }

      if (len > 0)
      {
        App.PHRInstance.getPersonIdx(p1addr).then(function(pIdx) {
          //alert(pIdx);
          
          for(i = 0; i < len; i++) {
            App.PHRInstance.getMRtreatDate(pIdx, i).then(function(data) {
              //alert(data[0]);
              //alert(data.length);
              //alert(bin2string(data[1]));
              // data[0]에는 1번째인자가, data[1]에는 2번째인자가 byte배열로 리턴된다.
              var cell = document.getElementById(data[0]+'.1');

              //cell.innerHTML = bin2string(data[1]);
              cell.innerHTML = (data[1]);
            });
            App.PHRInstance.getMRclsData(pIdx, i).then(function(data) {
              var cell = document.getElementById(data[0]+'.2');
              //cell.innerHTML = bin2string(data[1]);
              cell.innerHTML = (data[1]);
            });
            App.PHRInstance.getMRattachKey(pIdx, i).then(function(data) {
              //var attachKey = bin2string(data[1]);
              var attachKey = (data[1]);

              var cell3 = document.getElementById(data[0]+'.3');
              cell3.innerHTML = cell3.innerHTML + '<u onclick="winOpen(\''+attachKey.substring(0,64)+'\');">(보기)</u><input type="hidden" id="attachKey'+data[0]+'.3" name="attachKey" value="'+ attachKey.substring(0,64) +'">';

              var cell = document.getElementById(data[0]+'.4');
              cell.innerHTML = '<input type="checkbox" name="doc" id="doc'+data[0]+'.4">';
              cell.class = "w3-center";
              cell.style = "text-align: center;";

            });
          }

        });
      }
    });

  }
  catch (e)
  {
    logs(e);
  }
}

function winOpen(bzzurl) {
    var tempUrl = "http://localhost:8500/bzz:/" + bzzurl;
    var option = "toolbar=no,width=500,height=500,scrollbars,menubar=no,location=no";

    window.open(tempUrl, "첨부문서", option);
}

function bin2string(uintArray) {
    var encodedString = String.fromCharCode.apply(null, uintArray);
    var decodedString = decodeURIComponent(escape(encodedString));
    //alert("encodedString " + encodedString);
    //alert("decodedString " + decodedString);
    return decodedString;
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
function doctran() {
  var infoMsg = "";
  infoMsg = infoMsg + "보험금청구를 진행합니다.   \n";
  infoMsg = infoMsg + " \n";
  var custcell1 = $('#p1addr').val();

  var my_tbody = document.getElementById('my-tbody');
  var length = my_tbody.rows.length;
  for(i = 0; i < length; i++) {
    var cell1 = document.getElementById(i+'.1');
    var cell2 = document.getElementById(i+'.2');
    var cell3val = document.getElementById('attachKey'+i+'.3').value;
    var cell4val = document.getElementById('doc'+i+'.4').checked;

    if (cell4val == true)
    {
      infoMsg = infoMsg + "고객ID : " + custcell1 + "\n";
      infoMsg = infoMsg + "진료일 : " + cell1.innerHTML + "\n";
      infoMsg = infoMsg + "증빙명 : " + cell2.innerHTML + "\n";
      infoMsg = infoMsg + "첨부키 : " + cell3val.substring(0,40) + "...\n";
      infoMsg = infoMsg + "=====================================" + "\n";
    }
  }
  alert(infoMsg);
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

<!--button onclick="add_row()">행 추가하기</button>
<button onclick="delete_row()">행 삭제하기</button-->


<body onload="">
  <div class="panel2">
    <div class="w3-card-2 w3-container">    
      <div class="w3-row-padding w3-center">  
      <h3 class="w3-left">스마트폰 앱(고객화면)</h3>
      <table class="w3-table" style="background-color: #eeeeee;">
        <tr>
          <td width=100> SC주소 </td>
          <td colspan=3><input type="text" id="scAddr" size="10" >
          </td>
        </tr>
        <tr>
          <td width=100> 개인계정 </td>
          <td><input type="text" id="p1addr" value=""><input type="button" id="btnE" class="w3-border w3-border-dark-grey" value="조회" onclick="bSearch()" >
          </td>
          <td width=100> Pass </td>
          <td><input type="password" id="p1pass" value="lap243lap" size="10">
          </td>
        </tr>
      </table>
      <br>
      </div>
    </div>
  </div>
  <div class="panel2">
    <div class="w3-card-2 w3-container">    
      <div class="w3-row-padding w3-center">  
        <table class="w3-table-all w3-card-4">
          <thead>
            <tr class="w3-black">
              <th colspan="4">증명서 전송</th>
            </tr>
            <tr class="w3-dark-grey">
              <td width=110>진료일자</td>
              <td>증빙명</td>
              <td width=60>첨부</td>
              <td width=80>전송체크</td>
            </tr>
          </thead>
          <tbody id="my-tbody">
            <!--
            <tr>
              <td>2018.10.04</td>
              <td>X레이</td>
              <td class="w3-center"><input type="checkbox" name="doc"><input type="hidden" name="attachKey"></td>
            </tr>
            <tr>
              <td>2018.10.04</td>
              <td>소견서</td>
              <td class="w3-center"><input type="checkbox" name="doc"><input type="hidden" name="attachKey"></td>
            </tr>
            <tr>
              <td>2018.10.04</td>
              <td>진료비영수증</td>
              <td class="w3-center"><input type="checkbox" name="doc"><input type="hidden" name="attachKey"></td>
            </tr>
            <tr>
              <td>2016.12.04</td>
              <td>소견서</td>
              <td class="w3-center"><input type="checkbox" name="doc"><input type="hidden" name="attachKey"></td>
            </tr>
            <tr>
              <td>2016.12.04</td>
              <td>진료비영수증</td>
              <td class="w3-center"><input type="checkbox" name="doc"><input type="hidden" name="attachKey"></td>
            </tr>
            -->
            <br>
            <br>

          </tbody>
        
        </table>       
        <br>

        <input type="button" class="w3-btn w3-white w3-border w3-border-dark-grey w3-round-large" id="attach1" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " onClick="doctran()">
        <!-- 개인블록체인ID -->        
        <br><br>
      </div>
      <div id="messages"></div>
      <div id="logs" style="text-align: left;"></div>
    </div>
  </div>
</body>
<script type="text/javascript">
  //bSearch();
</script>
</html>