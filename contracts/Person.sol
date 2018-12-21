pragma solidity ^0.4.21;
import "./Lib.sol";
contract Person {
    address addr;
    string ID;
    string name;
    string registNum;
    string birth;
    string authDate;
    address authOrgAddr;
    int32 weight;
    int32 height;
    string gender;
    MedicalRecord[] MRs; 
    int32 numOfMR;
    
    
    constructor () public{}

    function setPerson (string pAddr, string pName, string pID, string pRegistNum, string pBirth, string pGender) public
    {
        addr = Lib.stringToAddress(pAddr);
        name = pName;
        ID = pID;
        registNum = pRegistNum;
        birth = pBirth;
        gender = pGender;
        
    }
    struct MedicalRecord {
        address medOrgAddr;
        string treatDate;
        string diseaseCode;
        string depart;
        string medStaff;
        string clsData;
        string attachKey;
    }
    
    function appendMR(string pMedOrgAddr, string pTreatDate, 
                    string pDiseaseCode, string pDepart, string pMedStaff, 
                    string pClsData, string pAttachKey) public 
    {
       // check require   
       /*
        require(pMedOrgAddr != 0x0);
        require(keccak256(pTreatDate) !=  keccak256(""));        
        require(keccak256(pDiseaseCode) !=  keccak256(""));     
        require(keccak256(pDepart) !=  keccak256(""));     
        require(keccak256(pMedStaff) !=  keccak256(""));     
        require(keccak256(pClsData) !=  keccak256(""));     
        require(keccak256(pAttachKey) !=  keccak256(""));     
        */
        
        MRs.push(MedicalRecord(Lib.stringToAddress(pMedOrgAddr), pTreatDate, pDiseaseCode, pDepart, pMedStaff, pClsData, pAttachKey));
    }
    
/*
    function getPersonRecord() public constant returns(uint8,string) {
        string memory sResult;

        sResult = Lib.mergeStrings(sResult, Lib.addressToString(addr));
        sResult = Lib.mergeStrings(sResult, name);
        sResult = Lib.mergeStrings(sResult, ID);
        sResult = Lib.mergeStrings(sResult, registNum);
        sResult = Lib.mergeStrings(sResult, birth);
        sResult = Lib.mergeStrings(sResult, authDate);

        return ( 1,  sResult);
    }

*/
    function getAddr() public constant returns(address){return addr;}
    function getName() public constant returns(string){return name;}
    function getID() public constant returns(string){return ID;}
    function getRegistNum() public constant returns(string){return registNum;}
    function getBirth() public constant returns(string){return birth;}
    function getGender() public constant returns(string){return gender;}
    
    function getMRLength() public constant returns(uint){return MRs.length;}

    function getMRtreatDate(uint idx) public constant returns(string){return MRs[idx].treatDate;}
    function getMRdiseaseCode(uint idx) public constant returns(string){return MRs[idx].diseaseCode;}
    function getMRdepart(uint idx) public constant returns(string){return MRs[idx].depart;}
    function getMRmedStaff(uint idx) public constant returns(string){return MRs[idx].medStaff;}
    function getMRclsData(uint idx) public constant returns(string){return MRs[idx].clsData;}
    function getMRattachKey(uint idx) public constant returns(string){return MRs[idx].attachKey;}
/*

    function getMRtreatDate(uint idx) public constant returns(byte[100]){return Lib.strToByte(MRs[idx].treatDate);}
    function getMRdiseaseCode(uint idx) public constant returns(byte[100]){return Lib.strToByte(MRs[idx].diseaseCode);}
    function getMRdepart(uint idx) public constant returns(byte[100]){return Lib.strToByte(MRs[idx].depart);}
    function getMRmedStaff(uint idx) public constant returns(byte[100]){return Lib.strToByte(MRs[idx].medStaff);}
    function getMRclsData(uint idx) public constant returns(byte[100]){return Lib.strToByte(MRs[idx].clsData);}
    function getMRattachKey(uint idx) public constant returns(byte[100]){return Lib.strToByte(MRs[idx].attachKey);}
*/

    
    function getMRmedOrgAddr(uint idx) public constant returns(address){return MRs[idx].medOrgAddr;}
    

}