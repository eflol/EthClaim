
App = {
  web3Provider: null,
  contracts: {},
  PHRArtifact: null,
  OrganizationArtifact: null,
  PersonArtifact: null,
  LibArtifact: null,
  PHRInstance: null,
  OrganizationInstance: null,
  PersonInstance: null,
  LibInstance: null,
  events: null,
  elog: null,
  eMsg: null,
  today: null,

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function() {

    if (typeof web3 != 'undefined') {
        App.web3Provider = web3.currentProvider;
    } 

    else {  
      //App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');//ganache
      //App.web3Provider = new Web3.providers.HttpProvider('http://localhost:8545');//geth
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:9545');//truffle develop --log
    }

    web3 = new Web3(App.web3Provider);


    return App.initContract();
  },

  initContract: function() {

    $.getJSON('../build/contracts/PHR.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with truffle-contract
      App.PHRArtifact = data;
      App.contracts.PHR = TruffleContract(App.PHRArtifact);

      // Set the provider for our contract
      App.contracts.PHR.setProvider(App.web3Provider);

      // Use our contract to retrieve 
      App.contracts.PHR.deployed().then(function(instance) {
        App.PHRInstance = instance;

        try {
            $('#scAddr').val(App.PHRInstance.address);
            try
            {
              App.events = App.PHRInstance.allEvents();
              App.events.watch(function(error, event){      
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
              logs( 'App.events.watch' );
            }
            catch (e)
            {
              logs(e);
            }

            try
            {
              App.elog = App.PHRInstance.log();
              App.elog.watch(
                function(err, result) 
                {      
                  try
                  {
                    logs( result.args.str );
                  }
                  catch (e)
                  {
                    logs(e);
                  }
                }
              );          
              logs( 'App.elog.watch' );
            }
            catch (e)
            {
              logs(e);
            }

            try
            {

              App.eMsg = App.PHRInstance.message();
              App.eMsg.watch(
                function(err, result) 
                {
                  try {
                    message(result.args.str);
                  } catch (e) {
                    logs(e);
                  }
                }
              );              
              logs( 'App.eMsg.watch' );
            }
            catch (e)
            {
              logs(e);
            }
        } catch (e) {
          logs(e);
        }

      }).then().catch(function(err) {
        logs(err.message);
      });
      return;
    });

        
    $.getJSON('../build/contracts/Organization.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with truffle-contract
      App.OrganizationArtifact = data;
      App.contracts.Organization = TruffleContract(App.OrganizationArtifact);

      // Set the provider for our contract
      App.contracts.Organization.setProvider(App.web3Provider);

      // Use our contract to retrieve 
      App.contracts.Organization.deployed().then(function(instance) {
        App.OrganizationInstance = instance;
        $('#orgscAddr').val(App.OrganizationInstance.address);
      }).then().catch(function(err) {
        logs(err.message);
      });
      return;
    });

    $.getJSON('../build/contracts/Person.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with truffle-contract
      App.PersonArtifact = data;
      App.contracts.Person = TruffleContract(App.PersonArtifact);

      // Set the provider for our contract
      App.contracts.Person.setProvider(App.web3Provider);

      // Use our contract to retrieve 
      App.contracts.Person.deployed().then(function(instance) {
        App.PersonInstance = instance;
        $('#perscAddr').val(App.PersonInstance.address);
      }).then().catch(function(err) {
        logs(err.message);
      });
      return;
    });

    $.getJSON('../build/contracts/Lib.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with truffle-contract
      App.LibArtifact = data;
      App.contracts.Lib = TruffleContract(App.LibArtifact);

      // Set the provider for our contract
      App.contracts.Lib.setProvider(App.web3Provider);

      // Use our contract to retrieve 
      App.contracts.Lib.deployed().then(function(instance) {
        App.LibInstance = instance;
        $('#libscAddr').val(App.LibInstance.address);
      }).then().catch(function(err) {
        logs(err.message);
      });
      return;
    });


    event.preventDefault();

    //var petId = parseInt($(event.target).data('id'));

    /*
     * Replace me...
     */ 
    logs("preset");
