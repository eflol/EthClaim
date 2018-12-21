<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
String p1addr = request.getParameter("p1addr");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
if (p1addr == null)  { p1addr=""; }
if (name == null)  { name=""; }
if (birth == null)  { birth=""; }

%>
<!doctype html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="./js/bignumber.min.js"></script>
<script type="text/javascript" src="./js/web3.js"></script>
<script type="text/javascript" src="./js/swarm-api.min.js"></script>




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./js/jquery.min.1.12.4.js"></script>
<script src="./js/truffle-contract.js"></script>
<script src="./js/app.js"></script>


<link rel="stylesheet" type="text/css" href="./css/w3.css">
<link rel="stylesheet" type="text/css" href="./css/Roboto.css">
<link rel="stylesheet" type="text/css" href="./css/Lato.css">
<script type="text/javascript">
 
function search() {
  try
  {

    p1addr = $('#p1addr').val();    
    App.PHRInstance.getPerson(p1addr).then(function(scaddr) { 
      $.getJSON('../build/contracts/Person.json', function(data) {
        // Get the necessary contract artifact file and instantiate it with truffle-contract
        App.PersonArtifact = data;
        App.contracts.Person = TruffleContract(App.PersonArtifact);

        // Set the provider for our contract
        App.contracts.Person.setProvider(App.web3Provider);

        // 스마트컨트렉트의 주소를 가져온 person 주소로 변경
        App.contracts.Person.at(scaddr).then(function(instance) { 
          App.PersonInstance = instance; 
          //App.PersonInstance.contract.address  = scaddr;
          App.PersonInstance.getName().then(function(pData) {
            $('#name').val(pData);
          });
          App.PersonInstance.getBirth().then(function(pData) {
            $('#birth').val(pData);
          });
          App.PersonInstance.getRegistNum().then(function(pData) {
            $('#registNum').val(pData);
          });
          App.PersonInstance.getGender().then(function(pData) {
            $('#gender').val(pData);
          });
        });
      });
    });    
  }
  catch (e)
  {
    logs(e);
  }
}


  /***************************************************
    병원에서 개인의 블록체인에 의무기록을 등록한다.
    등록되는 정보 
    진료일    treatDate
    상병코드  diseaseCode
    진료과    depart
    담당의    medStaff
    첨부url   attachKey
    문서구분  cldData
  ***************************************************/
  function medRecUpload() {
    try
    {
      message('medRecUpload....');
      var addr = document.getElementById("p1addr").value; 
        
      var medOrgAddr = document.getElementById("medOrgAddr").value; 
      var treatDate = document.getElementById("treatDate").value;
      var diseaseCode = document.getElementById("diseaseCode").value;
      var depart = document.getElementById("depart").value;
      var medStaff = document.getElementById("medStaff").value;
      var clsData = document.getElementById("clsData").value;
      

      var attachKey1 = document.getElementById("txtattach1").value;      

      web3.eth.defaultAccount = medOrgAddr;
                 
      // 정보등록자(병원) 계정 인증
      if(web3.personal.unlockAccount(medOrgAddr, $('#medOrgpass').val()))
      {
        logs("medRecUpload. unlock account");
        if (attachKey1 != "") 
        {                 
          App.PHRInstance.appendMR(addr, medOrgAddr, treatDate, diseaseCode, depart, medStaff, clsData, attachKey1,{gas:3000000});  
          /*
          App.PHRInstance.getPerson(addr)
            .then(function(object) 
                  {
                    object.appendMR(medOrgAddr, treatDate, diseaseCode, depart, medStaff, clsData,attachKey1,{gas:3000000});
                  }
                  );
                  */
          message('wait....');
        } else {
          message('파일이 첨부되지 않았습니다.');
        }
      } 
      alert("업로드 되었습니다.");      
    }
    catch (e)
    {
      logs(e);
    }
  }

  function upload(){
    document.getElementById('id01').style.display='none';

    //form = document.frmsubmit;

    form = document.frmsubmit;
    form.target = "ifrm";

    form.submit();

  }
