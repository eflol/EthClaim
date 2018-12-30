/* 20181230 dont use */
pragma solidity ^0.5.0;
import "./Lib.sol";
contract Person {
    string addr;
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

    function setPerson (string memory pAddr, string memory pName, string memory pID, string memory pRegistNum, string memory pBirth, string memory pGender) public
    {
        //addr = Lib.stringToAddress(pAddr);
        addr = pAddr;
        name = pName;
        ID = pID;
        registNum = pRegistNum;
        birth = pBirth;
        gender = pGender;

    }
    struct MedicalRecord {
        string medOrgAddr;
        string treatDate;
        string diseaseCode;
        string depart;
        string medStaff;
        string clsData;
        string attachKey;
    }

    function appendMR(string memory pMedOrgAddr, string memory pTreatDate,
                    string memory pDiseaseCode, string memory pDepart, string memory pMedStaff,
                    string memory pClsData, string memory pAttachKey) public
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

        //MRs.push(MedicalRecord(Lib.stringToAddress(pMedOrgAddr), pTreatDate, pDiseaseCode, pDepart, pMedStaff, pClsData, pAttachKey));
        MRs.push(MedicalRecord(pMedOrgAddr, pTreatDate, pDiseaseCode, pDepart, pMedStaff, pClsData, pAttachKey));
    }

/*
    function getPersonRecord() public view returns(uint8,string memory) {
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
    function getAddr() public view returns(string memory){return addr;}
    function getName() public view returns(string memory){return name;}
    function getID() public view returns(string memory){return ID;}
    function getRegistNum() public view returns(string memory){return registNum;}
    function getBirth() public view returns(string memory){return birth;}
    function getGender() public view returns(string memory){return gender;}

    function getMRLength() public view returns(uint){return MRs.length;}

    function getMRtreatDate(uint idx) public view returns(string memory){return MRs[idx].treatDate;}
    function getMRdiseaseCode(uint idx) public view returns(string memory){return MRs[idx].diseaseCode;}
    function getMRdepart(uint idx) public view returns(string memory){return MRs[idx].depart;}
    function getMRmedStaff(uint idx) public view returns(string memory){return MRs[idx].medStaff;}
    function getMRclsData(uint idx) public view returns(string memory){return MRs[idx].clsData;}
    function getMRattachKey(uint idx) public view returns(string memory){return MRs[idx].attachKey;}
/*

    function getMRtreatDate(uint idx) public view returns(byte[100]){return Lib.strToByte(MRs[idx].treatDate);}
    function getMRdiseaseCode(uint idx) public view returns(byte[100]){return Lib.strToByte(MRs[idx].diseaseCode);}
    function getMRdepart(uint idx) public view returns(byte[100]){return Lib.strToByte(MRs[idx].depart);}
    function getMRmedStaff(uint idx) public view returns(byte[100]){return Lib.strToByte(MRs[idx].medStaff);}
    function getMRclsData(uint idx) public view returns(byte[100]){return Lib.strToByte(MRs[idx].clsData);}
    function getMRattachKey(uint idx) public view returns(byte[100]){return Lib.strToByte(MRs[idx].attachKey);}
*/


    function getMRmedOrgAddr(uint idx) public view returns(string memory){return MRs[idx].medOrgAddr;}


}
