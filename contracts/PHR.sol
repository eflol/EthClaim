pragma solidity ^0.4.21;
import "./Person.sol";
import "./Organization.sol";
import "./Lib.sol";
contract PHR {
    Person[] persons;
    Organization[] organizations;

    event log(string str);
    event message(string str);

    function logTest() public {
        emit log("logTest");
    }
    function appendPerson(string pAddr, string pName, string pID, string pRegistNum, string pBirth, string pGender) public
    {
        emit log("PHR.appendPerson");
        emit log(pAddr);

        Person person = new Person();

        person.setPerson(pAddr, pName, pID, pRegistNum, pBirth, pGender);

        persons.push(person);

        emit message("Success");

    }

    function appendOrg(string pAddr, string pName, string pPurpose) public
    {
        emit log("PHR.appendOrg");
        // check require
        Organization org = new Organization();
        org.setOrganization(pAddr, pName, pPurpose);
        organizations.push(org);
        emit message("Success");
    }


    function getPerson(string pAddr) public constant returns(Person) {
        //emit log("PHR.getPerson");
        //emit log("pAddr");
        //emit log(pAddr);
        for (uint i=0; i < persons.length; i++) {
            if (persons[i].getAddr() == Lib.stringToAddress(pAddr)) {
                //emit log("================");
                //emit log(Lib.intToStr(int256(persons[i].getAddr())));
                //emit log(Lib.intToStr(int256(Lib.stringToAddress(pAddr))));
                return persons[i];
            }
        }
    }

    function getPersonIdx(string pAddr) public constant returns(uint32) {
        //emit log("PHR.getPersonIdx");
        for (uint32 i=0; i < persons.length; i++) {
            if (persons[i].getAddr() == Lib.stringToAddress(pAddr)) {
                return i;
            }
        }
    }
/*
    function getPersonRecord(string pAddr) public constant returns(uint8,string) {
        uint8 count = 0;

        string memory sResult;

        uint32 i = getPersonIdx(pAddr);

        sResult = Lib.mergeStrings(sResult, Lib.addressToString(persons[i].getAddr()));
        sResult = Lib.mergeStrings(sResult, persons[i].getName());
        sResult = Lib.mergeStrings(sResult, persons[i].getID());
        sResult = Lib.mergeStrings(sResult, persons[i].getRegistNum());
        sResult = Lib.mergeStrings(sResult, persons[i].getBirth());
        sResult = Lib.mergeStrings(sResult, persons[i].getGender());
        count++;

        return ( count,  sResult);
    }
*/
    function getPersonRecord(string pRegNum,string pName,string pBirth) public constant returns(uint8,string)
    {
        bool bRegNum = true;
        bool bName = true;
        bool bBirth = true;
        uint8 count = 0;

        string memory sResult;

        for (uint8 i=0; i < persons.length; i++) {
            if (keccak256(pRegNum) == keccak256("") ) {
                bRegNum = true;
            } else {
                if (keccak256(persons[i].getRegistNum()) == keccak256(pRegNum)) {
                    bRegNum = true;
                } else {
                    bRegNum = false;
                }
            }

            if (keccak256(pName) == keccak256("") ) {
                bName = true;
            } else {
                if (keccak256(persons[i].getName()) == keccak256(pName)) {
                    bName = true;
                } else {
                    bName = false;
                }
            }

            if (keccak256(pBirth) == keccak256("") ) {
                bBirth = true;
            } else {
                if (keccak256(persons[i].getBirth()) == keccak256(pBirth)) {
                    bBirth = true;
                } else {
                    bBirth = false;
                }
            }

            /* 주민번호, 이름, 생일이 모두 일치하면 아웃버퍼로 보냄 */
            if (bRegNum && bName && bBirth) {
                sResult = Lib.mergeStrings(sResult, Lib.addressToString(persons[i].getAddr()));
                sResult = Lib.mergeStrings(sResult, persons[i].getName());
                sResult = Lib.mergeStrings(sResult, persons[i].getID());
                sResult = Lib.mergeStrings(sResult, persons[i].getRegistNum());
                sResult = Lib.mergeStrings(sResult, persons[i].getBirth());
                sResult = Lib.mergeStrings(sResult, persons[i].getGender());
                count++;
            }
        }
        //return ( count,  Lib.strToByte1000(sResult));
        return ( count,  sResult);
    }

    function getOrg(string orgAddr) public constant returns(Organization) {
        //emit log("PHR.appendPerson");
        for (uint i=0; i < organizations.length; i++) {
            if (organizations[i].getAddr() == Lib.stringToAddress(orgAddr)) {
                return organizations[i];
            }
        }
    }


    function appendOrgDept(string pOrgAddr, string pDept) public
    {
        emit log("PHR.appendOrgDept");
        // check require
        getOrg(pOrgAddr).appendDepartment(pDept);
        emit message("Success");
    }

    function appendOrgStaff(string pOrgAddr, string pStaff) public
    {
        emit log("PHR.appendOrgStaff");
        // check require
        getOrg(pOrgAddr).appendStaff(pStaff);
        emit message("Success");
    }

    function appendMR(string pAddr, string pMedOrgAddr, string pTreatDate,
                    string pDiseaseCode, string pDepart, string pMedStaff,
                    string pClsData, string pAttachKey) public
    {
        //emit log("PHR.appendMR");
        //emit log("PHR.appendMR 1");

        getPerson(pAddr).appendMR(pMedOrgAddr, pTreatDate, pDiseaseCode, pDepart, pMedStaff, pClsData, pAttachKey);

        emit message("Success");
    }

    function appendAcqPI(string pOrgAddr, string pPerAddr,
        string pPath,
        string pAcqDate,
        string pEndDate) public
    {
        emit log("PHR.appendAcqPI");
        getOrg(pOrgAddr).appendAcqPI(pPerAddr,pPath,pAcqDate,pEndDate);
        emit message("Success");
    }
    function getMRLength(string pPerAddr) public constant returns(uint){return getPerson(pPerAddr).getMRLength();}

    function getMRmedOrgAddr(uint pPsIdx,uint pMRIdx) public constant returns(uint, address){return (pMRIdx, persons[pPsIdx].getMRmedOrgAddr(pMRIdx));}

    function getMRtreatDate(uint pPsIdx,uint pMRIdx) public constant  returns(uint,string){return (pMRIdx, persons[pPsIdx].getMRtreatDate(pMRIdx));}
    function getMRdiseaseCode(uint pPsIdx,uint pMRIdx) public constant returns(uint,string){return (pMRIdx, persons[pPsIdx].getMRdiseaseCode(pMRIdx));}
    function getMRdepart(uint pPsIdx,uint pMRIdx) public constant returns(uint,string){return (pMRIdx, persons[pPsIdx].getMRdepart(pMRIdx));}
    function getMRmedStaff(uint pPsIdx,uint pMRIdx) public constant returns(uint,string){return (pMRIdx, persons[pPsIdx].getMRmedStaff(pMRIdx));}
    function getMRclsData(uint pPsIdx,uint pMRIdx) public constant returns(uint,string){return (pMRIdx, persons[pPsIdx].getMRclsData(pMRIdx));}
    function getMRattachKey(uint pPsIdx,uint pMRIdx) public constant returns(uint,string){return (pMRIdx, persons[pPsIdx].getMRattachKey(pMRIdx));}
    function getMRmedOrgName(uint pPsIdx,uint pMRIdx) public constant returns(uint,string)
    {
        address orgaddr = persons[pPsIdx].getMRmedOrgAddr(pMRIdx);
        string memory org = getOrg(Lib.addressToString(orgaddr)).getName();

        return (pMRIdx, org);
    }

/*
    function getMRtreatDate(uint pPsIdx,uint pMRIdx) public constant  returns(uint, byte[100]){return (pMRIdx, persons[pPsIdx].getMRtreatDate(pMRIdx));}
    function getMRdiseaseCode(uint pPsIdx,uint pMRIdx) public constant returns(uint, byte[100]){return (pMRIdx, persons[pPsIdx].getMRdiseaseCode(pMRIdx));}
    function getMRdepart(uint pPsIdx,uint pMRIdx) public constant returns(uint, byte[100]){return (pMRIdx, persons[pPsIdx].getMRdepart(pMRIdx));}
    function getMRmedStaff(uint pPsIdx,uint pMRIdx) public constant returns(uint, byte[100]){return (pMRIdx, persons[pPsIdx].getMRmedStaff(pMRIdx));}
    function getMRclsData(uint pPsIdx,uint pMRIdx) public constant returns(uint, byte[100]){return (pMRIdx, persons[pPsIdx].getMRclsData(pMRIdx));}
    function getMRattachKey(uint pPsIdx,uint pMRIdx) public constant returns(uint, byte[100]){return (pMRIdx, persons[pPsIdx].getMRattachKey(pMRIdx));}
    function getMRmedOrgName(uint pPsIdx,uint pMRIdx) public constant returns(uint, byte[100])
    {
        address orgaddr = persons[pPsIdx].getMRmedOrgAddr(pMRIdx);
        string memory org = getOrg(Lib.addressToString(orgaddr)).getName();

        return (pMRIdx, Lib.strToByte(org));
    }
*/

/*
    function getMrRecord(uint pPsIdx,uint pMRIdx) public constant returns(uint8,string)
    {
        uint8 count = 0;

        string memory sResult;

        sResult = Lib.mergeStrings(sResult, persons[pPsIdx].getMRtreatDate(pMRIdx));
        sResult = Lib.mergeStrings(sResult, persons[pPsIdx].getMRdiseaseCode(pMRIdx));
        sResult = Lib.mergeStrings(sResult, persons[pPsIdx].getMRdepart(pMRIdx));
        sResult = Lib.mergeStrings(sResult, persons[pPsIdx].getMRmedStaff(pMRIdx));
        sResult = Lib.mergeStrings(sResult, persons[pPsIdx].getMRclsData(pMRIdx));
        sResult = Lib.mergeStrings(sResult, persons[pPsIdx].getMRattachKey(pMRIdx));

        address orgaddr = persons[pPsIdx].getMRmedOrgAddr(pMRIdx);
        string memory orgName = getOrg(Lib.addressToString(orgaddr)).getName();
        sResult = Lib.mergeStrings(sResult, orgName);
        count++;

        //return ( count,  Lib.strToByte1000(sResult));
        return ( count,  sResult);
    }

 */

}
