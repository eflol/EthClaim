pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;
//import "./Person.sol";
//import "./Organization.sol";
import "./Lib.sol";
contract PHR {
    struct MedicalRecord {
        string medOrgAddr;
        string treatDate;
        string diseaseCode;
        string depart;
        string medStaff;
        string clsData;
        string attachKey;
    }

    struct Person {
        string addr;
        string ID;
        string name;
        string registNum;
        string birth;
        string authDate;
        address authOrgAddr;
        uint weight;
        uint height;
        string gender;
        mapping(int => MedicalRecord) MRs;
        uint16 numOfMR;
    }

    struct AcqPI {
        string perAddr;
        string path;
        string acqDate;
        string endDate;
    }

    struct Organization {
        string addr;
        string name;
        string[] departmentList;
        string purpose;
        string[] staffs;
        //mapping (address => AcqPI) acqPIs;
        mapping(int => AcqPI) acqPIs;
        uint16 numOfPI;
    }

    Person[] persons;
    Organization[] organizations;

    event log(string str);
    event message(string str);

    function logTest() public {
        emit log("logTest");
    }
    function appendPerson(string memory pAddr, string memory pName, string memory pID, string memory pRegistNum, string memory pBirth, string memory pGender) public
    {
        emit log("PHR.appendPerson");
        //emit log(pAddr);

        Person memory ps;
        ps.addr = pAddr;
        ps.ID = pID;
        ps.name = pName;
        ps.registNum = pRegistNum;
        ps.birth = pBirth;
        ps.gender = pGender;
        ps.numOfMR = 0;
        persons.push(ps);

        emit message("appendPerson Success");

    }

    function appendOrg(string memory pAddr, string memory pName, string memory pPurpose) public
    {
        emit log("PHR.appendOrg");
        // check require
        Organization memory org;
        org.addr = pAddr;
        org.name = pName;
        org.purpose = pPurpose;
        org.numOfPI = 0;
        organizations.push(org);
        emit message("appendOrg Success");
    }


    function getPerson(string memory pAddr) public view returns(string memory) {
        //emit log("PHR.getPerson");
        //emit log("pAddr");
        //emit log(pAddr);
        string memory sResult;
        for (uint i=0; i < persons.length; i++) {
            if (Lib.equal(persons[i].addr, pAddr)) {
                //emit log("================");
                //emit log(Lib.intToStr(int256(persons[i].getAddr())));
                //emit log(Lib.intToStr(int256(Lib.stringToAddress(pAddr))));
                sResult = Lib.mergeStrings(sResult, persons[i].addr, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].name, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].ID, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].registNum, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].birth, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].gender, '|');

                return sResult;
            }
        }
    }

    function getPersonIdx(string memory pAddr) public view returns(uint16) {
        //emit log("PHR.getPersonIdx");
        for (uint16 i=0; i < persons.length; i++) {
            if (Lib.equal(persons[i].addr,pAddr)) {
                return i;
            }
        }
    }
