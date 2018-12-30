/* 20181230 dont use */
pragma solidity ^0.5.0;
import "./Lib.sol";
contract Organization {
    string addr;
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

    function setOrganization (string memory pAddr, string memory pName, string memory pPurpose) public {
       // check require
       /*
        require(pAddr != 0x0);
        require(keccak256(pName) !=  keccak256(""));
        require(keccak256(purpose) !=  keccak256(""));
        */

        //addr = Lib.stringToAddress(pAddr);
        addr = pAddr;
        name = pName;
        purpose = pPurpose;
    }

    function appendDepartment(string memory pDept) public {
        //require(keccak256(pDept) !=  keccak256(""));
        departmentList.push(pDept);
    }

    function appendStaff(string memory pStaff) public {
        //require(keccak256(pStaff) !=  keccak256(""));
        staffs.push(pStaff);
    }

    function appendAcqPI(string memory pPerAddr,
        string memory pPath,
        string memory pAcqDate,
        string memory pEndDate) public
    {
        acqPIs.push(AcqPI(pPerAddr,pPath,pAcqDate,pEndDate));
    }

    function getAddr() public view returns(string memory){return addr;}
    function getName() public view returns(string memory){return name;}
    function getPurpose() public view returns(string memory){return purpose;}
    function getDepartmenAt(uint32 idx) public view returns(string memory){return departmentList[idx];}
    function getStaffAt(uint32 idx) public view returns(string memory){return staffs[idx];}

    function getAcqPIperAddrAt(uint32 idx) public view returns(string memory){return acqPIs[idx].perAddr;}
    function getAcqPIpathAt(uint32 idx) public view returns(string memory){return acqPIs[idx].path;}
    function getAcqPIacqDateAt(uint32 idx) public view returns(string memory){return acqPIs[idx].acqDate;}
    function getAcqPIendDateAt(uint32 idx) public view returns(string memory){return acqPIs[idx].endDate;}

/*
    function getAcqPIperAddr(string pAddr) public pure returns(address){return acqPIs[Lib.stringToAddress(pAddr)].perAddr;}
    function getAcqPIpath(string pAddr) public pure returns(string memory){return acqPIs[Lib.stringToAddress(pAddr)].path;}
    function getAcqPIacqDate(string pAddr) public pure returns(string memory){return acqPIs[Lib.stringToAddress(pAddr)].acqDate;}
    function getAcqPIendDate(string pAddr) public pure returns(string memory){return acqPIs[Lib.stringToAddress(pAddr)].endDate;}
*/
}
