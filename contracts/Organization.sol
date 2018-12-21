pragma solidity ^0.4.21;
import "./Lib.sol";
contract Organization {
    address addr;
    string name;
    string[] departmentList;
    string purpose;
    string[] staffs;
    //mapping (address => AcqPI) acqPIs;
    AcqPI[] acqPIs;
    
    struct AcqPI {
        string perAddr;
        string path;
        string acqDate;
        string endDate;
    }
    constructor () public{}
    
    function setOrganization (string pAddr, string pName, string pPurpose) public {
       // check require     
       /*
        require(pAddr != 0x0);
        require(keccak256(pName) !=  keccak256(""));        
        require(keccak256(purpose) !=  keccak256(""));        
        */
        
        addr = Lib.stringToAddress(pAddr);
        name = pName;
        purpose = pPurpose;
    }
    
    function appendDepartment(string pDept) public {
        //require(keccak256(pDept) !=  keccak256(""));
        departmentList.push(pDept);
    }
    
    function appendStaff(string pStaff) public {
        //require(keccak256(pStaff) !=  keccak256(""));
        staffs.push(pStaff);
    }

    function appendAcqPI(string pPerAddr,
        string pPath,
        string pAcqDate,
        string pEndDate) public 
    {
        acqPIs.push(AcqPI(pPerAddr,pPath,pAcqDate,pEndDate));
    }

    function getAddr() public constant returns(address){return addr;}
    function getName() public constant returns(string){return name;}
    function getPurpose() public constant returns(string){return purpose;}
    function getDepartmenAt(uint32 idx) public constant returns(string){return departmentList[idx];}
    function getStaffAt(uint32 idx) public constant returns(string){return staffs[idx];}

    function getAcqPIperAddrAt(uint32 idx) public constant returns(string){return acqPIs[idx].perAddr;}
    function getAcqPIpathAt(uint32 idx) public constant returns(string){return acqPIs[idx].path;}
    function getAcqPIacqDateAt(uint32 idx) public constant returns(string){return acqPIs[idx].acqDate;}
    function getAcqPIendDateAt(uint32 idx) public constant returns(string){return acqPIs[idx].endDate;}

/*
    function getAcqPIperAddr(string pAddr) public constant returns(address){return acqPIs[Lib.stringToAddress(pAddr)].perAddr;}
    function getAcqPIpath(string pAddr) public constant returns(string){return acqPIs[Lib.stringToAddress(pAddr)].path;}
    function getAcqPIacqDate(string pAddr) public constant returns(string){return acqPIs[Lib.stringToAddress(pAddr)].acqDate;}
    function getAcqPIendDate(string pAddr) public constant returns(string){return acqPIs[Lib.stringToAddress(pAddr)].endDate;}
*/
}