/*
  function attach(item) {
    try {
      var target = document.getElementById("txt" + item.id);

      if (item.id == "attach1") {
        target.value = 'bzz:/2020622c78075529c963538a6bbcfd571793974cb40c8770cbf07fb4f1cae5d2';
      } else if (item.id == "attach2") {
        target.value = 'bzz:/a7ca8732a38e69ec26dd3dfd0d985e549eed6f26122a985716c60a8279fd6278';
      } else if (item.id == "attach3") {
        target.value = 'bzz:/643662bcdd70191a222a0da44c99c69f60b69d301574784ac717bc97d5e50c95';
      } else if (item.id == "attach4") {
        target.value = 'bzz:/3af6e299408d81e5ca4fa9895ec343732202ae64e3335ba61f1f1eb70b3d3ebb';
      } else if (item.id == "attach5") {
        target.value = 'bzz:/34f1b928040023f6460d2638eaf34bdc91556ec0623d295647ca511d6d74d877';
      } else if (item.id == "attach6") {
        target.value = 'bzz:/2020622c78075529c963538a6bbcfd571793974cb40c8770cbf07fb4f1cae5d2';
      } else if (item.id == "attach7") {
        target.value = 'bzz:/a7ca8732a38e69ec26dd3dfd0d985e549eed6f26122a985716c60a8279fd6278';
      } else if (item.id == "attach8") {
        target.value = 'bzz:/643662bcdd70191a222a0da44c99c69f60b69d301574784ac717bc97d5e50c95';
      } else if (item.id == "attach9") {
        target.value = 'bzz:/3af6e299408d81e5ca4fa9895ec343732202ae64e3335ba61f1f1eb70b3d3ebb';
      }

      alert("파일 업로드");

      message(target.value);
    } catch (e) {
      logs(e);
    }
  }
*/
  function appOnLoad() {
    try {
      $("#treatDate").val(App.today);

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
      <h3 class="w3-left">의료기관 시스템</h3>
      <table class="w3-table" style="background-color: #eeeeee;">
        <tr>
          <td width=120> S.C </td><td><input type="text" id="scAddr" size="10" ></td>
          <td> 개인계정 </td>
          <td><input type="text" id="p1addr" size="10" value=<%=p1addr %>/><input type="button" value="개인조회" onclick="search()"></td>
        </tr>
        <tr>
          <td width=120> 병원계정 </td><td><input type="text" id="medOrgAddr" size="10"></td>
          <td width=100> Pass </td><td><input type="password" id="medOrgpass" value="lap243lap" size="10">
          </td>
        </tr>
      </table>
      <br>
      </div>
    </div>
  </div>

  <div class="panel2">
    <div class="w3-card-2 w3-container" style="min-height:360px">    
      <div class="w3-row-padding w3-center w3-margin-top " >  
        <table class="w3-table-all w3-card-4 ">
          <thead><tr class="w3-black"><th colspan="4">의무기록 업로드</th></tr></thead>
          <tbody>
            <tr>
              <th class="w3-cell-middle" >환자명</th><td>: <input type="text" id="name" class="w3-border w3-border-dark-grey" value=<%=name %> readonly="readonly" size="20" style="background-color: gray;"></td>
              <th>생년월일</th><td>: <input type="text" id="birth" class="w3-border w3-border-dark-grey" value=<%=birth %> readonly="readonly" size="20" style="background-color: gray;"></td>
            </tr>
            <tr>
              <th>진료과</th><td>: <input type="text" id="depart" class="w3-border w3-border-dark-grey" value="내과" size="20"></td>
              <th>진료의</th><td>: <input type="text" id="medStaff" class="w3-border w3-border-dark-grey" value="박성광" size="20"></td>
            </tr>
            <tr>
              <th>진료일</th><td>: <input type="text" id="treatDate" class="w3-border w3-border-dark-grey" value="" size="20"></td>
              <th>상병코드</th><td>: <input type="text" id="diseaseCode" class="w3-border w3-border-dark-grey" value="" size="20"></td>
            </tr>
          </tbody>
        
        </table>            
        <!-- 개인블록체인ID -->
        <br><br>
        <form name="frm" method="POST" action="upload.jsp" enctype="multipart/form-data">
        <table class="w3-table-all w3-card-4">
          <thead><tr class="w3-black" ><th colspan="2">문서 종류</th></tr></thead>
          <tbody>
            <tr>
            <td>
              <select class="w3-select" id="clsData" name="clsData" >
                <option value="소견서">소견서</option>
                <option value="처방전">처방전</option>
                <option value="입퇴확인서">입퇴확인서</option>
                <option value="영수증" selected>영수증</option>
                <option value="X레이">X레이</option>
                <option value="CT영상">CT영상</option>
                <option value="MRI">MRI</option>
              </select>
            </td>
            <td >: <iframe id="hidden" name="ifrm" class="w3-border w3-border-dark-grey w3-small" style="display:none;width:500px;height:30px;position:relative;top:8px"></iframe>
            <input type="text" id="txtattach1" name="txtattach1" class="w3-border w3-border-dark-grey" value="" size="40">

            <input type="button" id="attach1" class="w3-border w3-border-dark-grey" value="첨부" onclick="document.getElementById('id01').style.display='block'" >
            </td>
            </tr>
          </tbody>
        
        </table>
        <br>
        <br>

        <input type="button"  class="w3-btn w3-white w3-border w3-border-dark-grey w3-round-large"  value=" 업 로 드 " onClick="medRecUpload()">

        </form>
        
        <br><br>
        <div id="messages">
        </div>
        <div id="logs" style="text-align: left;"></div>

      </div>
    </div>
  </div>

  <div class="w3-container">
    <div id="id01" class="w3-modal">
      <div class="w3-modal-content" style="opacity: 1;">
        <header class="w3-dark-grey"> 
          <h3>&nbsp;파일 업로드 경로 지정</h3>
        </header>
        <div class="w3-container">

        <form name="frmsubmit" method="POST" action="upload.jsp" enctype="multipart/form-data">
        <input type="hidden" id="contents" name="contents" />
          <input type="file" name="file" id="file">
          <input type="button" value="upload" onClick="upload();" >
        </form>

        </div>
        <footer class="w3-dark-grey">
          <p>
          <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-black">닫기</button>
          </p>                  
        </footer>
      </div>
    </div>
  </div>
</body>
</html>