/*

*/

    try {
      //$('#raAddr')    .val(web3.eth.accounts[1]);
      if ($('#raAddr').val() == undefined|| $('#raAddr').val() == null || $('#raAddr').val() == '') {
        $('#raAddr')    .val(web3.eth.accounts[1]);
      }
    } catch (e) {
      logs(e);
    }
    
    try {
      
      if ($('#p1addr').val() == undefined || $('#p1addr').val() == null || $('#p1addr').val() == '') {
        $('#p1addr')    .val(web3.eth.accounts[2]);
      }
       
    } catch (e) {
      logs(e);
    }
    
    
    try {
      if ($('#p2addr').val() == undefined || $('#p2addr').val() == null || $('#p2addr').val() == '') {
        $('#p2addr')    .val(web3.eth.accounts[3]);
      }
      //$('#p2addr')    .val(web3.eth.accounts[3]);
    } catch (e) {
      logs(e);
    }
    try {
      if ($('#HLIaddr').val() == undefined || $('#HLIaddr').val() == null || $('#HLIaddr').val() == '') {
        $('#HLIaddr')    .val(web3.eth.accounts[4]);
      }
      //$('#HLIaddr')    .val(web3.eth.accounts[4]);
    } catch (e) {
      logs(e);
    }
    try {
      if ($('#medOrgAddr').val() == undefined || $('#medOrgAddr').val() == null || $('#medOrgAddr').val() == '') {
        $('#medOrgAddr')    .val(web3.eth.accounts[5]);
      }
      //$('#medOrgAddr').val(web3.eth.accounts[5]);
    } catch (e) {
      logs(e);
    }
    try {
      if ($('#swarmAddr').val() == undefined || $('#swarmAddr').val() == null || $('#swarmAddr').val() == '') {
        $('#swarmAddr')    .val(web3.eth.accounts[6]);
      }
      //$('#swarmAddr').val(web3.eth.accounts[6]);
    } catch (e) {
      logs(e);
    }


    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10) { dd='0'+dd;  } 
    if(mm<10) { mm='0'+mm;  } 
    App.today = yyyy+'-'+mm+'-'+dd;

    try {
      appOnLoad();
    } catch (e) {
      null;;
    }

    return App.bindEvents();
  },

  bindEvents: function() {
    //$(document).on('click', '.btn-preset', App.presetBtn);
    $(document).on('click', '.btn-init', App.initBtn);
    $(document).on('click', '.btn-save', App.saveBtn);
  },

  presetBtn: function(event) {
    null;



  },

  initBtn: function(event) {
    event.preventDefault();

    //var petId = parseInt($(event.target).data('id'));

    /*
     * Replace me...
     */
    logs("initBtn");
    try
    {

      //var raAddress = web3.eth.accounts[0];
      //var hospitalAddress = web3.eth.accounts[1];

      var raAddress =  $('#raAddr').val();
      var hospitalAddress = $('#medOrgAddr').val();

      message('init....');
      web3.eth.defaultAccount = raAddress;
                   

        // 사용자등록, 병원등록
      if(web3.personal.unlockAccount(raAddress, $('#rapass').val()))
      {
        logs("사용자등록. unlock account");
        App.PHRInstance.appendPerson($('#p1addr').val(), "홍길동", "HONG19", "760707-1111111", "1976-07-07", "M",{gas:3000000}); 
      }        
      if(web3.personal.unlockAccount(raAddress, $('#rapass').val()))
      {
        logs("사용자등록. unlock account");
        App.PHRInstance.appendPerson($('#p2addr').val(), "홍길순", "HONG2", "760707-2111111", "1976-07-07", "F",{gas:3000000}); 
      }        
        
      if(web3.personal.unlockAccount(raAddress, $('#rapass').val()))
      {
        logs("병원등록. unlock account");
        App.PHRInstance.appendOrg($('#medOrgAddr').val(), "성모병원", "의료행위",{gas:3000000});  
      }        

      if(web3.personal.unlockAccount(raAddress, $('#rapass').val()))
      {
        logs("RA등록. unlock account");
        App.PHRInstance.appendOrg($('#raAddr').val(), "통합인증기관", "실명인증기관",{gas:3000000});  
      }        
      
      if(web3.personal.unlockAccount(raAddress, $('#rapass').val()))
      {
        logs("HLI등록. unlock account");
        App.PHRInstance.appendOrg($('#HLIaddr').val(), "한화생명", "보험사",{gas:3000000});  
      }        
      
      
      // 의사,진료과 등록(편의상 RA와 병원의 비번이 같음)
      if(web3.personal.unlockAccount(hospitalAddress, $('#medOrgpass').val()))
      {
        logs("의사등록. unlock account");
        App.PHRInstance.appendOrgStaff(hospitalAddress, "박성광", {gas:3000000}); 
        /*
        promiss = App.PHRInstance.getOrg(hospitalAddress);
        promiss.then(function( value) {
          App.OrganizationInstance.address = value;
          App.OrganizationInstance.appendStaff("박성광",{gas:3000000});
          logs("appendStaff 박성광");
        }, function(reason) {
          logs(reason);
        });
        */
      }

      if(web3.personal.unlockAccount(hospitalAddress, $('#medOrgpass').val()))
      {
        logs("의사등록. unlock account");
        App.PHRInstance.appendOrgStaff(hospitalAddress, "허준", {gas:3000000}); 
        /*
        promiss = App.PHRInstance.getOrg(hospitalAddress);
        promiss.then(function(value) {
          App.OrganizationInstance.address = value;
          App.OrganizationInstance.appendStaff("허준",{gas:3000000});
          logs("appendStaff 허준");
        }, function(reason) {
          logs(reason);
        });
        */
      }

      if(web3.personal.unlockAccount(hospitalAddress, $('#medOrgpass').val()))
      {
        logs("진료과등록. unlock account");
        App.PHRInstance.appendOrgDept(hospitalAddress, "내과", {gas:3000000}); 
        /*
        promiss = App.PHRInstance.getOrg(hospitalAddress);
        promiss.then(function(value) {
          App.OrganizationInstance.address = value;
          App.OrganizationInstance.appendDepartment("내과",{gas:3000000});
          logs("appendDept 내과");
        }, function(reason) {
          logs(reason);
        });
        */
      }

      if(web3.personal.unlockAccount(hospitalAddress, $('#medOrgpass').val()))
      {
        logs("진료과등록. unlock account");
        App.PHRInstance.appendOrgDept(hospitalAddress, "외과", {gas:3000000}); 
        /*
        promiss = App.PHRInstance.getOrg(hospitalAddress);
        promiss.then(function(value) {
          App.OrganizationInstance.address = value;
          App.OrganizationInstance.appendDepartment("외과",{gas:3000000});
          logs("appendDept 외과");
        }, function(reason) {
          logs(reason);
        });
        */
      }

    }
    catch (e)
    {
      alert(e);
      logs(e);
    }
  },

  saveBtn: function(event) {
    event.preventDefault();
    //var petId = parseInt($(event.target).data('id'));

    web3.eth.getAccounts(function(error, accounts) {
      if (error) {
        logs(error);
      }

      var account = accounts[0];
      App.contracts.PHR.deployed().then(function(instance) {
        return logs("then1");
      }).then(function(result) {
        return logs("then2");
      }).catch(function(err) {
        logs(err.message);
      });
    });
  },



};

$(function() {
  $(window).load(function() {
    App.init();
  });
});

function message($mes) {
  document.getElementById("messages").innerHTML = $mes;
  logs($mes);
}
function logs($log) {
  try
  {
    console.log($log);

    var time = new Date();
    stime = (("0" + time.getHours()).slice(-2) + ":" +  ("0" + time.getMinutes()).slice(-2) + ":" + ("0" + time.getSeconds()).slice(-2));
    document.getElementById("logs").innerHTML = stime + " - " + $log + "<br>"  + document.getElementById("logs").innerHTML;
  }
  catch (e)
  {
    null;
  }
}