/*
    function getPersonRecord(string memory pAddr) public view returns(uint8,string memory) {
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
    function getPersonRecord(string memory pRegNum,string memory pName,string memory pBirth) public view returns(uint8,string memory)
    {
        bool bRegNum = true;
        bool bName = true;
        bool bBirth = true;
        uint8 count = 0;

        string memory sResult;

        for (uint8 i=0; i < persons.length; i++) {
            if (Lib.equal(pRegNum,"")) {
                bRegNum = true;
            } else {
                if (Lib.equal(persons[i].registNum,pRegNum)) {
                    bRegNum = true;
                } else {
                    bRegNum = false;
                }
            }

            if (Lib.equal(pName,"") ) {
                bName = true;
            } else {
                if (Lib.equal(persons[i].name,pName)) {
                    bName = true;
                } else {
                    bName = false;
                }
            }

            if (Lib.equal(pBirth,"") ) {
                bBirth = true;
            } else {
                if (Lib.equal(persons[i].birth,pBirth)) {
                    bBirth = true;
                } else {
                    bBirth = false;
                }
            }

            /* �ֹι�ȣ, �̸�, ������ ��� ��ġ�ϸ� �ƿ���۷� ���� */
            if (bRegNum && bName && bBirth) {
                sResult = Lib.mergeStrings(sResult, persons[i].addr, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].name, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].ID, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].registNum, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].birth, '|');
                sResult = Lib.mergeStrings(sResult, persons[i].gender, '|');
                count++;
            }
        }
        //return ( count,  Lib.strToByte1000(sResult));
        return ( count,  sResult);
    }

    function getOrg(string memory orgAddr) public view returns(string memory) {
        //emit log("PHR.appendPerson");
        string memory sResult;
        for (uint i=0; i < organizations.length; i++) {
            if (Lib.equal(orgAddr, organizations[i].addr)) {
                sResult = Lib.mergeStrings(sResult, organizations[i].addr, '|');
                sResult = Lib.mergeStrings(sResult, organizations[i].name, '|');
                sResult = Lib.mergeStrings(sResult, organizations[i].purpose, '|');
                return sResult;
            }
        }
    }

    function appendOrgDept(string memory pOrgAddr, string memory pDept) public
    {
        emit log("PHR.appendOrgDept");
        // check require
        for (uint i=0; i < organizations.length; i++) {
            if (Lib.equal(pOrgAddr, organizations[i].addr)) {
                organizations[i].departmentList.push(pDept);
            }
        }
        emit message("appendOrgDept Success");
    }

    function appendOrgStaff(string memory pOrgAddr, string memory pStaff) public
    {
        emit log("PHR.appendOrgStaff");
        // check require
        for (uint i=0; i < organizations.length; i++) {
            if (Lib.equal(pOrgAddr, organizations[i].addr)) {
                organizations[i].staffs.push(pStaff);
            }
        }
        emit message("appendOrgStaff Success");
    }

    function appendMR(string memory pAddr, string memory pMedOrgAddr, string memory pTreatDate,
                    string memory pDiseaseCode, string memory pDepart, string memory pMedStaff,
                    string memory pClsData, string memory pAttachKey) public
    {
        //emit log("PHR.appendMR");
        //emit log("PHR.appendMR 1");
        for (uint i=0; i < persons.length; i++) {
            if (Lib.equal(persons[i].addr, pAddr)) {
                //emit log("================");
                //emit log(Lib.intToStr(int256(persons[i].getAddr())));
                //emit log(Lib.intToStr(int256(Lib.stringToAddress(pAddr))));
                persons[i].MRs[ persons[i].numOfMR ] = MedicalRecord(pMedOrgAddr, pTreatDate, pDiseaseCode, pDepart, pMedStaff, pClsData, pAttachKey);
                persons[i].numOfMR = persons[i].numOfMR + 1;
                emit message("appendMR Success");
                break;
            }
        }

    }

    function appendAcqPI(string memory pOrgAddr, string memory pPerAddr,
        string memory pPath,
        string memory pAcqDate,
        string memory pEndDate) public
    {
        emit log("PHR.appendAcqPI");
        for (uint i=0; i < organizations.length; i++) {
            if (Lib.equal(pOrgAddr, organizations[i].addr)) {
                organizations[i].acqPIs[organizations[i].numOfPI] = AcqPI(pPerAddr,pPath,pAcqDate,pEndDate);
                organizations[i].numOfPI = organizations[i].numOfPI + 1;
                emit message("appendAcqPI Success");
                break;
            }
        }
    }
    function getMRLength(string memory pPerAddr) public view returns(uint16){
        for (uint i=0; i < persons.length; i++) {
            if (Lib.equal(persons[i].addr, pPerAddr)) {
                return persons[i].numOfMR;
            }
        }
        return 0;
    }

    function getMRmedOrgAddr(uint pPsIdx,uint16 pMRIdx) public view returns(uint16, string memory){return (pMRIdx, persons[pPsIdx].MRs[pMRIdx].medOrgAddr);}

    function getMRtreatDate(uint pPsIdx,uint16 pMRIdx) public view  returns(uint16,string memory){return (pMRIdx, persons[pPsIdx].MRs[pMRIdx].treatDate);}
    function getMRdiseaseCode(uint pPsIdx,uint16 pMRIdx) public view returns(uint16,string memory){return (pMRIdx, persons[pPsIdx].MRs[pMRIdx].diseaseCode);}
    function getMRdepart(uint pPsIdx,uint16 pMRIdx) public view returns(uint16,string memory){return (pMRIdx, persons[pPsIdx].MRs[pMRIdx].depart);}
    function getMRmedStaff(uint pPsIdx,uint16 pMRIdx) public view returns(uint16,string memory){return (pMRIdx, persons[pPsIdx].MRs[pMRIdx].medStaff);}
    function getMRclsData(uint pPsIdx,uint16 pMRIdx) public view returns(uint16,string memory){return (pMRIdx, persons[pPsIdx].MRs[pMRIdx].clsData);}
    function getMRattachKey(uint pPsIdx,uint16 pMRIdx) public view returns(uint16,string memory){return (pMRIdx, persons[pPsIdx].MRs[pMRIdx].attachKey);}
    function getMRmedOrgName(uint pPsIdx,uint16 pMRIdx) public view returns(uint16,string memory)
    {
        string memory orgaddr = persons[pPsIdx].MRs[pMRIdx].medOrgAddr;
        string memory orgname;
        for (uint i = 0; i < organizations.length; i++) {
            if (Lib.equal(orgaddr, organizations[i].addr)) {
                orgname = organizations[i].name;
            }
        }
        return (pMRIdx, orgname);
    }
/*
    function getMrRecord(uint pPsIdx,uint pMRIdx) public view returns(uint8,string memory)
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
